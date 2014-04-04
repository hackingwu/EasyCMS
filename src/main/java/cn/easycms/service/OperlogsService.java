package cn.easycms.service;

import cn.easycms.dao.OperlogsDaoImpl;
import cn.easycms.model.Operlogs;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by hackingwu on 2014/4/3.
 */
public class OperlogsService {
    private OperlogsDaoImpl operlogsDaoImpl;

    public void setOperlogsDaoImpl(OperlogsDaoImpl operlogsDaoImpl) {
        this.operlogsDaoImpl = operlogsDaoImpl;
    }

    public void log(String loginName, String content, HttpServletRequest request) {
        if (content != null && content.trim().length() > 0) {
            Operlogs log = new Operlogs();

            log.setContent(content);
            log.setIp(request.getRemoteAddr());

            log.setLoginName(loginName);
            log.setOperTime(new Date());
            operlogsDaoImpl.save(log);
        }
    }
}
