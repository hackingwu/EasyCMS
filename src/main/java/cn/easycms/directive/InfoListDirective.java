package cn.easycms.directive;

import cn.easycms.base.BaseDirective;
import cn.easycms.model.Channel;
import cn.easycms.model.Info;
import cn.easycms.model.Site;
import cn.easycms.service.ChannelService;
import cn.easycms.service.InfoService;
import cn.easycms.service.SiteService;
import cn.easycms.util.DateUtil;
import cn.easycms.util.StringUtil;
import freemarker.core.Environment;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.*;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Description:信息列表标签
 * 参数：
 * siteId      站点id
 * channelId   栏目id
 * channelParId 栏目父亲Id
 * num          显示数量
 * order        排序类型
 * 1 固顶有效并降序,发布时间降序(默认)
 * 2 固顶有效并降序,发布时间升序
 * 3 发布时间降序
 * 4 发布时间升序
 * titleLen     标题显示长度
 * hot          是否按点击热度倒序，1是
 * dateFormat   日期格式
 * channelPageMark 栏目页面标识
 * channelParPageMark 父栏目页面标识
 * img           是否只提取带图片的新闻 1是
 * checkOpenedtime 检查公开时限，默认不坚持  1检查
 * newdays        几天内为最新
 * Created by hackingwu on 2014/4/18.
 */
public class InfoListDirective extends BaseDirective implements TemplateDirectiveModel {
    private ChannelService channelService;
    private InfoService infoService;
    private SiteService siteService;

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    public void setInfoService(InfoService infoService) {
        this.infoService = infoService;
    }

    public void setChannelService(ChannelService channelService) {
        this.channelService = channelService;
    }

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        String siteId = getParam(params, "siteId");
        String channelId = getParam(params, "channelId");
        String channelParId = getParam(params, "channelParId");
        int num = getParam(params, "num", 10);
        String order = getParam(params, "order", "1");
        int titleLen = getParam(params, "titleLen", 0);
        int newDays = getParam(params, "newDays", 0);//是以天为单位
        String isHot = getParam(params, "isHot");
        String dateFormat = getParam(params, "dateFormate");
        String channelPageMark = getParam(params, "channelPageMark");
        String channelParPageMark = getParam(params, "channelParPageMark");
        String img = getParam(params, "img");


        Writer out = env.getOut();
        if (body != null) {
            if (loopVars != null && loopVars.length > 0) {
                Site site = siteService.findById(siteId);
                Info info = new Info();
                if (StringUtil.isNotEmpty(siteId)) {
                    info.setSite(siteId);
                }
                if (StringUtil.isNotEmpty(channelId)) {
                    info.setChannel(channelService.findById(channelId));
                }
                if (StringUtil.isNotEmpty(channelPageMark) && site != null) {

                    List<Channel> list = channelService.findListBySiteAndPageMark(site, channelPageMark);
                    info.setChannelPageMarkList(list);
                }
                if (StringUtil.isNotEmpty(channelParId) && site != null) {
                    List<Channel> channels = new ArrayList<Channel>();
                    channels.add(channelService.findById(channelParId));
                    List<Channel> sonList = channelService.findSon(site, channelParId, "1", "");
                    if (sonList != null && sonList.size() > 0) {
                        for (int i = 0; i < sonList.size(); i++) {
                            channels.add(sonList.get(i));
                        }
                    }
                    info.setChannels(channels);
                }
                if (StringUtil.isNotEmpty(channelParPageMark) && site != null) {
                    List<Channel> channels = new ArrayList<Channel>();

                    Channel channel = channelService.findBySiteAndPageMark(site, channelParPageMark);
                    if (channel != null) {
                        channels.add(channel);
                        List<Channel> sonList = channelService.findSon(site, channel.getId(), "1", "");
                        if (sonList != null && sonList.size() > 0) {
                            for (int i = 0; i < sonList.size(); i++) {
                                channels.add(sonList.get(i));
                            }
                        }
                        info.setChannels(channels);
                    }
                }
                if (StringUtil.isNotEmpty(img)) {
                    info.setImg(img);
                }
                info.setCheckOpenEndTime(getParam(params, "checkOpenedTime"));
                List<String> orderAsc = new ArrayList<String>();
                List<String> orderDesc = new ArrayList<String>();
                if ("1".equals(isHot)) {
                    orderDesc.add("clickNum");
                    orderDesc.add("addTime");
                } else {
                    if ("1".equals(order)) {
                        orderDesc.add("isTop");
                        orderDesc.add("addTime");
                    } else if ("2".equals(order)) {
                        orderDesc.add("isTop");
                        orderAsc.add("addTime");
                    } else if ("3".equals(order)) {
                        orderDesc.add("addTime");
                    } else if ("4".equals(order)) {
                        orderAsc.add("addTime");
                    }
                }
                List<Info> infoList = infoService.find(info, orderAsc, orderDesc, 1, num);
                if (infoList != null && infoList.size() > 0) {
                    int i = 0;
                    for (Info temp : infoList) {
                        if (titleLen > 0)
                            temp.setShowTitleLen(titleLen);
                        if (StringUtil.isNotEmpty(dateFormat))
                            temp.setDateFormat(dateFormat);
                        if (newDays > 0 &&
                                DateUtil.differ(temp.getAddTime(), new Date()) >
                                        newDays * (1000 * 60 * 60 * 24))//getTime()得到的时间单位是毫秒，1000*60*60*24是天和毫秒的互换
                            temp.setIsNew("1");
                        if (site != null)
                            temp.setSitePath(env.getDataModel().get("contextPath").toString() +
                                    "site/" + site.getSourcePath() + "/");
                        loopVars[0] = new BeanModel(temp, new BeansWrapper());
                        if (loopVars.length > 1) {
                            loopVars[1] = new SimpleNumber(i);
                        }
                        i++;
                        body.render(env.getOut());
                    }
                }
            }

        }
    }
}
