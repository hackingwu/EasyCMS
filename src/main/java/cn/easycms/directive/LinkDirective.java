package cn.easycms.directive;

import cn.easycms.base.BaseDirective;
import cn.easycms.model.Link;
import cn.easycms.service.LinkService;
import cn.easycms.service.SiteService;
import freemarker.core.Environment;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.*;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

/**
 * Description:链接标签
 * classId     分类id
 * pageMark    多个页面的标识
 * classPageMark 分类页面标识
 * siteId      站点id
 * type        类型，1下拉，2图片，3文字
 * num         数量
 * 返回值       link链接对象
 * index       索引
 * Created by hackingwu on 2014/4/17.
 */
public class LinkDirective extends BaseDirective implements TemplateDirectiveModel {
    private LinkService linkService;
    private SiteService siteService;

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException,IOException {

        String classId = getParam(params, "classId");
        String classPageMark = getParam(params, "classPageMark");
        String pageMark = getParam(params, "pageMark");
        String siteId = getParam(params, "siteId");
        String type = getParam(params, "type");
        int num = getParam(params, "num", 1000);
        Writer out = env.getOut();
        if (body != null) {
            if (loopVars != null && loopVars.length > 0) {
                Link link = new Link();
                link.setParId(classId);
                link.setPageMarks(pageMark);
                link.setClassPageMarks(classPageMark);
                link.setSite(siteService.findById(siteId));
                link.setType(type);
                link.setIsOk("1");
                List<Link> linkList = linkService.find(link,"orderNum",1,num);
                if (linkList!=null && linkList.size()>0){
                    for (int i = 0 ; i < linkList.size();i++){
                        loopVars[0] = new BeanModel(linkList.get(i),new BeansWrapper());
                        if (loopVars.length>1){
                            loopVars[1] = new SimpleNumber(i);
                        }
                        body.render(env.getOut());
                    }
                }
            }
        }
    }
}