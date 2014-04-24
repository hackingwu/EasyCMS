package cn.easycms.model;

import javax.persistence.Entity;
import javax.persistence.Transient;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by hackingwu on 2014/4/24.
 */
@Entity
public class Report {
    private String id;
    private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    private String addTimeStr;
    private String reTimeStr;
    private String name;
    private String unit;
    private String fileName;
    private String fileNum;
    private String linkMan;
    private String issuer;
    private String tel;
    private Date addTime;
    private String attch;
    private String queryCode;
    private String ip;
    private String state;
    private String stateStr;
    private String reContent;
    private Date reTime;
    private String proFlow;
    private String userId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Transient
    public SimpleDateFormat getSdf() {
        return sdf;
    }

    public void setSdf(SimpleDateFormat sdf) {
        this.sdf = sdf;
    }
    @Transient
    public String getAddTimeStr() {
        return addTimeStr;
    }

    public void setAddTimeStr(String addTimeStr) {
        this.addTimeStr = addTimeStr;
    }
    @Transient
    public String getReTimeStr() {
        return reTimeStr;
    }

    public void setReTimeStr(String reTimeStr) {
        this.reTimeStr = reTimeStr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getIssuer() {
        return issuer;
    }

    public void setIssuer(String issuer) {
        this.issuer = issuer;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getAttch() {
        return attch;
    }

    public void setAttch(String attch) {
        this.attch = attch;
    }

    public String getQueryCode() {
        return queryCode;
    }

    public void setQueryCode(String queryCode) {
        this.queryCode = queryCode;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getStateStr() {
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    public String getReContent() {
        return reContent;
    }

    public void setReContent(String reContent) {
        this.reContent = reContent;
    }

    public Date getReTime() {
        return reTime;
    }

    public void setReTime(Date reTime) {
        this.reTime = reTime;
    }

    public String getProFlow() {
        return proFlow;
    }

    public void setProFlow(String proFlow) {
        this.proFlow = proFlow;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
