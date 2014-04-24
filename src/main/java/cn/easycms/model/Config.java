package cn.easycms.model;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by hackingwu on 2014/4/24.
 */
@Entity
public class Config {
    private String code;

    private String name;

    private String configValue;

    private Integer orderNum;

    @Id
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue == null ? null : configValue.trim();
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

}
