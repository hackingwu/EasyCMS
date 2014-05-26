package cn.easycms.service;

import cn.easycms.dao.ChannelDaoImpl;
import cn.easycms.model.Channel;
import cn.easycms.model.Site;
import cn.easycms.util.StringUtil;
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
        if (channel != null) {
            channelDaoImpl.save(channel);
        }
        return channel.getId();
    }

    public List<Channel> findBySiteAndParAndStateAndNavi(Site site, String parId, String state, String navigation) {
        Criteria criteria = channelDaoImpl.getCurrentSession().createCriteria(Channel.class);
        if (site != null)
            criteria.add(Restrictions.eq("site", site));
        if (parId != null) {
            if (parId.equals("")) {
                criteria.add(Restrictions.or(Restrictions.eq("parId", ""), Restrictions.isNull("parId")));

            } else {
                criteria.add(Restrictions.eq("parId", parId));
            }
        }
        if (state != null) {
            criteria.add(Restrictions.eq("state", state));
        }
        if (navigation != null) {
            criteria.add(Restrictions.eq("navigation", navigation));
        }

        return criteria.list();

    }

    public Channel findById(String id) {

        return (Channel) channelDaoImpl.get(id);
    }

    public Channel findBySiteAndPageMark(Site site, String pageMark) {
        Criteria criteria = channelDaoImpl.getCurrentSession()
                .createCriteria(Channel.class)
                .add(Restrictions.eq("site", site));
        if (pageMark != null) {
            if (pageMark.equals("")) {
                criteria.add(Restrictions.eqOrIsNull("pageMark", ""));
            } else {
                criteria.add(Restrictions.eq("pageMark", pageMark));
            }
        }
        List list = criteria.list();
        return list != null && list.size() > 0 ? (Channel) list.get(0) : null;

    }

    public List<Channel> findListBySiteAndPageMark(Site site, String pageMark) {
        Criteria criteria = channelDaoImpl.getCurrentSession()
                .createCriteria(Channel.class);
                if (site!=null)
                    criteria.add(Restrictions.eq("site", site));
                if(StringUtil.isNotEmpty(pageMark))
                    criteria.add(Restrictions.eq("pageMark", pageMark));
                return criteria.list();

    }

    public boolean hasChildren(String id) {
        List list = channelDaoImpl.getCurrentSession()
                .createCriteria(Channel.class)
                .add(Restrictions.eq("parId", id))
                .list();
        return list.size() > 0 ? true : false;
    }

    public List<Channel> findSon(Site site, String parId, String state, String navigation) {
        List<Channel> list = new ArrayList<Channel>();
        return findSonPro(list, site, parId, state, navigation);
        //往下传list只是为了迭代
    }

    private List<Channel> findSonPro(List<Channel> list, Site site, String parId, String state, String navigation) {
        List<Channel> sonList = findBySiteAndParAndStateAndNavi(site, parId, state, navigation);
        if (sonList != null && sonList.size() > 0) {
            for (Channel channel : sonList) {
                list.add(channel);
                findSonPro(list, site, channel.getId(), state, navigation);
            }

        }
        return list;

    }

    public void delete(Channel channel) {
        channelDaoImpl.delete(channel);
    }

    //删除站点的所有channel
    public void delBySite(Site site) {
        List<Channel> channels = findBySiteAndParAndStateAndNavi(site, null, null, null);
        for (Channel channel : channels)
            delete(channel);
    }

    /**
     * 从父到子的顺序取得所有Channel
     *
     * @param channelId
     * @return
     */
    public List<Channel> findPath(String channelId) {

        List<Channel> channels = new ArrayList<Channel>();
        findParPath(channelId, channels);
        Channel temp = new Channel();
        //倒序保存
        for (int i = 0; i <= channels.size() / 2; i++) {
            temp = channels.get(i);
            channels.set(i, channels.get(channels.size() - 1 - i));
            channels.set(channels.size() - 1 - i, temp);
        }
        return channels;
    }

    /**
     * 迭代取得channel
     *
     * @param 父亲channelId
     */
    public void findParPath(String channelId, List<Channel> channels) {
        Channel channel = findById(channelId);
        if (channel != null)
            channels.add(channel);
        if (StringUtil.isNotEmpty(channel.getParId()))
            findParPath(channel.getParId(), channels);
    }

    public boolean hasPageMark(Site site, String pageMark){
        Criteria criteria = channelDaoImpl.getCurrentSession().createCriteria(Channel.class);
        criteria.add(Restrictions.eq("site",site));
        criteria.add(Restrictions.eq("pageMark",pageMark));
        return criteria.list().size()>0;

    }

    public void update(Channel channel) {
        if (channel!=null)
            channelDaoImpl.getCurrentSession().update(channel);
    }
}
