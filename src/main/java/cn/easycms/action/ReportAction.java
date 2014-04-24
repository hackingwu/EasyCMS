package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Report;
import cn.easycms.model.User;
import cn.easycms.service.OperlogsService;
import cn.easycms.service.ReportService;
import cn.easycms.service.UserService;
import cn.easycms.util.Pager;

import java.util.*;

/**
 * Created by hackingwu on 2014/4/24.
 */
public class ReportAction extends BaseAction{
    private ReportService reportService;
    private UserService userService;
    private OperlogsService operlogsService;

    public void setOperlogsService(OperlogsService operlogsService) {
        this.operlogsService = operlogsService;
    }

    private Report report;
    private List<Report> reportList;
    private List<User> userList;
    private String order="addtime";
    private User user;
    private String msg;
    private String pageFuncId;
    private String logContent;
    private String ids;
    private int totalCount;
    private int currPage;
    private int pageSize;

    public List<User> getUserList() {
        return userList;
    }

    public User getUser() {
        return user;
    }

    public String getPageStr() {

        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    private String pageStr;

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }



    /**
     * 列表
     * @return
     */
    public String list(){
        if (report==null ){
            report=new Report();
        }
        if (!isAdminLogin()) {
            //不是admin,只能查看自己的
            report.setUserId(getLoginAdmin().getId());
        }
        reportList=reportService.find(report, order, currPage, pageSize,false);
        totalCount=reportService.count(report,false);
        Pager pager=new Pager(getHttpRequest());
        pager.appendParam("report.querycode");
        pager.appendParam("report.name");
        pager.appendParam("report.issuer");
        pager.appendParam("report.linkman");
        pager.appendParam("report.state");
        pager.appendParam("report.userid");
        pager.appendParam("order");
        pager.appendParam("pageSize");
        pager.appendParam("pageFuncId");
        pager.setCurrPage(currPage);
        pager.setPageSize(pageSize);
        pager.setTotalCount(totalCount);
        pager.setOutStr("report_list.do");
        pageStr=pager.getOutStr();
        return "list";
    }
    /**
     * 转交
     * @return
     */
    public String forward(){

        user=new User();
        userList=userService.find(user);
        return "forward";
    }
    /**
     * 转交处理
     * @return
     */
    public String forwardDo(){
        if (report!=null && report.getId()!=null && report.getId().trim().length()>0) {

            Report updateReport=new Report();
            updateReport.setId(report.getId());
            //设置流转流程
            Report oldreport=reportService.findById(report.getId());
            String proflow="";
            if (oldreport.getProFlow()==null || oldreport.getProFlow().trim().length()==0) {
                if (oldreport.getUserId()!=null && oldreport.getUserId().trim().length()>0) {
                    user=userService.findById(oldreport.getUserId());
                    if (user!=null) {
                        proflow=user.getName();
                    }
                }else {
                    proflow="其他";
                }
            }else {
                proflow=oldreport.getProFlow();
            }
            proflow+=" --> ";
            String toname="";
            updateReport.setUserId(report.getUserId());
            if (report.getUserId()!=null && report.getUserId().trim().length()>0) {
                user=userService.findById(report.getUserId());
                if (user!=null) {
                    proflow+=user.getName();
                }
            }else {
                proflow+="其他";
            }
            updateReport.setProFlow(proflow);
            try {
                reportService.update(updateReport);
                msg="<script>alert('转交成功');location.href='report_list.do?pageFuncId="+pageFuncId+"';</script>";
                logContent=oldreport.getName()+" 申报项目转交给 "+toname;
            } catch (Exception e) {
                msg="<script>alert('转交失败:"+e.getMessage()+"');location.href='report_list.do?&pageFuncId="+pageFuncId+"';</script>";
                logContent=oldreport.getName()+" 申报项目转交给 "+toname+" 时失败:"+e.getMessage();
            }finally{
                operlogsService.log(getLoginName(), logContent, getHttpRequest());
            }
        }
        return "msg";
    }
    /**
     * 处理页面
     * @return
     */
    public String pro(){
        if (report!=null && report.getId()!=null && report.getId().trim().length()>0) {
            report=reportService.findById(report.getId());
        }
        return "pro";
    }
    /**
     * 办结处理
     * @return
     */
    public String proDo(){
        if (report!=null && report.getId()!=null && report.getId().trim().length()>0) {
            Report updatereport=new Report();
            updatereport.setId(report.getId());
            updatereport.setReContent(report.getReContent());
            updatereport.setReTime(new Date());
            updatereport.setState("1");
            Report oldreport=reportService.findById(report.getId());
            try {
                reportService.update(updatereport);
                msg="<script>alert('办结成功');location.href='report_list.do?pageFuncId="+pageFuncId+"';</script>";
                logContent=oldreport.getName()+" 申报项目办结 ";
            } catch (Exception e) {
                msg="<script>alert('办结失败:"+e.getMessage()+"');location.href='report_list.do?&pageFuncId="+pageFuncId+"';</script>";
                logContent=oldreport.getName()+" 申报项目办结时失败:"+e.getMessage();
            }finally{
                operlogsService.log(getLoginName(), logContent, getHttpRequest());
            }
        }
        return "msg";
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
                            report=reportService.findById(idArr[i]);
                            if (report!=null) {
                                reportService.del(report);
                                sb.append(idArr[i]+";");
                                logContent="删除申报项目("+report.getName()+")成功!";
                            }
                        } catch (Exception e) {
                            logContent="删除申报项目("+report.getName()+")失败:"+e.toString()+"!";
                        }
                        operlogsService.log(getLoginName(), logContent, getHttpRequest());
                    }
                }
            }
            write(sb.toString(), "UTF-8");
        }
        return null;
    }

    public ReportService getReportService() {
        return reportService;
    }

    public void setReportService(ReportService reportService) {
        this.reportService = reportService;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public Report getReport() {
        return report;
    }

    public void setReport(Report report) {
        this.report = report;
    }

    public List<Report> getReportList() {
        return reportList;
    }

    public void setReportList(List<Report> reportList) {
        this.reportList = reportList;
    }


    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
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

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent;
    }
}
