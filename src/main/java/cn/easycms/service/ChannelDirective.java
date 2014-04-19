package cn.easycms.service;

import cn.easycms.base.BaseDirective;
import cn.easycms.model.Channel;
import cn.easycms.model.Site;
import cn.easycms.util.StringUtil;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.core.Environment;


import java.io.IOException;
import java.io.Writer;
import java.util.Map;

/**
 *根据栏目channelId提取栏目对象
 *id 栏目id
 *siteId 站点id
 * pageMark 栏目页面标识
 *checkHasSon 是否有子栏目
 *
 *
 * 实例：   <@channel id="b7a761e6-8308-472a-9758-1d1d5142a609" ;channel>${channel.name}</@channel>
 * Created by hackingwu on 2014/4/18.
 */
public class ChannelDirective extends BaseDirective implements TemplateDirectiveModel {
    private ChannelService channelService;
    private SiteService    siteService;

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    public void setChannelService(ChannelService channelService) {

        this.channelService = channelService;
    }
    @Override
    public void execute(Environment env,Map params,TemplateModel[] loopVars,TemplateDirectiveBody body)throws TemplateException,IOException {
        String id = getParam(params,"id");
        String siteId = getParam(params,"siteId");
        String pageMark = getParam(params,"pageMark");
        Writer out      = env.getOut();
        if (body!=null) if (loopVars != null && loopVars.length > 0) {
            Channel channel = null;
            if (StringUtil.isNotEmpty(id)) {
                channel = channelService.findById(id);
            } else if (StringUtil.isNotEmpty(siteId) && StringUtil.isNotEmpty(pageMark)) {
                channel = channelService.findBySiteAndPageMark(siteId, pageMark);
            }

            if (channel != null) {
                Site site = siteService.findById(channel.getSite().getId());
                if (site!=null){
                    channel.setSitePath(env.getDataModel().get("contextPath")+
                    "site/"+site.getSourcePath()+"/"
                    );
                }
                if ("1".equals(getParam(params,"checkHasSon"))){
                    channel.setHasChildren(channelService.hasChildren(id)?"1":"0");
                }
                loopVars[0] = new BeanModel(channel,new BeansWrapper());
                body.render(env.getOut());

            }
        }
    }
}
