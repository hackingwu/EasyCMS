package cn.easycms.model;

import cn.easycms.util.DateUtil;
import org.hibernate.annotations.Entity;

import javax.persistence.Transient;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hackingwu on 2014/4/25.
 */
@Entity
public class Comment {
    private String id;
    @Transient
    private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    @Transient private static SimpleDateFormat sdffull=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Transient private Date startTime;
    @Transient private Date endTime;
    @Transient private String startTimeStr;
    @Transient private String endTimeStr;
    @Transient private int countNum;
    @Transient private String dateName;
    @Transient private String siteName;
    @Transient private String commentState;
    private String siteId;
    private String memberId;
    private String memberName;
    private String isAnonymous;
    @Transient private String isAnonymousStr;
    private String objId;
    private String objType;
    @Transient private String objTypeStr;
    @Transient private Map<String, String> objTypes;
    private String ip;
    private Date addTime;
    @Transient private String addTimeStr;
    private String state;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Transient private String stateStr;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getAddTime() {

        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getAddTimeStr() {
        if (addTime!=null)
            addTimeStr = DateUtil.format(addTime, "yyyy-MM-dd HH:mm");
        return addTimeStr;
    }

    public void setAddTimeStr(String addTimeStr) {
        this.addTimeStr = addTimeStr;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getStateStr() {
        if (state.equals("1"))
            stateStr = "已审核";
        else
            stateStr = "未审核";
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    public static SimpleDateFormat getSdf() {
        return sdf;
    }

    public static void setSdf(SimpleDateFormat sdf) {
        Comment.sdf = sdf;
    }

    public static SimpleDateFormat getSdffull() {
        return sdffull;
    }

    public static void setSdffull(SimpleDateFormat sdffull) {
        Comment.sdffull = sdffull;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getStartTimeStr() {
        startTimeStr = "";
        if (startTime!=null)
            startTimeStr = sdffull.format(startTime);
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    public String getEndTimeStr() {
        endTimeStr = "";
        if (endTime!=null)
            endTimeStr = sdffull.format(endTime);
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    public int getCountNum() {
        return countNum;
    }

    public void setCountNum(int countNum) {
        this.countNum = countNum;
    }

    public String getDateName() {
        return dateName;
    }

    public void setDateName(String dateName) {
        this.dateName = dateName;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getCommentState() {
        return commentState;
    }

    public void setCommentState(String commentState) {
        this.commentState = commentState;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
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

    public String getIsAnonymous() {
        return isAnonymous;
    }

    public void setIsAnonymous(String isAnonymous) {
        this.isAnonymous = isAnonymous;
    }

    public String getIsAnonymousStr() {
        isAnonymousStr = "否";
        if(isAnonymous.equals("1"))
            isAnonymousStr ="是";
        return isAnonymousStr;
    }

    public void setIsAnonymousStr(String isanonymousStr) {
        this.isAnonymousStr = isanonymousStr;
    }

    public String getObjId() {
        return objId;
    }

    public void setObjId(String objId) {
        this.objId = objId;
    }

    public String getObjType() {
        return objType;
    }

    public void setObjType(String objType) {
        this.objType = objType;
    }

    public String getObjTypeStr() {
        Map<String, String> objtypes=getObjTypes();
        if (objtypes!=null && getObjType()!=null) {
            if (objtypes.containsKey(objType.trim())) {
                objTypeStr = objtypes.get(objType.trim());
            }
        }
        return objTypeStr;
    }

    public void setObjTypeStr(String objTypeStr) {
        this.objTypeStr = objTypeStr;
    }

    public Map<String, String> getObjTypes() {
        objTypes=new HashMap<String, String>();
        objTypes.put("info", "信息");
        return objTypes;
    }

    public void setObjTypes(Map<String, String> objTypes) {
        this.objTypes = objTypes;
    }

    private String content;
}
