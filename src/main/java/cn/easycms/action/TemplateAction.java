package cn.easycms.action;

import antlr.StringUtils;
import cn.easycms.base.BaseAction;
import cn.easycms.model.Site;
import cn.easycms.model.Template;
import cn.easycms.service.SiteService;
import cn.easycms.service.TemplateChannelService;
import cn.easycms.service.TemplateLinkService;
import cn.easycms.service.TemplateService;
import cn.easycms.util.StringUtil;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/10.
 */
public class TemplateAction extends BaseAction {

    private TemplateService templateService;
    private TemplateChannelService templateChannelService;
    private TemplateLinkService templateLinkService;
    private SiteService siteService;
    private Site site;
    private Template template;
    private List<Template> templateList;

    public List<Template> getTemplateList() {
        return templateList;
    }

    public void setTemplateList(List<Template> templateList) {
        this.templateList = templateList;
    }

    public Template getTemplate() {
        return template;
    }

    public void setTemplate(Template template) {
        this.template = template;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public void setTemplateService(TemplateService templateService) {
        this.templateService = templateService;
    }

    public void setTemplateChannelService(TemplateChannelService templateChannelService) {
        this.templateChannelService = templateChannelService;
    }

    public void setTemplateLinkService(TemplateLinkService templateLinkService) {
        this.templateLinkService = templateLinkService;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }





    public String select(){

        if (site!=null && StringUtil.isNotEmpty(site.getId())){
            //编辑站点的时候
            site = siteService.findById(site.getId());
            if (template==null)
                template = new Template();
            templateList = templateService.findAll();

        }else{
            //添加新站点时
            templateList = templateService.findAll();
        }
        return "select";

    }
}
