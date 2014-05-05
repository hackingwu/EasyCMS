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


    public List selectByParId(String parId) {
        return siteDaoImpl.getCurrentSession()
                .createQuery("from Site where parId=?")
                .setParameter(0,parId)
                .list();
    }

    public Boolean hasChildren(String id) {
        List list = selectByParId(id);
        return list==null||list.size()==0?false:true;

    }

    public Boolean haveSourcePath(String sourcePath) {
        List list = siteDaoImpl.getCurrentSession()
                .createQuery("from Site where sourcePath=?")
                .setParameter(0,sourcePath)
                .list();
        return list==null||list.size()==0?false:true;
    }

    public void insert(Site site) {
        siteDaoImpl.save(site);
    }

    public void update(Site site) {
        siteDaoImpl.update(site);
    }


    public void delByPrimaryKey(String siteId) {
        //将以该site为parId的site的parId置空
        //1.先取出他的子站点2.再将其parId置空
        List<Site> sonList = selectByParId(siteId);
        for (Site site : sonList)
            resetParId(site.getId());
        //再删除该站点
        siteDaoImpl.delete(findById(siteId));

    }

    public void resetParId(String siteId) {
        Site site = findById(siteId);
        site.setParId("");
        update(site);
    }

}
