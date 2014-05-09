package cn.easycms.model;

import cn.easycms.util.StringUtil;

/**
 * Created by hackingwu on 2014/4/11.
 */
public class Channel {
    private String id;
    private String name;
    private String template;
    private String contentTemplate;
    private String img;
    private String description;
    private String parId;
    private Site site;
    private String url;
    private String state;
    private Integer orderNum;
    private Integer clickNum;
    private String navigation;
    private String pageMark;
    private String htmlChannel;
    private String htmlChannelOld;
    private String htmlParChannel;
    private String htmlSite;
    private Integer indexNum;
    private Integer maxPage;
    private String sitePath;
    private String hasChildren;
    private String pageUrl = "";
    private String folder;

    public String getSitePath() {
        return sitePath;
    }

    public void setSitePath(String sitePath) {
        this.sitePath = sitePath;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getContentTemplate() {
        return contentTemplate;
    }

    public void setContentTemplate(String contentTemplate) {
        this.contentTemplate = contentTemplate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getParId() {
        return parId;
    }

    public void setParId(String parId) {
        this.parId = parId;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public String getNavigation() {
        return navigation;
    }

    public void setNavigation(String navigation) {
        this.navigation = navigation;
    }

    public String getPageMark() {
        return pageMark;
    }

    public void setPageMark(String pageMark) {
        this.pageMark = pageMark;
    }

    public String getHtmlChannel() {
        return htmlChannel;
    }

    public void setHtmlChannel(String htmlChannel) {
        this.htmlChannel = htmlChannel;
    }

    public String getHtmlChannelOld() {
        return htmlChannelOld;
    }

    public void setHtmlChannelOld(String htmlChannelOld) {
        this.htmlChannelOld = htmlChannelOld;
    }

    public String getHtmlParChannel() {
        return htmlParChannel;
    }

    public void setHtmlParChannel(String htmlParChannel) {
        this.htmlParChannel = htmlParChannel;
    }

    public String getHtmlSite() {
        return htmlSite;
    }

    public void setHtmlSite(String htmlSite) {
        this.htmlSite = htmlSite;
    }

    public Integer getIndexNum() {
        return indexNum;
    }

    public void setIndexNum(Integer indexNum) {
        this.indexNum = indexNum;
    }

    public Integer getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(Integer maxPage) {
        this.maxPage = maxPage;
    }

    public String isHasChildren() {
        return hasChildren;
    }

    public void setHasChildren(String hasChildren) {
        this.hasChildren = hasChildren;
    }

    public String getPageUrl() {
        if (StringUtil.isNotEmpty(url)) {
            pageUrl = url;
        } else {
            pageUrl = (sitePath != null ? sitePath : "") + getFolder() + "/index.html";
        }
        return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
        this.pageUrl = pageUrl;
    }

    public String getFolder() {
        if (StringUtil.isNotEmpty(pageMark))
            folder = pageMark;
        else if (indexNum > 0)
            folder = String.valueOf(indexNum);
        else
            folder = id;
        return folder;
    }

    public void setFolder(String folder) {
        this.folder = folder;
    }
}
