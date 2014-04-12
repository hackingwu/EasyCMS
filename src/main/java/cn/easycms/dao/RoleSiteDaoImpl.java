package cn.easycms.dao;

import cn.easycms.model.RoleSite;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/4.
 */
public class RoleSiteDaoImpl extends cn.easycms.base.BaseDaoImpl {

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from RoleSite").list();
    }

    @Override
    public Object get(String id) {
        return getCurrentSession().get(RoleSite.class,id);
    }
}
