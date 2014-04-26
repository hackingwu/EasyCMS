package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Guestbook;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/25.
 */
public class GuestbookDaoImpl extends BaseDaoImpl{
    @Override
    public Object get(String id) {
        return getCurrentSession().get(Guestbook.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Guestbook").list();
    }
}
