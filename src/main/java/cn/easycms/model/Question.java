package cn.easycms.model;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
/**
 * Created by hackingwu on 2014/4/23.
 */
@Entity
public class Question {
    private String id;
    private int selectNum;

    private String name;
    private String detail;

    private String selectType;
    private String selectTypeStr;

    private String isOk;

    private Site   site;

    private String addUser;

    private Date addTime;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid",strategy = "uuid")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSelectType() {
        return selectType;
    }

    public void setSelectType(String selectType) {
        this.selectType = selectType == null ? null : selectType.trim();
    }

    public String getIsOk() {
        return isOk;
    }

    public void setIsOk(String isOk) {
        this.isOk = isOk == null ? null : isOk.trim();
    }

    @ManyToOne
    @JoinColumn(name = "site")
    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site == null ? null : site;
    }

    public String getAddUser() {
        return addUser;
    }

    public void setAddUser(String addUser) {
        this.addUser = addUser == null ? null : addUser.trim();
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }
    @Transient
    public int getSelectNum() {
        if (selectNum==0) {
            selectNum=1;
        }
        return selectNum;
    }

    public void setSelectNum(int selectNum) {
        this.selectNum = selectNum;
    }
    @Transient
    public String getSelectTypeStr() {
        if ("1".equals(selectType)) {
            selectTypeStr="checkbox";
        }else {
            selectTypeStr="radio";
        }
        return selectTypeStr;
    }

    public void setSelectTypeStr(String selectTypeStr) {
        this.selectTypeStr = selectTypeStr;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
