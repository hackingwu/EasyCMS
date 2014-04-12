package cn.easycms.service;

import cn.easycms.dao.LinkDaoImpl;
import cn.easycms.model.Link;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class LinkService {
    private LinkDaoImpl linkDaoImpl;

    public void setLinkDaoImpl(LinkDaoImpl linkDaoImpl) {
        this.linkDaoImpl = linkDaoImpl;
    }

    public void add(Link link) {
        linkDaoImpl
                .save(link);
    }
}
