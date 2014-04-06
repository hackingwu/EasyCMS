package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.User;
import cn.easycms.service.OperlogsService;
import cn.easycms.service.UserService;
import cn.easycms.util.ResponseUtil;
import cn.easycms.util.URIEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 * Created by hackingwu on 2014/4/1.
 */
public class UserAction extends BaseAction {
    private UserService userService;
    private OperlogsService operlogsService;
    private String RememberMe;
    private String ValidateCode;
    private String msg;
    private User user;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setOperlogsService(OperlogsService operlogsService) {
        this.operlogsService = operlogsService;
    }

    public String getValidateCode() {
        return ValidateCode;
    }

    public void setValidateCode(String validateCode) {
        ValidateCode = validateCode;
    }

    public String login() {
        if (RememberMe != null && RememberMe.equals("on")) {
            Cookie cookie = new Cookie("loginName", URIEncoder.escape(user.getLoginName()));

            cookie.setMaxAge(60 * 60 * 24 * 365);
            getHttpResponse().addCookie(cookie);
        }
        HttpSession session = getHttpSession();

        if (ValidateCode != null && ValidateCode.equals(session.getAttribute("rand"))) {
            msg = userService.isExist(session,user);
        } else {
            msg = "验证码错误!";
        }
        if (msg == null || "".equals(msg)) {

            operlogsService.log(user.getLoginName(), "登陆系统", getHttpRequest());
            return SUCCESS;
        } else {
            ResponseUtil.writeUTF(getHttpResponse(), "<script>alert('" + msg + "');history.back();</script>");
            return null;
        }
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getRememberMe() {
        return RememberMe;
    }

    public void setRememberMe(String rememberMe) {
        RememberMe = rememberMe;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
