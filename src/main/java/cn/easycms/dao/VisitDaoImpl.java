package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Visit;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/25.
 */
public class VisitDaoImpl extends BaseDaoImpl {
    @Override
    public Object get(String id) {
        return getCurrentSession().get(Visit.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Visit").list();
    }
}
