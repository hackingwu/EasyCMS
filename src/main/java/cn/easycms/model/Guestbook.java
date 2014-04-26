package cn.easycms.model;

import java.beans.Transient;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by hackingwu on 2014/4/25.
 */
public class Guestbook {

    private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    private static SimpleDateFormat sdfFull=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private Date startTime;
    private Date endTime;
    private String startTimeStr;
    private String endTimeStr;
    private int countNum;
    private String dateName;
    private String siteName;
    private String guestBookState;
    private String siteId;
    private String ip;
    private String memberId;
    private String memberName;
    private String name;
    private String sex;
    private String sexStr;
    private String email;
    private String qq;
    private String tel;
    private String title;
    private String content;
    private Date addTime;
    private String addTimeStr;
    private String reTimeStr;
    private String state;
    private String stateStr;
    private String reConTent;
    private Date reTime;
    private String reUserId;
    private String reUserName;

    @Transient
    public static SimpleDateFormat getSdf() {
        return sdf;
    }

    public static void setSdf(SimpleDateFormat sdf) {
        Guestbook.sdf = sdf;
    }
    @Transient
    public static SimpleDateFormat getSdfFull() {
        return sdfFull;
    }

    public static void setSdfFull(SimpleDateFormat sdfFull) {
        Guestbook.sdfFull = sdfFull;
    }

    @Transient
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @Transient
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Transient
    public String getStartTimeStr() {
        if(startTime!=null){
            startTimeStr = sdfFull.format(startTime);
        }

        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    @Transient
    public String getEndTimeStr() {
        if(endTime!=null)
            endTimeStr = sdfFull.format(endTime);
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    @Transient
    public int getCountNum() {
        return countNum;
    }

    public void setCountNum(int countNum) {
        this.countNum = countNum;
    }

    @Transient
    public String getDateName() {
        return dateName;
    }

    public void setDateName(String dateName) {
        this.dateName = dateName;
    }

    @Transient
    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    @Transient
    public String getGuestBookState() {
        return guestBookState;
    }

    public void setGuestBookState(String guestBookState) {
        this.guestBookState = guestBookState;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Transient
    public String getSexStr() {
        if (sex.equals("1"))
            sexStr = "男";
        else
            sexStr = "女";
        return sexStr;
    }

    public void setSexStr(String sexStr) {
        this.sexStr = sexStr;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Transient
    public String getStateStr() {
        if (state.equals("1"))
            stateStr = "已审核";
        else if (state.equals("2"))
            stateStr = "审核不通过";
        else
            stateStr = "未审核";
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    public String getReConTent() {
        return reConTent;
    }

    public void setReConTent(String reConTent) {
        this.reConTent = reConTent;
    }

    public Date getReTime() {
        return reTime;
    }

    public void setReTime(Date reTime) {
        this.reTime = reTime;
    }

    public String getReUserId() {
        return reUserId;
    }

    public void setReUserId(String reUserId) {
        this.reUserId = reUserId;
    }

    public String getReUserName() {
        return reUserName;
    }

    public void setReUserName(String reUserName) {
        this.reUserName = reUserName;
    }
}
