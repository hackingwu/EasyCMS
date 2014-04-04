package cn.easycms.dao;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/4.
 */
public class RoleSiteDaoImpl extends cn.easycms.base.BaseDaoImpl {

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from RoleSite").list();
    }
}
