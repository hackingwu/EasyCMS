package cn.easycms.model;

import cn.easycms.model.Site;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class Link {
    private String id;
    private String parId;
    private String name;
    private String url;
    private String isOk;
    private Integer orderNum;
    private Site site;
    private String type;
    private String img;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParId() {
        return parId;
    }

    public void setParId(String parId) {
        this.parId = parId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIsOk() {
        return isOk;
    }

    public void setIsOk(String isOk) {
        this.isOk = isOk;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPageMark() {
        return pageMark;
    }

    public void setPageMark(String pageMark) {
        this.pageMark = pageMark;
    }

    //pageMark就是Name的首字母缩写
    private String pageMark;
}
