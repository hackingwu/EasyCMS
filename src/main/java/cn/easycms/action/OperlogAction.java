package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Operlogs;
import cn.easycms.service.OperlogsService;
import cn.easycms.util.Pager;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by hackingwu on 5/11/14.
 */
public class OperlogAction extends BaseAction {

    private String order;
    private List<Operlogs> operlogList;
    private int totalCount;
    private String pageStr;
    private OperlogsService operlogsService;
    private int currPage;
    private int pageSize;
    private Operlogs operlog;

    public void setOperlogsService(OperlogsService operlogsService) {
        this.operlogsService = operlogsService;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public List<Operlogs> getOperlogList() {
        return operlogList;
    }

    public void setOperlogList(List<Operlogs> operlogList) {
        this.operlogList = operlogList;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
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

    public Operlogs getOperlog() {
        return operlog;
    }

    public void setOperlog(Operlogs operlog) {
        this.operlog = operlog;
    }

    /**
     * 列表
     *
     * @return
     */
    public String list() {

        if (operlog != null) {
            operlogList = operlogsService.getListWithOperlogAndUserAndCurrPageAndPageSize(operlog, getLoginName(), currPage, pageSize);
        } else {
            operlogList = operlogsService.getListWithOperlogAndUserAndCurrPageAndPageSize(null, getLoginName(), currPage, pageSize);
        }
        Collections.sort(operlogList, new Comparator<Operlogs>() {
            @Override
            public int compare(Operlogs o1, Operlogs o2) {
                return o2.getOperTime().compareTo(o1.getOperTime());
            }
        });
        totalCount = operlogList.size();
        Pager pager = new Pager(getHttpRequest());
        pager.appendParam("operlog.loginname");

        pager.appendParam("operlog.content");
        pager.appendParam("operlog.ip");
        pager.appendParam("pageSize");
        pager.appendParam("pageFuncId");
        pager.setCurrPage(currPage);
        pager.appendParam("order");
        pager.setPageSize(pageSize);
        pager.setTotalCount(totalCount);
        pager.setOutStr("operLog_list.do");
        pageStr = pager.getOutStr();
        return "list";
    }

}
