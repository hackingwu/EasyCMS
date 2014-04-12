package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.TemplateLink;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/10.
 */
public class TemplateLinkDaoImpl extends BaseDaoImpl {
    @Override
    public List findAll() {
          return getCurrentSession()
                  .createQuery("from TemplateLink")
                  .list();
    }

    @Override
    public Object get(String id) {
        return getCurrentSession().get(TemplateLink.class,id);
    }
}
