package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.InfoSign;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/22.
 */
public class InfoSignDaoImpl extends BaseDaoImpl{
    @Override
    public Object get(String id) {
        return id==null?null:getCurrentSession().get(InfoSign.class,id);

    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from InfoSign").list();
    }
}
