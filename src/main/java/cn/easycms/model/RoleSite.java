package cn.easycms.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by hackingwu on 2014/4/4.
 */
public class RoleSite {
    private String id;
    private Set<Role> roles = new HashSet<Role>();
    private Set<Site> sites = new HashSet<Site>();
    private String siteadmin;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public Set<Site> getSites() {
        return sites;
    }

    public void setSites(Set<Site> sites) {
        this.sites = sites;
    }

    public String getSiteadmin() {
        return siteadmin;
    }

    public void setSiteadmin(String siteadmin) {
        this.siteadmin = siteadmin;
    }
}
