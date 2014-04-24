package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Mail;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/24.
 */
public class MailDaoImpl extends BaseDaoImpl {
    @Override
    public Object get(String id) {
        return getCurrentSession().get(Mail.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Mail").list();
    }
}
