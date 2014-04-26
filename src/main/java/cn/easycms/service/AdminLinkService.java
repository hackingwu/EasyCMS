package cn.easycms.service;

import cn.easycms.dao.AdminLinkDaoImpl;
import cn.easycms.model.AdminLink;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/7.
 */
public class AdminLinkService {
    private AdminLinkDaoImpl adminLinkDaoImpl;

    public void setAdminLinkDaoImpl(AdminLinkDaoImpl adminLinkDaoImpl) {
        this.adminLinkDaoImpl = adminLinkDaoImpl;
    }
    public List findLinkByType(String type){
            Query query = adminLinkDaoImpl.getCurrentSession().createQuery("from AdminLink where type = ? ");
            query.setParameter(0,type);
            return query.list();
    }

    public List<AdminLink> find(AdminLink adminLink, String order, boolean cache) {
        Criteria criteria = adminLinkDaoImpl.getCurrentSession().createCriteria(AdminLink.class);
        proSearchParam(adminLink,criteria);
        if (StringUtil.isNotEmpty(order)){
            criteria.addOrder(Order.asc(order));
        }
        criteria.setCacheable(cache);
        return criteria.list();
    }
    public void proSearchParam(AdminLink adminLink,Criteria criteria){

            if (adminLink!=null ) {
                if (StringUtil.isNotEmpty(adminLink.getName())) {
                    criteria.add(Restrictions.like("name","%"+adminLink.getName().trim()+"%"));
                }
                if (StringUtil.isNotEmpty(adminLink.getType())) {
                    criteria.add(Restrictions.like("type","%"+adminLink.getType().trim()+"%"));
                }
                if (StringUtil.isNotEmpty(adminLink.getUserId())) {
                    criteria.add(Restrictions.like("userid","%"+adminLink.getUserId().trim()+"%"));
                }
            }

    }

    public AdminLink findById(String id) {
        return (AdminLink)adminLinkDaoImpl.get(id);
    }

    public void update(AdminLink adminLink) {
        adminLinkDaoImpl.update(adminLink);
    }

    public void add(AdminLink adminLink) {
        adminLinkDaoImpl.save(adminLink);
    }

    public void del(AdminLink adminLink) {
        adminLinkDaoImpl.delete(adminLink);
    }
}
