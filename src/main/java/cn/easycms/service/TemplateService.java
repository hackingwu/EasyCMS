package cn.easycms.service;

import cn.easycms.dao.TemplateDaoImpl;
import cn.easycms.model.Template;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/8.
 */
public class TemplateService {
    private TemplateDaoImpl templateDaoImpl;

    public void setTemplateDaoImpl(TemplateDaoImpl templateDaoImpl) {
        this.templateDaoImpl = templateDaoImpl;
    }

    public String add(Template template){
        //Hibernate往数据库里赋值完ID，也会在内存中对ID赋值
        templateDaoImpl.save(template);
        return template.getId();
    }

    public Template findById(String indexTemplate) {
        return (Template)templateDaoImpl.get(indexTemplate);
    }

    public List<Template> findAll() {
         return templateDaoImpl.findAll();
    }
}
