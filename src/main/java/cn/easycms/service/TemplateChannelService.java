package cn.easycms.service;

import cn.easycms.dao.TemplateChannelDaoImpl;
import cn.easycms.model.Channel;
import cn.easycms.model.Site;
import cn.easycms.model.Template;
import cn.easycms.model.TemplateChannel;
import cn.easycms.util.StringUtil;
import com.sun.org.apache.xalan.internal.utils.XMLSecurityPropertyManager;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import java.util.*;

/**
 * Created by hackingwu on 2014/4/10.
 */
public class TemplateChannelService {
    private TemplateChannelDaoImpl templateChannelDaoImpl;
    private ChannelService channelService;

    public void setChannelService(ChannelService channelService) {
        this.channelService = channelService;
    }

    public void setTemplateChannelDaoImpl(TemplateChannelDaoImpl templateChannelDaoImpl) {
        this.templateChannelDaoImpl = templateChannelDaoImpl;
    }

    public int count(Template template) {
        Query query = templateChannelDaoImpl.getCurrentSession()
                .createQuery("select count(*) from TemplateChannel where templateId=?")
                .setParameter(0, template);
        return ((Long) query.uniqueResult()).intValue();
    }



    public List<TemplateChannel> findByParWithTemplate(Template templateId, String parId) {

        return findByParWithTemplate(templateId, parId, null, null,"orderNum");
    }

    public List<TemplateChannel> findByParWithTemplate(Template templateId, String parId, String state, String navigation,String order) {
        Criteria criteria = templateChannelDaoImpl.getCurrentSession()
                .createCriteria(TemplateChannel.class);
        if (templateId!=null){
            criteria.add(Restrictions.eq("templateId", templateId));
        }
        if (StringUtil.isNotEmpty(parId)){
            criteria.add(Restrictions.eq("parId", parId));
        }
        if (StringUtil.isNotEmpty(state)){
            criteria.add(Restrictions.eq("state", state));
        }
        if (StringUtil.isNotEmpty(navigation)){
            criteria.add(Restrictions.eq("navigation", navigation));
        }
        if (StringUtil.isNotEmpty(order)){
            criteria.addOrder(Property.forName(order).asc());
        }

        return criteria.list();


    }


}
