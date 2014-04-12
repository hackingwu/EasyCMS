package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.TemplateChannel;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/10.
 */
public class TemplateChannelDaoImpl extends BaseDaoImpl{
    @Override
    public List findAll() {
        return getCurrentSession()
                .createQuery("from TemplateChannel")
                .list();
    }

    @Override
    public Object get(String id) {
        return getCurrentSession().get(TemplateChannel.class,id);
    }
}
