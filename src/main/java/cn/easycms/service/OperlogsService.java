package cn.easycms.service;

import cn.easycms.dao.OperlogsDaoImpl;
import cn.easycms.model.Operlogs;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

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
            System.out.println(request.getRemoteAddr());
            log.setIp(request.getRemoteAddr());

            log.setLoginName(loginName);
            log.setOperTime(new Date());
            operlogsDaoImpl.save(log);
        }
    }

    private void proSearch(Operlogs operlogs, Criteria criteria) {
        if (operlogs != null && criteria != null) {
            if (StringUtil.isNotEmpty(operlogs.getLoginName())) {
                criteria.add(Restrictions.like("loginName", "%" + operlogs.getLoginName().trim() + "%"));
            }
            if (StringUtil.isNotEmpty(operlogs.getContent())) {
                criteria.add(Restrictions.like("content", "%" + operlogs.getContent().trim() + "%"));
            }
            if (StringUtil.isNotEmpty(operlogs.getIp())) {
                criteria.add(Restrictions.like("ip", "%" + operlogs.getIp().trim() + "%"));
            }
        }
    }

    public List<Operlogs> getListWithOperlogAndUserAndCurrPageAndPageSize(Operlogs operlogs, String loginName, int currPage, int pageSize) {
        Criteria criteria = operlogsDaoImpl.getCurrentSession().createCriteria(Operlogs.class);
        proSearch(operlogs, criteria);
        if (!loginName.equals("admin"))
            criteria.add(Restrictions.eq("loginName", loginName));
        if (pageSize > 0 && currPage >= 1) {
            criteria.setMaxResults(pageSize);
            criteria.setFirstResult((currPage - 1) * pageSize);
        }
        return criteria.list();
    }
}
