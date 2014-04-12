package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Channel;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class ChannelDaoImpl extends BaseDaoImpl {
    @Override
    public Object get(String id) {
        return getCurrentSession().get(Channel.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession()
                .createQuery("from Channel").list();
    }
}
