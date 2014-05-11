package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.AdminLink;
import cn.easycms.model.Func;
import cn.easycms.model.Site;
import cn.easycms.service.AdminLinkService;
import cn.easycms.service.FuncService;
import cn.easycms.service.SiteService;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/4.
 */
public class AdminAction extends BaseAction {
    List<Func> funcList;

    private SiteService siteService;
    private FuncService funcService;
    private AdminLinkService adminLinkService;
    private String funcid;
    private String siteid;
    //right.jsp中的系统连接的List
    private List<AdminLink> sysLink;
    //用户的链接。
    private List<AdminLink> userLink;

    public List<AdminLink> getSysLink() {
        return sysLink;
    }

    public List<AdminLink> getUserLink() {
        return userLink;
    }

    public void setAdminLinkService(AdminLinkService adminLinkService) {
        this.adminLinkService = adminLinkService;
    }

    public List<Func> getFuncList() {
        return funcList;
    }

    public void setFuncList(List<Func> funcList) {
        this.funcList = funcList;
    }

    public SiteService getSiteService() {
        return siteService;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    public FuncService getFuncService() {
        return funcService;
    }

    public void setFuncService(FuncService funcService) {
        this.funcService = funcService;
    }

    public String getFuncid() {
        return funcid;
    }

    public void setFuncid(String funcid) {
        this.funcid = funcid;
    }

    public String getSiteid() {
        return siteid;
    }

    public void setSiteid(String siteid) {
        this.siteid = siteid;
    }

    public String left() {
        Site manageSite = null;

        if (siteid != null && siteid.trim().length() > 0) {
            manageSite = siteService.findById(siteid);
        } else {
            if (getHttpSession().getAttribute("manageSite") != null) {
                manageSite = (Site) getHttpSession().getAttribute("manageSite");
            } else {
                if (isAdminLogin()) {
                    manageSite = siteService.selectFirstByParId("");
                } else {
                    //普通用户
                }

            }
        }
        getHttpSession().setAttribute("manageSite", manageSite);
        //第一次进来没有点击站点或者系统或者会员，funcid为空
        if (funcid == null || funcid.trim().length() == 0) {
            if (getHttpSession().getAttribute("funid") != null && StringUtils.isNotEmpty(getHttpSession().getAttribute("funcid").toString())) {
                funcid = getHttpSession().getAttribute("funid").toString();
            } else {
                if (isAdminLogin()) {
                    funcList = funcService.selectRoot();
                } else {
                    //普通用户的操作
                }
                if (funcList != null && funcList.size() > 0) {
                    //菜单管理func.jsp
                    funcid = funcList.get(0).getId();

                }
            }
        }
        //已经有的更新，没有的存进去。
        getHttpSession().setAttribute("funcid", funcid);
        String funcName = funcService.findById(funcid).getName();
        getHttpSession().setAttribute("funcName", funcName.equals("资源") ? "" : funcName);
        if (isAdminLogin()) {
            getHttpSession().setAttribute("siteAdmin", true);
        } else {
            //非管理员操作
        }
        if (getHttpSession().getAttribute("funcs") == null) {
            if (isAdminLogin()) {
                funcList = funcService.selectAll();
            } else {
                //非管理员操作
            }
            if (funcList != null && funcList.size() > 0) {
                for (int i = 0; i < funcList.size(); i++) {
                    if (funcService.haveSon(funcList.get(i).getId())) {
                        funcList.get(i).setHasChildren(true);
                    }
                }
            }
            getHttpSession().setAttribute("funcs", funcList);
        }
        return "left";
    }

    /**
     * 头部
     */
    public String top() {
        if (isAdminLogin()) {
            funcList = funcService.selectRoot();
        } else {
            //非管理员的操作。
        }
        if (funcList != null && funcList.size() > 0) {
            funcid = funcList.get(0).getId();
        }
        return "top";
    }

    /**
     * 右侧
     */
    public String right() {
        sysLink = adminLinkService.findLinkByType(AdminLink.TYPE_SYSTEM);

        userLink = adminLinkService.findLinkByType(AdminLink.TYPE_USER);

        return "right";
    }

}
