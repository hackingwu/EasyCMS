package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.OperButton;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/21.
 */
public class OperButtonDaoImpl extends BaseDaoImpl {

    @Override
    public Object get(String id) {
       return getCurrentSession().get(OperButton.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from OperButton").list();
    }
}
