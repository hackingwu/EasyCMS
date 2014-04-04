package cn.easycms.service;

import cn.easycms.dao.SiteDaoImpl;
import cn.easycms.model.Site;

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
}
