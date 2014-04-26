package cn.easycms.service;

import cn.easycms.dao.GuestbookDaoImpl;

/**
 * Created by hackingwu on 2014/4/25.
 */
public class GuestbookService {
    private GuestbookDaoImpl guestbookDaoImpl;

    public GuestbookDaoImpl getGuestbookDaoImpl() {
        return guestbookDaoImpl;
    }

    public void setGuestbookDaoImpl(GuestbookDaoImpl guestbookDaoImpl) {
        this.guestbookDaoImpl = guestbookDaoImpl;
    }
}
