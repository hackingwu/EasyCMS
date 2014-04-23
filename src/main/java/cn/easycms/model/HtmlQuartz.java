package cn.easycms.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by hackingwu on 2014/4/21.
 */
public class HtmlQuartz implements Serializable{
    private String id;

    private String siteId;
    private String channelId;
    private String type;
    private Integer exeTimeHour;
    private Integer exeTimeMin;
    private String intervalType;
    private Integer intervalHour;
    private Integer intervalMin;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    public String getChannelId() {
        return channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getExeTimeHour() {
        return exeTimeHour;
    }

    public void setExeTimeHour(Integer exeTimeHour) {
        this.exeTimeHour = exeTimeHour;
    }

    public Integer getExeTimeMin() {
        return exeTimeMin;
    }

    public void setExeTimeMin(Integer exeTimeMin) {
        this.exeTimeMin = exeTimeMin;
    }

    public String getIntervalType() {
        return intervalType;
    }

    public void setIntervalType(String intervalType) {
        this.intervalType = intervalType;
    }

    public Integer getIntervalHour() {
        return intervalHour;
    }

    public void setIntervalHour(Integer intervalHour) {
        this.intervalHour = intervalHour;
    }

    public Integer getIntervalMin() {
        return intervalMin;
    }

    public void setIntervalMin(Integer intervalMin) {
        this.intervalMin = intervalMin;
    }
}
