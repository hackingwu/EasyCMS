package cn.easycms.service;

import cn.easycms.dao.HtmlQuartzDaoImpl;
import cn.easycms.model.HtmlQuartz;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/22.
 */
public class HtmlQuartzService {
    private HtmlQuartzDaoImpl htmlQuartzDaoImpl;

    public void setHtmlQuartzDaoImpl(HtmlQuartzDaoImpl htmlQuartzDaoImpl) {
        this.htmlQuartzDaoImpl = htmlQuartzDaoImpl;
    }

    public HtmlQuartz findByChannelId(String channelId) {
        if (channelId != null) {
            List list = htmlQuartzDaoImpl.getCurrentSession().createCriteria(HtmlQuartz.class)
                    .add(Restrictions.eq("channelId", channelId))
                    .list();
            if (list != null && list.size() > 0) {
                return (HtmlQuartz) list.get(0);
            }
        }
        return null;
    }

    public HtmlQuartz findBySiteId(String siteId) {
        List<HtmlQuartz> list = htmlQuartzDaoImpl.getCurrentSession().createCriteria(HtmlQuartz.class).add(Restrictions.eq("siteId", siteId)).list();
        if (list != null && list.size() > 0)
            return list.get(0);
        return null;
    }
}
