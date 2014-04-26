package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.AdminLink;
import cn.easycms.service.AdminLinkService;
import cn.easycms.service.OperlogsService;
import cn.easycms.util.HtmlCodeUtil;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/24.
 */
public class AdminLinkAction extends BaseAction {
    private String msg;
    private String pageFuncId;
    private String order="orderNum";
    private String logContent;
    private String ids;
    private AdminLinkService adminLinkService;
    private OperlogsService operlogsService;

    public void setOperlogsService(OperlogsService operlogsService) {
        this.operlogsService = operlogsService;
    }

    public void setAdminLinkService(AdminLinkService adminLinkService) {
        this.adminLinkService = adminLinkService;
    }

    private AdminLink adminLink;
    private List<AdminLink> adminLinkList;

    public List<AdminLink> getAdminLinkList() {
        return adminLinkList;
    }

    public void setAdminLinkList(List<AdminLink> adminLinkList) {
        this.adminLinkList = adminLinkList;
    }

    /**
     * 列表
     * @return
     */
    public String list(){
        if (adminLink==null ){
            adminLink=new AdminLink();
        }
        if (AdminLink.TYPE_USER.equals(adminLink.getType())) {
            adminLink.setUserId(getLoginAdmin().getId());
        }
        adminLinkList=adminLinkService.find(adminLink, order,false);
        return "list";
    }

    /**
     * 编辑系统连接
     * @return
     */
    public String edit(){
        if (adminLink!=null && adminLink.getId()!=null && adminLink.getId().trim().length()>0) {
            adminLink=adminLinkService.findById(adminLink.getId());
        }
        return "edit";
    }
    /**
     * 编辑处理
     * @return
     */
    public String editDo(){
        String oper="添加";
        try {
            adminLink.setUrl(HtmlCodeUtil.url(adminLink.getUrl()));
            if (AdminLink.TYPE_USER.equals(adminLink.getType())) {
                //个人链接，添加用户条件
                adminLink.setUserId(getLoginAdmin().getId());
            }
            if (adminLink!=null && adminLink.getId()!=null) {
                oper="修改";
                adminLinkService.update(adminLink);
            }else {
                //添加
                adminLinkService.add(adminLink);
            }
            logContent=oper+(AdminLink.TYPE_SYSTEM.equals(adminLink.getType())?"系统":"个人")+"链接("+adminLink.getName()+")成功!";
            write("succ", "GBK");
        } catch (Exception e) {
            logContent=oper+(AdminLink.TYPE_SYSTEM.equals(adminLink.getType())?"系统":"个人")+"链接("+adminLink.getName()+")失败:"+e.toString()+"!";
        }
        operlogsService.log(getLoginName(), logContent, getHttpRequest());
        return null;
    }

    /**
     * 删除
     * @return
     */
    public String del(){
        if (ids!=null && ids.trim().length()>0) {
            StringBuilder sb=new StringBuilder();
            String[] idArr=ids.split(";");
            if (idArr!=null && idArr.length>0) {
                for (int i = 0; i < idArr.length; i++) {
                    if (idArr[i].trim().length()>0) {
                        try {
                            adminLink=adminLinkService.findById(idArr[i]);
                            if (adminLink!=null) {
                                adminLinkService.del(adminLink);
                                sb.append(idArr[i]+";");
                                logContent="删除"+(AdminLink.TYPE_SYSTEM.equals(adminLink.getType())?"系统":"个人")+"链接("+adminLink.getName()+")成功!";
                            }
                        } catch (Exception e) {
                            logContent="删除"+(AdminLink.TYPE_SYSTEM.equals(adminLink.getType())?"系统":"个人")+"链接("+adminLink.getName()+")失败:"+e.toString()+"!";
                        }
                        operlogsService.log(getLoginName(), logContent, getHttpRequest());
                    }
                }
            }
            write(sb.toString(), "UTF-8");
        }
        return null;
    }

    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
    public String getPageFuncId() {
        return pageFuncId;
    }
    public void setPageFuncId(String pageFuncId) {
        this.pageFuncId = pageFuncId;
    }
    public String getOrder() {
        return order;
    }
    public void setOrder(String order) {
        this.order = order;
    }
    public String getLogContent() {
        return logContent;
    }
    public void setLogContent(String logContent) {
        this.logContent = logContent;
    }
    public String getIds() {
        return ids;
    }
    public void setIds(String ids) {
        this.ids = ids;
    }



    public AdminLink getAdminLink() {
        return adminLink;
    }

    public void setAdminLink(AdminLink adminLink) {
        this.adminLink = adminLink;
    }
}