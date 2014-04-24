package cn.easycms.service;

import cn.easycms.dao.MailDaoImpl;
import cn.easycms.model.Mail;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/24.
 */
public class MailService {
    private MailDaoImpl mailDaoImpl;

    public MailDaoImpl getMailDaoImpl() {
        return mailDaoImpl;
    }

    public void setMailDaoImpl(MailDaoImpl mailDaoImpl) {
        this.mailDaoImpl = mailDaoImpl;
    }

    public int count(Mail mail) {
        Criteria criteria = mailDaoImpl.getCurrentSession().createCriteria(Mail.class);
        proSearchParam(mail,criteria);
        return criteria.list().size();
    }

    public List<Mail> find(Mail mail, String order, int currPage, int pageSize) {
        Criteria criteria = mailDaoImpl.getCurrentSession().createCriteria(Mail.class);
        proSearchParam(mail,criteria);
        if (StringUtil.isNotEmpty(order))
            criteria.addOrder(Order.asc(order));
        if (pageSize>=1&&currPage>=1){
            criteria.setMaxResults(pageSize);
            criteria.setFirstResult((currPage-1)*pageSize);
        }

        return criteria.list();
    }
    public void proSearchParam(Mail mail,Criteria criteria){
        if (mail!=null&&criteria!=null){
            if (mail.getType().equals("unit")) {
                criteria.add(Restrictions.isNotNull("unitId"));
                criteria.add(Restrictions.eq("unitId", ""));
            }
            if (mail.getType().equals("user")) {
                criteria.add(Restrictions.isNotNull("userId"));
                criteria.add(Restrictions.eq("userId", ""));
            }
            if (mail.getType().equals("other")){
                criteria.add(Restrictions.eqOrIsNull("unitId", ""));
                criteria.add(Restrictions.eqOrIsNull("userId", ""));
            }
            if (StringUtil.isNotEmpty(mail.getQueryCode()))
                criteria.add(Restrictions.like("queryCode","%"+mail.getQueryCode()+"%"));
            if (StringUtil.isNotEmpty(mail.getTitle()))
                criteria.add(Restrictions.like("title","%"+mail.getTitle()+"%"));
            if (StringUtil.isNotEmpty(mail.getWriter()))
                criteria.add(Restrictions.like("writer","%"+mail.getWriter()+"%"));
            if (StringUtil.isNotEmpty(mail.getMailType()))
                criteria.add(Restrictions.eq("mailType",mail.getMailType()));
            if (StringUtil.isNotEmpty(mail.getUserId()))
                criteria.add(Restrictions.eq("userId",mail.getUserId()));
            if (StringUtil.isNotEmpty(mail.getUnitId()))
                criteria.add(Restrictions.eq("unitId",mail.getUnitId()));
            if (StringUtil.isNotEmpty(mail.getUnitIds())){
                String[] temp = mail.getUnitIds().split(",");
                criteria.add(Restrictions.in("unitId",temp));
            }
            if (StringUtil.isNotEmpty(mail.getState())){
                if(mail.getState().equals("1")){
                    criteria.add(Restrictions.eq("state","1"));
                }else if(mail.getState().equals("0")){
                    criteria.add(Restrictions.eqOrIsNull("state","0"));
                }
            }
            if (StringUtil.isNotEmpty(mail.getIsOpen())){
                if ("1".equals(mail.getIsOpen()))
                    criteria.add(Restrictions.eq("isOpen","1"));
                else if ("0".equals(mail.getIsOpen()))
                    criteria.add(Restrictions.eqOrIsNull("isOpen","0"));
            }


        }
    }
}
