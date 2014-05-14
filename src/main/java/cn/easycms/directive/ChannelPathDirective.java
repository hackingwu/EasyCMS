package cn.easycms.directive;

import cn.easycms.base.BaseDirective;
import cn.easycms.model.Channel;
import cn.easycms.model.Site;
import cn.easycms.service.ChannelService;
import cn.easycms.service.SiteService;
import cn.easycms.util.StringUtil;
import freemarker.core.Environment;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.*;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

/**
 * Created by hackingwu on 5/12/14.
 * <p/>
 * <p>Title:ChannelPathDirective.java</p>
 * <p>Description:按上下级顺序提取指定栏目的所属栏目路径</p>
 * <p/>
 * 参数：
 * id        栏目ID
 * siteId    站点ID
 * pageMark  栏目页面标识
 * <p/>
 * 返回：
 * channel   栏目对象
 * index     索引
 * <p/>
 * 使用实例：
 * <p/>
 * <@channelPath siteId="${site.id}" ;channel>
 * <td>|</td>
 * <td><a href="#">${channel.name}</a></td>
 * </@channelPath>
 */
public class ChannelPathDirective extends BaseDirective implements TemplateDirectiveModel {

    private ChannelService channelService;
    private SiteService siteService;

    public void setChannelService(ChannelService channelService) {
        this.channelService = channelService;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {


        String channelId = getParam(params, "id");
        String siteId = getParam(params, "siteId");
        String pageMark = getParam(params, "pageMark");
        Site site = null;
        Writer out = env.getOut();
        if (body != null) {
            if (loopVars != null && loopVars.length > 0) {
                Channel channel = null;
                if (StringUtil.isNotEmpty(channelId))
                    channel = channelService.findById(channelId);
                else if (StringUtil.isNotEmpty(siteId) && StringUtil.isNotEmpty(pageMark)) {
                    site = siteService.findById(siteId);
                    channel = channelService.findBySiteAndPageMark(site, pageMark);
                }
                if (channel != null) {
                    List<Channel> channelList = channelService.findPath(channel.getId());
                    if (channelList != null && channelList.size() > 0) {
                        for (int i = 0; i < channelList.size(); i++) {
                            if (site != null) {
                                channelList.get(i).setSitePath(env.getDataModel().get("contextPath").toString() +
                                                "site/" + site.getSourcePath() + "/"
                                );
                            }
                            loopVars[0] = new BeanModel(channelList.get(i), new BeansWrapper());
                            if (loopVars.length > 1) {
                                loopVars[1] = new SimpleNumber(i);
                            }
                            body.render(env.getOut());
                        }
                    }
                }
            }
        }

    }
}
