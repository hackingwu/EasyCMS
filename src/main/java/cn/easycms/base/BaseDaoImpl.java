package cn.easycms.base;

import cn.easycms.model.RoleSite;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/4.
 */
public abstract class BaseDaoImpl implements BaseDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public abstract Object get(String id) ;

    @Override
    public void save(Object object) {
        getCurrentSession().save(object);
    }

    @Override
    public void update(Object object) {
        getCurrentSession().update(object);
    }

    @Override
    public void delete(Object object) {
        getCurrentSession().delete(object);
    }

    @Override
    public void delete(String id) {
        getCurrentSession().delete(get(id));
    }

    @Override
    public abstract List findAll();
}
