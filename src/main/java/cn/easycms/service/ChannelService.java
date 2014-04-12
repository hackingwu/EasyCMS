package cn.easycms.service;

import cn.easycms.dao.ChannelDaoImpl;
import cn.easycms.model.Channel;

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
}
