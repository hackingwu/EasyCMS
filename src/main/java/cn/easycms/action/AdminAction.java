package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Site;
import cn.easycms.service.SiteService;

/**
 * Created by hackingwu on 2014/4/4.
 */
public class AdminAction extends BaseAction {
    private SiteService siteService;
    private String siteid;

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    public String left() {
        Site manageSite = null;
        if (siteid != null && siteid.trim().length() > 0) {
            manageSite = siteService.findById(siteid);
        } else {
            if (getHttpSession().getAttribute("manageSite") != null) {
                manageSite = (Site) getHttpSession().getAttribute("manageSite");
            }
        }
        return "";
    }

}
