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
}
