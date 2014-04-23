package cn.easycms.service;

import cn.easycms.dao.LinkDaoImpl;
import cn.easycms.model.Link;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class LinkService {
    private LinkDaoImpl linkDaoImpl;

    public void setLinkDaoImpl(LinkDaoImpl linkDaoImpl) {
        this.linkDaoImpl = linkDaoImpl;
    }

    public void add(Link link) {
        linkDaoImpl
                .save(link);
    }

    public List<Link> find(Link link, String orderNum, int currPage, int pageSize) {
        Criteria criteria = linkDaoImpl.getCurrentSession().createCriteria(Link.class);
        proSearch(link,criteria);
        return criteria.addOrder(Order.asc(orderNum))
                .setFirstResult((currPage-1)*pageSize)
                .setMaxResults(pageSize)
                .list();
    }
    public void proSearch(Link link,Criteria criteria){
        if (link!=null){
            if (link.getSite()!=null){
                criteria.add(Restrictions.eq("site", link.getSite()));
            }
            if (StringUtil.isNotEmpty(link.getName())){
                criteria.add(Restrictions.like("name","%"+link.getName()+"%"));
            }
            if(link.getParId()!=null){
                criteria.add(Restrictions.eq("parId",link.getParId()));

            }
            if (StringUtil.isNotEmpty(link.getPageMark())){
                criteria.add(Restrictions.eq("pageMark",link.getPageMark()));
            }
            if (StringUtil.isNotEmpty(link.getIsOk())){
                criteria.add(Restrictions.eq("isOk",link.getIsOk()));
            }
            if (StringUtil.isNotEmpty(link.getType())){
                criteria.add(Restrictions.eq("type",link.getType()));
            }
            if (StringUtil.isNotEmpty(link.getPageMarks())){
                String[] pageMarks = link.getPageMarks().split(",");
                criteria.add(Restrictions.in("pageMark", pageMarks));
            }
            if (StringUtil.isNotEmpty(link.getClassPageMarks())){
                criteria.add(Restrictions.in("parId",getIdByPageMarks(link.getClassPageMarks())));
            }
        }
    }
    private List getIdByPageMarks(String pageMark){
        String[] pageMarks = pageMark.split(",");
        List<Link> links = linkDaoImpl.getCurrentSession().createCriteria(Link.class)
                .add(Restrictions.in("pageMark",pageMarks))
                .list();
        List ids = new ArrayList();
        for (Link link :links){
            ids.add(link.getId());
        }
        return ids;
    }

    public int count(Link link) {
        if (link!=null){
            Criteria criteria = linkDaoImpl.getCurrentSession().createCriteria(Link.class);
            proSearch(link,criteria);
            return criteria.list().size();
        }
        return 0;
    }
}
