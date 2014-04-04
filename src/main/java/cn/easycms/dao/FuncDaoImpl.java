package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/3.
 */
public class FuncDaoImpl extends BaseDaoImpl {

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Func").list();
    }
}
