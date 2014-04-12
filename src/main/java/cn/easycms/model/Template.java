package cn.easycms.model;

/**
 * Created by hackingwu on 2014/4/8.
 */
public class Template {
    private String id;
    private String name;
    private String state;
    private String orderNum;
    private String useSites;
    private String useSiteNames;
    private User   addUser;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getUseSites() {
        return useSites;
    }

    public void setUseSites(String useSites) {
        this.useSites = useSites;
    }

    public String getUseSiteNames() {
        return useSiteNames;
    }

    public void setUseSiteNames(String useSiteNames) {
        this.useSiteNames = useSiteNames;
    }

    public User getAddUser() {
        return addUser;
    }

    public void setAddUser(User addUser) {
        this.addUser = addUser;
    }

    public final static String STATE_Y="1";
    public final static String STATA_N="0";
    public final static String STATE_DEL="3";
    private String stateStr;
    private String noDel;

    public String getNoDel() {
        return noDel;
    }

    public void setNoDel(String noDel) {
        this.noDel = noDel;
    }

    public String getStateStr() {
        return state.equals("2")?"已删除":(state.equals("0")?"否":"是");
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }
}
