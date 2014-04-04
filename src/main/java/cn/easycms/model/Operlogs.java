package cn.easycms.model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by hackingwu on 2014/4/2.
 */
public class Operlogs {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private String id;
    private String loginName;
    private Date operTime;
    private String operTimeStr;
    private String content;
    private String ip;

    public static SimpleDateFormat getSdf() {
        return sdf;
    }

    public static void setSdf(SimpleDateFormat sdf) {
        Operlogs.sdf = sdf;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public Date getOperTime() {
        return operTime;
    }

    public void setOperTime(Date operTime) {
        this.operTime = operTime;
    }

    public String getOperTimeStr() {
        if (operTime != null) {
            return sdf.format(operTime);
        }
        return "";
    }


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
}
