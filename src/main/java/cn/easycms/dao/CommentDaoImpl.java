package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Comment;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/25.
 */
public class CommentDaoImpl extends BaseDaoImpl{
    @Override
    public Object get(String id) {
        return getCurrentSession().get(Comment.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Comment").list();
    }
}
