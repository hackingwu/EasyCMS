package cn.easycms.service;

import cn.easycms.dao.TemplateDaoImpl;
import cn.easycms.model.Template;

/**
 * Created by hackingwu on 2014/4/8.
 */
public class TemplateService {
    private TemplateDaoImpl templateDaoImpl;

    public void setTemplateDaoImpl(TemplateDaoImpl templateDaoImpl) {
        this.templateDaoImpl = templateDaoImpl;
    }

    private String add(Template template){
        //Hibernate往数据库里赋值完ID，也会在内存中对ID赋值
        templateDaoImpl.save(template);
        return template.getId();
    }
}
