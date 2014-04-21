package cn.easycms.directive;

import cn.easycms.base.BaseDirective;
import cn.easycms.model.Channel;
import cn.easycms.model.Site;
import cn.easycms.model.Template;
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
 * Descriptioni:栏目循环标签
 * 参数
 * siteId       站点id
 * parId        父亲栏目id，(1)空NULL，所有栏目；（2）""，一级栏目；（3）“parId”，该id下的栏目
 * navigation   是否导航 （1）空NULL，所有；（2）“1”，是；（3）“0”：否。
 * state        是否有效 （1）空NULL，所有；（2）“1”，是，（3）“0”：否。
 * 返回值
 * channel      栏目对象
 * 使用实例
 * <@channelList siteId="${site.id}";channel></!--";"以后表示的是下面循环输出的变量名称，正如下面的channel-->
 *  <td class="index_menu index_menu_jg">|</td>
 *  <td class="index_menu index_menu1"><a href="#">${channel.name}</a></td>
 * </@channelList>
 * Created by hackingwu on 2014/4/14.
 */
public class ChannelListDirective extends BaseDirective implements TemplateDirectiveModel{

    private ChannelService channelService;
    private SiteService    siteService;

    public void setChannelService(ChannelService channelService) {
        this.channelService = channelService;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {

        String siteId = getParam(params,"siteId");
        String parId  = getParam(params,"parId");
        String state  = getParam(params,"state");
        String navigation = getParam(params,"navigation");
        Writer out    = env.getOut();
        if (body!=null){
            if (loopVars != null && loopVars.length>0 && StringUtil.isNotEmpty(siteId)){
                Site site = siteService.findById(siteId);
                List<Channel> channelList = channelService.findBySiteAndParAndStateAndNavi(
                        site, parId, state, navigation
                );
                if (channelList!=null && channelList.size()>0){
                    int i = 0;
                    for (Channel channel:channelList){
                        if (site!=null){
                            channel.setSitePath(env.getDataModel().get("contextPath").toString()+
                                    "site/"+site.getSourcePath()+"/"
                            );
                        }
                        loopVars[0] = new BeanModel(channel,new BeansWrapper());
                        if (loopVars.length>1){
                            loopVars[1] = new SimpleNumber(i);
                        }
                        body.render(env.getOut());
                        i++;
                    }

                }
            }
        }
    }
}
