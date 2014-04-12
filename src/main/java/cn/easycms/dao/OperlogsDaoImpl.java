package cn.easycms.dao;


import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Operlogs;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/2.
 */
public class OperlogsDaoImpl extends BaseDaoImpl {

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Operlogs").list();
    }

    @Override
    public Object get(String id) {
        return getCurrentSession().get(Operlogs.class,id);
    }
}
