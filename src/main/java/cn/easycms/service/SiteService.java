package cn.easycms.service;

import cn.easycms.dao.SiteDaoImpl;
import cn.easycms.model.Site;
import org.hibernate.Query;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/4.
 */
public class SiteService {
    private SiteDaoImpl siteDaoImpl;

    public void setSiteDaoImpl(SiteDaoImpl siteDaoImpl) {
        this.siteDaoImpl = siteDaoImpl;
    }

    public Site findById(String siteid) {
        return (Site) siteDaoImpl.get(siteid);
    }

    public Site selectFirstByParId(String parId) {
        Query query = siteDaoImpl.getCurrentSession().createQuery("from Site where parId=? ");
        query.setParameter(0,parId);
        List list = query.list();

        return list==null||list.size()==0 ? null : (Site)list.get(0);
    }
}
