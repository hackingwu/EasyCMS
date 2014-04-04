package cn.easycms.model;

import java.util.Date;

/**
 * Created by hackingwu on 2014/3/31.
 */
public class User {

    private String id;
    private String loginName;
    private String roleNames;
    private String name;
    private String pwd;
    private String sex;
    private String birthday;
    private String tel;
    private String mobilephone;
    private String email;
    private String isOk;
    private Date lastLoginTime;
    private Date lastestLoginTime;
    private Integer loginFailNum;
    private Integer loginNum;
    private Date addTime;
    private String unitNames;
    private String unitIds;
    private String ismail;

    public Date getLastestLoginTime() {
        return lastestLoginTime;
    }

    public void setLastestLoginTime(Date lastedLoginTime) {
        this.lastestLoginTime = lastedLoginTime;
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

    public String getRoleNames() {
        return roleNames;
    }

    public void setRoleNames(String roleNames) {
        this.roleNames = roleNames;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIsOk() {
        return isOk;
    }

    public void setIsOk(String isOk) {
        this.isOk = isOk;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Integer getLoginFailNum() {
        return loginFailNum;
    }

    public void setLoginFailNum(Integer loginFailNum) {
        this.loginFailNum = loginFailNum;
    }

    public Integer getLoginNum() {
        return loginNum;
    }

    public void setLoginNum(Integer loginNum) {
        this.loginNum = loginNum;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getUnitNames() {
        return unitNames == null ? "" : unitIds;
    }

    public void setUnitNames(String unitNames) {
        this.unitNames = unitNames;
    }

    public String getUnitIds() {
        return unitIds == null ? "" : unitIds;
    }

    public void setUnitIds(String unitIds) {
        this.unitIds = unitIds;
    }

    public String getIsmail() {
        return ismail == null ? "" : ismail;
    }

    public void setIsmail(String ismail) {
        this.ismail = ismail;
    }
}
