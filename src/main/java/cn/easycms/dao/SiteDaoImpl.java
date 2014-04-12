package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Site;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/3.
 */
public class SiteDaoImpl extends BaseDaoImpl {

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Func").list();
    }

    @Override
    public Object get(String id) {
        return getCurrentSession().get(Site.class,id);
    }
}
