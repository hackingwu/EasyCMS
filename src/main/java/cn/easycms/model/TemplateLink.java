package cn.easycms.model;

/**
 * Created by hackingwu on 2014/4/10.
 */
public class TemplateLink {
    private String id;
    private String parId;
    private String name;
    private String url;
    private String isOk;
    private Integer orderNum;
    private String site;
    private String type;
    private String img;
    private String pageMark;
    private Template template;

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

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
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

    public Template getTemplate() {
        return template;
    }

    public void setTemplate(Template template) {
        this.template = template;
    }

    private String isClass;//是否查询分类
    private String isOkStr;

    public String getIsClass() {
        return isClass;
    }

    public void setIsClass(String isClass) {
        this.isClass = isClass;
    }

    public String getIsOkStr() {
        return "1".equals(isOk)?"是":"否";
    }

    public void setIsOkStr(String isOkStr) {
        this.isOkStr = isOkStr;
    }
}
