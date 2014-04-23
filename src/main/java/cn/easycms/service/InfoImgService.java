package cn.easycms.service;

import cn.easycms.dao.InfoImgDaoImpl;
import cn.easycms.model.InfoImg;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/22.
 */
public class InfoImgService {
    private InfoImgDaoImpl infoImgDaoImpl;

    public void setInfoImgDaoImpl(InfoImgDaoImpl infoImgDaoImpl) {
        this.infoImgDaoImpl = infoImgDaoImpl;
    }

    public List<InfoImg> find(InfoImg infoImg, String order) {
        Criteria criteria = infoImgDaoImpl.getCurrentSession().createCriteria(InfoImg.class);
        proSearch(infoImg,criteria);
        criteria.addOrder(Order.asc(order));
        return criteria.list();
    }
    public void proSearch(InfoImg infoImg,Criteria criteria){
        if (infoImg!=null&&infoImg.getInfo()!=null){
            criteria.add(Restrictions.eq("info",infoImg.getInfo()));
        }
    }
}
