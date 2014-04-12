package cn.easycms.service;

import cn.easycms.dao.TemplateLinkDaoImpl;
import cn.easycms.model.Link;
import cn.easycms.model.Site;
import cn.easycms.model.Template;
import cn.easycms.model.TemplateLink;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/10.
 */
public class TemplateLinkService {
    private TemplateLinkDaoImpl templateLinkDaoImpl;
    private LinkService         linkService;

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }

    public void setTemplateLinkDaoImpl(TemplateLinkDaoImpl templateLinkDaoImpl) {
        this.templateLinkDaoImpl = templateLinkDaoImpl;
    }

    public int count(Template template) {
        return (Integer)(templateLinkDaoImpl.getCurrentSession()
                .createQuery("select count(*) from TemplateLink where template=?")
                .setParameter(0,template)
                .uniqueResult());
    }




    public List<TemplateLink> findAllByTemplate(Template template,String order){
        Criteria criteria = templateLinkDaoImpl.getCurrentSession()
                            .createCriteria(TemplateLink.class);
        if (template!=null){
            criteria.add(Restrictions.eq("template",template));
        }
        if (StringUtil.isNotEmpty(order)){
            criteria.addOrder(Property.forName(order).asc());
        }

        return criteria.list();

    }
}
