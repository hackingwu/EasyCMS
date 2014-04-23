package cn.easycms.service;

import cn.easycms.dao.InfoDaoImpl;
import cn.easycms.dao.InfoSignDaoImpl;
import cn.easycms.model.Info;
import cn.easycms.model.InfoSign;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/22.
 */
public class InfoSignService {
    private InfoSignDaoImpl infoSignDaoImpl;

    public void setInfoSignDaoImpl(InfoSignDaoImpl infoSignDaoImpl) {
        this.infoSignDaoImpl = infoSignDaoImpl;
    }

    public List<InfoSign> findByInfo(Info info) {

        if (info!=null){
            return infoSignDaoImpl.getCurrentSession()
                    .createCriteria(Info.class)
                    .add(Restrictions.eq("info",info))
                    .list();
        }
        return null;
    }
}
