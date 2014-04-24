package cn.easycms.service;

import cn.easycms.dao.ConfigDaoImpl;
import cn.easycms.model.Config;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/24.
 */
public class ConfigService {
    private ConfigDaoImpl configDaoImpl;

    public ConfigDaoImpl getConfigDaoImpl() {
        return configDaoImpl;
    }

    public void setConfigDaoImpl(ConfigDaoImpl configDaoImpl) {
        this.configDaoImpl = configDaoImpl;
    }

    public List<Config> findByOrder(String order) {
        Criteria criteria = configDaoImpl.getCurrentSession().createCriteria(Config.class);
        if (StringUtil.isNotEmpty(order))
            criteria.addOrder(Order.asc(order));
        return criteria.list();
    }
}
