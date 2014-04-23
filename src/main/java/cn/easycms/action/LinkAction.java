package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Link;
import cn.easycms.model.Site;
import cn.easycms.service.LinkService;
import cn.easycms.util.Pager;
import cn.easycms.util.StringUtil;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/23.
 */
public class LinkAction extends BaseAction {

    private Site site;
    private Link link;
    private int  currPage;

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    private String pageStr;

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    private int totalCount;

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    private int  pageSize;

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }

    private LinkService linkService;

    public List<Link> getLinkList() {
        return linkList;
    }

    public void setLinkList(List<Link> linkList) {
        this.linkList = linkList;
    }

    private List<Link> linkList;

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    private String order;

    public Link getLink() {
        return link;
    }

    public void setLink(Link link) {
        this.link = link;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    /**
     * 链接类别
     * @return
     */
    public String clazz(){
        site=getManageSite();
        if (site!=null) {
            if (link==null ){
                link=new Link();
            }
            if(link.getSite()==null) {
                link.setSite(site);
            }
            //只有选择站点才查询
            if (link!=null && link.getSite()!=null) {
                link.setIsClass("1");
                if (!StringUtil.isNotEmpty(order)) {
                    order="orderNum";
                }
                linkList=linkService.find(link, order, currPage, pageSize);
                totalCount=linkService.count(link);
                Pager pager=new Pager(getHttpRequest());
                pager.appendParam("link.site");
                pager.appendParam("link.type");
                pager.appendParam("link.name");
                pager.appendParam("link.pageMark");
                pager.appendParam("order");
                pager.appendParam("pageSize");
                pager.appendParam("pageFuncId");
                pager.setCurrPage(currPage);
                pager.setPageSize(pageSize);
                pager.setTotalCount(totalCount);
                pager.setOutStr("link_clazz.do");
                pageStr=pager.getOutStr();
            }
        }
        return "class";
    }

    /**
     * 链接列表
     * @return
     */
    public String list(){
        site=getManageSite();
        if (site!=null) {
            if (link==null ){
                link=new Link();
            }
            if(link.getSite()==null ) {
                link.setSite(site);
            }
            //只有选择站点才查询
            if (link!=null && link.getSite()!=null) {
                if (!StringUtil.isNotEmpty(order)) {
                    order="orderNum";
                }
                linkList=linkService.find(link, order, currPage, pageSize);
                totalCount=linkService.count(link);
                Pager pager=new Pager(getHttpRequest());
                pager.appendParam("link.site");
                pager.appendParam("link.name");
                pager.appendParam("link.className");
                pager.appendParam("link.pageMark");
                pager.appendParam("link.type");
                pager.appendParam("order");
                pager.appendParam("pageSize");
                pager.appendParam("pageFuncId");
                pager.setCurrPage(currPage);
                pager.setPageSize(pageSize);
                pager.setTotalCount(totalCount);
                pager.setOutStr("link_list.do");
                pageStr=pager.getOutStr();
            }
        }
        return "list";
    }
}
