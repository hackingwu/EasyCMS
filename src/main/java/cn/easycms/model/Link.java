package cn.easycms.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;


/**
 * Created by hackingwu on 2014/4/12.
 */
@Entity
public class Link {
    public final static String TYPE_DOWN = "1";
    public final static String TYPE_IMG = "2";
    public final static String TYPE_TEXT = "3";
    private String id;
    private String parId;
    private String name;
    private String url;
    private String isOk;
    private Integer orderNum;
    private Site site;
    private String type;
    private String img;
    //pageMark就是Name的首字母缩写
    private String pageMark;
    //-----------------Link独有，数据库中没有
    private String isClass;//是否查询分类,值为1，取类别，值为0，不取类别
    private String className;//分类名称
    private String isOkStr;
    private String pageMarks;
    private String classPageMarks;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
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

    @ManyToOne
    @JoinColumn(name = "site")
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

    @Transient
    public String getPageMarks() {
        return pageMarks;
    }

    public void setPageMarks(String pageMarks) {
        this.pageMarks = pageMarks;
    }

    @Transient
    public String getClassPageMarks() {
        return classPageMarks;
    }

    public void setClassPageMarks(String classPageMarks) {
        this.classPageMarks = classPageMarks;
    }

    @Transient
    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Transient
    public String getIsClass() {
        return isClass;
    }

    public void setIsClass(String isClass) {
        this.isClass = isClass;
    }

    @Transient
    public String getIsOkStr() {
        return isOk.equals("1") ? "是" : "否";
    }

    public void setIsOkStr(String isOkStr) {
        this.isOkStr = isOkStr;
    }

}
