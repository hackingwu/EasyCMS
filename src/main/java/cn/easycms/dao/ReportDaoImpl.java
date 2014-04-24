package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Report;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/24.
 */
public class ReportDaoImpl extends BaseDaoImpl {
    @Override
    public Object get(String id) {
        return getCurrentSession().get(Report.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Report").list();
    }
}
