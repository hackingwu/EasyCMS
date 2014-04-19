package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Info;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/18.
 */
public class InfoDaoImpl extends BaseDaoImpl {

    @Override
    public Object get(String id) {
        return getCurrentSession().get(Info.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession()
                .createQuery("from Info").list();
    }
}
