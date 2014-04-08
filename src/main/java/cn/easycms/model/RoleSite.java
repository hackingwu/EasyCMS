package cn.easycms.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by hackingwu on 2014/4/4.
 */
public class RoleSite {
    private String id;
    private Role role = new Role();
    private Site site = new Site();
    private String siteadmin;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public String getSiteadmin() {
        return siteadmin;
    }

    public void setSiteadmin(String siteadmin) {
        this.siteadmin = siteadmin;
    }
}
