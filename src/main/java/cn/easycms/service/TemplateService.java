package cn.easycms.service;

import cn.easycms.dao.TemplateDaoImpl;
import cn.easycms.model.Template;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

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

    public List<Template> find(Template template, String order, int currPage, int pageSize) {
        Criteria criteria = templateDaoImpl.getCurrentSession().createCriteria(Template.class);
        proSearchParam(template,criteria);
        if (StringUtil.isNotEmpty(order))
            criteria.addOrder(Order.asc(order));
        criteria.setFirstResult((currPage-1)*pageSize);
        criteria.setMaxResults(pageSize);
        return criteria.list();
    }
    private void proSearchParam(Template template,Criteria criteria){

        if (template!=null){

            if (StringUtil.isNotEmpty(template.getName()))
                criteria.add(Restrictions.like("name","%"+template.getName()+"%"));
            if (StringUtil.isNotEmpty(template.getNoDel()))
                criteria.add(Restrictions.ne("st" +
                        "ate",Template.STATE_DEL));
            if (template.getAddUser()!=null)
                criteria.add(Restrictions.eq("addUser",template.getAddUser()));
            if (StringUtil.isNotEmpty(template.getUseSites())){
                if("newSite".equals(template.getUseSites()))
                    criteria.add(Restrictions.eq("useSites",""));
                else
                    criteria.add(Restrictions.like("useSites","%"+template.getUseSites()+"%"));
            }

        }
    }

    public int count(Template template) {
        if (template!=null){
            Criteria criteria = templateDaoImpl.getCurrentSession().createCriteria(Template.class);
            proSearchParam(template,criteria);
            return criteria.list().size();
        }
        return 0;
    }
}
