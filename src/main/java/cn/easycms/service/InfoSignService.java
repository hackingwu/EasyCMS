package cn.easycms.service;

import cn.easycms.dao.InfoSignDaoImpl;
import cn.easycms.model.Info;
import cn.easycms.model.InfoSign;
import cn.easycms.model.User;
import org.hibernate.Criteria;
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

        if (info != null) {
            return infoSignDaoImpl.getCurrentSession()
                    .createCriteria(InfoSign.class)
                    .add(Restrictions.eq("info", info))
                    .list();
        }
        return null;
    }

    public void infoEdit(Info info, List<User> users) {
        Criteria criteria = infoSignDaoImpl.getCurrentSession().createCriteria(InfoSign.class);
        criteria.add(Restrictions.eq("info", info));
        criteria.add(Restrictions.not(Restrictions.in("user", users)));
        deleteByList(criteria.list());
        for (User user : users) {
            InfoSign infoSign = new InfoSign();
            infoSign.setUser(user);
            infoSign.setInfo(info);
            infoSignDaoImpl.save(infoSign);
        }
    }

    public void deleteByList(List list) {
        for (Object o : list) {
            infoSignDaoImpl.delete(o);
        }
    }
}
