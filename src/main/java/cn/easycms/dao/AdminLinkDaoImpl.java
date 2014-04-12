package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.AdminLink;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/7.
 */
public class AdminLinkDaoImpl extends BaseDaoImpl{
    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from AdminLink").list();
    }

    @Override
    public Object get(String id) {
        return getCurrentSession().get(AdminLink.class,id);
    }
}
