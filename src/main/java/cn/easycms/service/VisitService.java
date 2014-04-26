package cn.easycms.service;

import cn.easycms.dao.VisitDaoImpl;

/**
 * Created by hackingwu on 2014/4/25.
 */
public class VisitService {
    private VisitDaoImpl visitDaoImpl;

    public VisitDaoImpl getVisitDaoImpl() {
        return visitDaoImpl;
    }

    public void setVisitDaoImpl(VisitDaoImpl visitDaoImpl) {
        this.visitDaoImpl = visitDaoImpl;
    }
}
