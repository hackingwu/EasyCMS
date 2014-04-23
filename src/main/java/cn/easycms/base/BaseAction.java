package cn.easycms.base;

import cn.easycms.model.Site;
import cn.easycms.model.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by hackingwu on 2014/4/1.
 */
public class BaseAction extends ActionSupport {
    private String showMessage;
    private String forwardUrl = "";
    private int forwardSeconds = 10;
    private Map<String,Object> config;

    public String getShowMessage() {
        return showMessage;
    }

    public void setShowMessage(String showMessage) {
        this.showMessage = showMessage;
    }

    public String getForwardUrl() {
        return forwardUrl;
    }

    public void setForwardUrl(String forwardUrl) {
        this.forwardUrl = forwardUrl;
    }

    public int getForwardSeconds() {
        return forwardSeconds;
    }

    public void setForwardSeconds(int forwardSeconds) {
        this.forwardSeconds = forwardSeconds;
    }

    public HttpServletResponse getHttpResponse() {
        return ServletActionContext.getResponse();
    }

    public HttpServletRequest getHttpRequest() {
        return ServletActionContext.getRequest();
    }

    public HttpSession getHttpSession() {
        return getHttpRequest().getSession();
    }

    public ServletContext getServletContext(){
        return ServletActionContext.getServletContext();
    }
    public String getContextPath(){
        return getHttpRequest().getContextPath()+"/";
    }
    public boolean isAdminLogin(){
        return "admin".equals(getLoginName());
    }
    public boolean isSiteAdmin(){
        if (getHttpSession().getAttribute("siteAdmin")!=null)
            return (Boolean)getHttpSession().getAttribute("siteAdmin");
        return false;
    }
    public String getLoginName() {
        if (getLoginAdmin()!=null){
            return getLoginAdmin().getLoginName();
        }
        return "";
    }

    public User getLoginAdmin() {
        if (getHttpSession().getAttribute("loginAdmin")!=null){
            return (User)getHttpSession()
                    .getAttribute("loginAdmin");
        }
        return null;
    }
    public String showMessage(String showMessage,String forwardUrl,int forwardSeconds){

        setShowMessage(showMessage);
        setForwardSeconds(forwardSeconds);
        setForwardUrl(forwardUrl);
        return "showMessage";

    }
    public String showMessage(String showMessage){
        return showMessage(showMessage,forwardUrl,forwardSeconds);
    }
    /**
     * 获取当前管理站点
     *
     */
    public Site getManageSite(){
        Object site = getHttpSession().getAttribute("manageSite");
        if (site!=null){
            return (Site)site;
        }
        return null;
    }
    /**
     * 获取配置
     */
    public Map<String, Object> getConfig(){
        if (getApplication().get("config")!=null) {
            return (Map<String, Object>)getApplication().get("config");
        }else {
            //重新生成
            return setConfig();
        }
    }
    public void setConfig(){

    }
    public Map<String,Object> getApplication(){
        return ServletActionContext.getContext().getApplication();
    }
}
