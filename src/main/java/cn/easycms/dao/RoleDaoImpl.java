package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Role;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/3.
 */
public class RoleDaoImpl extends BaseDaoImpl {

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Role").list();
    }

    @Override
    public Object get(String id) {
        return getCurrentSession().get(Role.class,id);
    }
}
