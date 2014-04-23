package cn.easycms.dao;

import cn.easycms.base.BaseDaoImpl;
import cn.easycms.model.Question;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/23.
 */
public class QuestionDaoImpl extends BaseDaoImpl{
    @Override
    public Object get(String id) {
        return getCurrentSession().get(Question.class,id);
    }

    @Override
    public List findAll() {
        return getCurrentSession().createQuery("from Question").list();
    }
}
