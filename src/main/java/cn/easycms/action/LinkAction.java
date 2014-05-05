package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Link;
import cn.easycms.model.Site;
import cn.easycms.service.LinkService;
import cn.easycms.service.OperlogsService;
import cn.easycms.service.SiteService;
import cn.easycms.util.HtmlCodeUtil;
import cn.easycms.util.Pager;
import cn.easycms.util.StringUtil;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/23.
 */
public class LinkAction extends BaseAction {

    private Site site;
    private Link link;
    private int currPage;
    private Link linkClass;//类别链接
    private String logContent;
    private OperlogsService operlogsService;
    private SiteService siteService;
    private String ids;
    private int pageSize = 10;
    private String pageStr;
    private int totalCount;
    private LinkService linkService;
    private List<Link> linkList;
    private String order;

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize == 0 ? 10 : pageSize;
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

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }

    public void setOperlogsService(OperlogsService operlogsService) {
        this.operlogsService = operlogsService;
    }

    public List<Link> getLinkList() {
        return linkList;
    }

    public void setLinkList(List<Link> linkList) {
        this.linkList = linkList;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

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

    public Link getLinkClass() {
        return linkClass;
    }

    public void setLinkClass(Link linkClass) {
        this.linkClass = linkClass;
    }

    /**
     * 链接类别
     *
     * @return
     */
    public String clazz() {
        site = getManageSite();
        if (site != null) {
            if (link == null) {
                link = new Link();
            }
            if (link.getSite() == null) {
                link.setSite(site);
            }
            //只有选择站点才查询
            if (link != null && link.getSite() != null) {
                link.setIsClass("1");
                if (!StringUtil.isNotEmpty(order)) {
                    order = "orderNum";
                }
                linkList = linkService.find(link, order, currPage, pageSize);
                totalCount = linkList.size();
                Pager pager = new Pager(getHttpRequest());
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
                pageStr = pager.getOutStr();
            }
        }
        return "class";
    }

    /**
     * 链接列表
     *
     * @return
     */
    public String list() {
        site = getManageSite();
        if (site != null) {
            if (link == null) {
                link = new Link();
            }
            if (link.getSite() == null) {
                link.setSite(site);
            }
            //只有选择站点才查询
            if (link != null && link.getSite() != null) {
                link.setIsClass("0");
                if (!StringUtil.isNotEmpty(order)) {
                    order = "orderNum";
                }
                linkList = linkService.find(link, order, currPage, getPageSize());
                totalCount = linkList.size();
                Pager pager = new Pager(getHttpRequest());
                pager.appendParam("link.site");
                pager.appendParam("link.name");
                pager.appendParam("link.className");
                pager.appendParam("link.pageMark");
                pager.appendParam("link.type");
                pager.appendParam("order");
                pager.appendParam("pageSize");
                pager.appendParam("pageFuncId");
                pager.setCurrPage(currPage);
                pager.setPageSize(getPageSize());
                pager.setTotalCount(totalCount);
                pager.setOutStr("link_list.do");
                pageStr = pager.getOutStr();
            }
        }
        return "list";
    }


    /**
     * 编辑页面
     *
     * @return
     */
    public String edit() {
        site = getManageSite();
        if (site != null) {
            if (link != null && link.getId() != null && link.getId().trim().length() > 0) {
                link = linkService.findById(link.getId());
                if (link != null) {
                    linkClass = linkService.findById(link.getParId());
                }
            }
            //添加新连接的操作
            //提取第一个站点的链接分类
            Link classLink = new Link();

            classLink.setSite(site);
            classLink.setIsClass("1");
            classLink.setType(link.getType());
            linkList = linkService.findAll(classLink, order);
        }
        return "edit";
    }

    /**
     * 编辑处理
     *
     * @return
     */
    public String editDo() {
        //默认是添加新链接
        String oper = "添加";
        String message = "";
        Site site = siteService.findById(link.getSite().getId());
        link.setSite(site);
        try {
            link.setUrl(HtmlCodeUtil.url(link.getUrl()));
            if (link != null && link.getId() != null) {
                //编辑修改做的操作
                Link oldLink = linkService.findById(link.getId());
                if (oldLink != null) {
                    //编辑修改旧链接
                    //如果原来有和现在的pagemark不同则判断新的pagemark是否存在
                    if (StringUtil.isNotEmpty(link.getPageMark()) &&
                            StringUtil.isNotEmpty(oldLink.getPageMark()) &&
                            !oldLink.getPageMark().equals(link.getPageMark())) {

                        if (linkService.hasPageMark(link.getSite(), link.getType(), false, link.getPageMark())) {
                            message = "msg此页面标识已存在";
                            return null;
                        }
                    }
                    oldLink.setParId(link.getParId());
                    oldLink.setUrl(link.getUrl());
                    oldLink.setSite(link.getSite());
                    oldLink.setName(link.getName());
                    oldLink.setOrderNum(link.getOrderNum());
                    oldLink.setIsOk(link.getIsOk());
                    oldLink.setImg(link.getImg());
                    oldLink.setPageMark(link.getPageMark());
                    oper = "修改";
                    linkService.update(oldLink);
                }
            } else {
                //添加
                //判断页面标识是否已存在
                if (StringUtil.isNotEmpty(link.getPageMark()) &&
                        linkService.hasPageMark(link.getSite(), link.getType(), false, link.getPageMark())) {
                    message = "msg此页面标识已存在";
                    return null;
                }
                linkService.add(link);
            }
            logContent = oper + "链接(" + link.getName() + ")成功!";
            message = "success " + link.getSite().getId();
        } catch (Exception e) {
            logContent = oper + "链接(" + link.getName() + ")失败:" + e.toString() + "!";
        }
        operlogsService.log(getLoginName(), logContent, getHttpRequest());
        write(message, "GBK");
        return null;
    }


    /**
     * 删除
     *
     * @return
     */
    public String del() {
        if (ids != null && ids.trim().length() > 0) {
            StringBuilder sb = new StringBuilder();
            String[] idArr = ids.split(";");
            if (idArr != null && idArr.length > 0) {
                for (int i = 0; i < idArr.length; i++) {
                    if (idArr[i].trim().length() > 0) {
                        try {
                            link = linkService.findById(idArr[i]);
                            if (link != null) {
                                linkService.delete(idArr[i]);
                                sb.append(idArr[i] + ";");
                                logContent = "删除链接(" + link.getName() + ")成功!";
                            }
                        } catch (Exception e) {

                            logContent = "删除链接(" + link.getName() + ")失败:" + e.toString() + "!";
                        }
                        operlogsService.log(getLoginName(), logContent, getHttpRequest());
                    }
                }
            }
            write(sb.toString(), "GBK");
        }
        return null;
    }

}
