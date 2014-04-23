package cn.easycms.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by hackingwu on 2014/4/23.
 */
@Entity
public class Mail {
    private String id;
    private String unitId;

    private String userId;
    private String mailType;
    private String title;
    private String writer;
    private String tel;
    private String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    private String email;
    private String isOpen;
    private String content;
    private String quryCode;
    private String addTime;
    private String ip;
    private String state;
    private String reContent;
    private Date reTime;//replyTime
    private String proFlow;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid",strategy = "uuid")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name = "unitId")
    public String getUnitId() {
        return unitId;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId;
    }
    @Column(name="userId")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    @Column(name="mailType")
    public String getMailType() {
        return mailType;
    }

    public void setMailType(String mailType) {
        this.mailType = mailType;
    }
    @Column(name="title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    @Column(name="writer")
    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
    @Column(name = "tel")
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
    @Column(name="email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    @Column(name = "isOpen")
    public String getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(String isOpen) {
        this.isOpen = isOpen;
    }
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    @Column(name = "queryCode")
    public String getQuryCode() {
        return quryCode;
    }

    public void setQuryCode(String quryCode) {
        this.quryCode = quryCode;
    }
    @Column(name = "addTime")
    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }
    @Column(name = "ip")
    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
    @Column(name = "state")
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    @Column(name = "reContent")
    public String getReContent() {
        return reContent;
    }

    public void setReContent(String reContent) {
        this.reContent = reContent;
    }
    @Column(name = "reTime")
    public Date getReTime() {
        return reTime;
    }

    public void setReTime(Date reTime) {
        this.reTime = reTime;
    }
    @Column(name = "proFlow")
    public String getProFlow() {
        return proFlow;
    }

    public void setProFlow(String proFlow) {
        this.proFlow = proFlow;
    }

    private String unitIds;
    private String unitName;
    private String userName;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private String addTimeStr;
    private String reTimeStr;
    private String stateStr;
    @Transient
    public String getUnitIds() {
        return unitIds;
    }

    public void setUnitIds(String unitIds) {
        this.unitIds = unitIds;
    }
    @Transient
    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }
    @Transient
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    @Transient
    public String getAddTimeStr() {
        if (addTime!=null)
            addTimeStr = sdf.format(addTime);
        return addTimeStr;
    }

    public void setAddTimeStr(String addTimeStr) {
        this.addTimeStr = addTimeStr;
    }
    @Transient
    public String getReTimeStr() {
        if (reTime!=null)
            reTimeStr = sdf.format(reTime);
        return reTimeStr;
    }

    public void setReTimeStr(String reTimeStr) {
        this.reTimeStr = reTimeStr;
    }
    @Transient
    public String getStateStr() {
        if ("1".equals(state))
            stateStr = "已办结";
        else
            stateStr = "处理中";
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }
}
