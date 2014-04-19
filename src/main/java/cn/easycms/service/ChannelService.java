package cn.easycms.service;

import cn.easycms.dao.ChannelDaoImpl;
import cn.easycms.model.Channel;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class ChannelService {
    private ChannelDaoImpl channelDaoImpl;

    public void setChannelDaoImpl(ChannelDaoImpl channelDaoImpl) {
        this.channelDaoImpl = channelDaoImpl;
    }

    public String insert(Channel channel) {
        if (channel != null){
            channelDaoImpl.save(channel);
        }
        return channel.getId();
    }
    public List<Channel> findBySiteAndParAndStateAndNavi(String siteId,String parId,String state,String navigation){
        Criteria criteria = channelDaoImpl.getCurrentSession().createCriteria(Channel.class);
        criteria.add(Restrictions.eq("siteId",siteId));
        if (parId!=null){
            criteria.add(Restrictions.eq("parId",parId));
        }
        if (state!=null){
            criteria.add(Restrictions.eq("state",state));
        }
        if (navigation!=null){
            criteria.add(Restrictions.eq("navigation",navigation));
        }

        return criteria.list();

    }

    public Channel findById(String id) {

        return (Channel)channelDaoImpl.get(id);
    }

    public Channel findBySiteAndPageMark(String siteId, String pageMark) {
        return (Channel)channelDaoImpl.getCurrentSession()
                .createCriteria(Channel.class)
                .add(Restrictions.eq("site",siteId))
                .add(Restrictions.eq("pageMark",pageMark))
                .list().get(0);

    }
    public List<Channel> findListBySiteAndPageMark(String siteId, String pageMark) {
        return channelDaoImpl.getCurrentSession()
                .createCriteria(Channel.class)
                .add(Restrictions.eq("site",siteId))
                .add(Restrictions.eq("pageMark",pageMark))
                .list();

    }
    public boolean hasChildren(String id){
        List list = channelDaoImpl.getCurrentSession()
                .createCriteria("Channel.class")
                .add(Restrictions.eq("parId",id))
                .list();
        return list.size()>0?true:false;
    }

    public List<Channel> findSon(String siteId, String parId, String state, String navigation) {
        List<Channel> list = new ArrayList<Channel>();
        return findSonPro(list,siteId,parId,state,navigation);
        //往下传list只是为了迭代
    }

    private List<Channel> findSonPro(List<Channel> list, String siteId, String parId, String state, String navigation) {
        List<Channel> sonList = findBySiteAndParAndStateAndNavi(siteId,parId,state,navigation);
        if (sonList!=null && sonList.size()>0){
            for(Channel channel:sonList){
                list.add(channel);
                findSonPro(list,siteId,channel.getId(),state,navigation);
            }

        }
        return list;

    }

}
