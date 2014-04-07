package cn.easycms.service;

import cn.easycms.dao.AdminLinkDaoImpl;
import org.hibernate.Query;

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

}
