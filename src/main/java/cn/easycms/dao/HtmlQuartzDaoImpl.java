package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.HtmlQuartz;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/22.
 */
public class HtmlQuartzDaoImpl extends BaseDaoImpl {
    @Override
    public Object get(String id) {
        return getCurrentSession().get(HtmlQuartz.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from HtmlQuartz").list();
    }
}
