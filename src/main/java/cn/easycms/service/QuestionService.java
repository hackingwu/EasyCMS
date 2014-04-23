package cn.easycms.service;

import cn.easycms.dao.QuestionDaoImpl;
import cn.easycms.model.Question;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/23.
 */
public class QuestionService {
    private QuestionDaoImpl questionDaoImpl;

    public void setQuestionDaoImpl(QuestionDaoImpl questionDaoImpl) {
        this.questionDaoImpl = questionDaoImpl;
    }

    public List<Question> find(Question question, String order, int currPage, int pageSize) {
        Criteria criteria = questionDaoImpl.getCurrentSession().createCriteria(Criteria.class);
        proSearchParam(question,criteria);
        if (StringUtil.isNotEmpty(order))
            criteria.addOrder(Order.asc(order));
        criteria.setFirstResult((currPage-1)*pageSize);
        criteria.setMaxResults(pageSize);
        return criteria.list();
    }

    private void proSearchParam(Question question, Criteria criteria) {
        if (question!=null){
            if(StringUtil.isNotEmpty(question.getId()))
                criteria.add(Restrictions.like("id","%"+question.getId()+"%"));
            if(StringUtil.isNotEmpty(question.getName()))
                criteria.add(Restrictions.like("name","%"+question.getName()+"%"));
            if (question.getSite()!=null)
                criteria.add(Restrictions.eq("site",question.getSite()));
            if (StringUtil.isNotEmpty(question.getAddUser()))
                criteria.add(Restrictions.eq("addUser",question.getAddUser()));
            if (StringUtil.isNotEmpty(question.getSelectType()))
                if ("1".equals(question.getSelectType()))
                    criteria.add(Restrictions.eq("selectType","1"));
                else if("0".equals(question.getSelectType()))
                    criteria.add(Restrictions.eqOrIsNull("selectType","0"));
            if (StringUtil.isNotEmpty(question.getIsOk()))
                if ("1".equals(question.getIsOk()))
                    criteria.add(Restrictions.eq("isOk","1"));
                else if ("0".equals(question.getIsOk()))
                    criteria.add(Restrictions.eqOrIsNull("isOk","0"));
        }
    }

    public int count(Question question) {
        Criteria criteria = questionDaoImpl.getCurrentSession().createCriteria(Question.class);
        proSearchParam(question,criteria);
        return criteria.list().size();
    }
}
