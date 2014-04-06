package cn.easycms.model;

/**
 * Created by hackingwu on 2014/4/6.
 */
public class RoleFunc {
    private String id;
    private Role role;
    private Func func;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Func getFunc() {
        return func;
    }

    public void setFunc(Func func) {
        this.func = func;
    }
}
