package cn.easycms.base;

import cn.easycms.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 获取HttpServletRequest,HttpSession,获取当前登录的用户，以及他的登录名称（LoginName），或者登陆的企业的名称。
 * Created by hackingwu on 2014/4/7.
 */
public class BaseTag extends TagSupport{
        public HttpServletRequest getRequest(){
            return (HttpServletRequest)pageContext.getRequest();
        }
        public HttpSession getSession(){
            return getRequest().getSession();
        }

    /**
     * 获取当前在session中保存的User
     * @return 登陆的用户
     */
        public User getLoginAdmin(){
            if (getSession().getAttribute("loginAdmin")!=null){
                return (User)getSession().getAttribute("loginAdmin");
            }
            return null;
        }

        /**
         *获取当前用户的登录名称
         * @return User的loginName
         */
        public String getLoginName(){
            if (getLoginAdmin()!=null){
                return getLoginAdmin().getLoginName();
            }
            return "";
        }

        public String getLoginCompany(){
            if (getSession().getAttribute("loginCompany")!=null){
                return (String)getSession().getAttribute("loginCompany");
            }
            return "";
        }
}
