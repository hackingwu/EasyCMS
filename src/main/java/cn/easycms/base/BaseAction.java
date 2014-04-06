package cn.easycms.base;

import cn.easycms.model.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by hackingwu on 2014/4/1.
 */
public class BaseAction extends ActionSupport {
    public HttpServletResponse getHttpResponse() {
        return ServletActionContext.getResponse();
    }

    public HttpServletRequest getHttpRequest() {
        return ServletActionContext.getRequest();
    }

    public HttpSession getHttpSession() {
        return getHttpRequest().getSession();
    }

    public boolean isAdminLogin(){
        return "admin".equals(getLoginName());
    }

    private String getLoginName() {
        if (getLoginAdmin()!=null){
            return getLoginAdmin().getLoginName();
        }
        return "";
    }

    private User getLoginAdmin() {
        if (getHttpSession().getAttribute("loginAdmin")!=null){
            return (User)getHttpSession()
                    .getAttribute("loginAdmin");
        }
        return null;
    }
}
