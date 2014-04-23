package cn.easycms.service;

import cn.easycms.dao.OperButtonDaoImpl;
import cn.easycms.model.Func;
import cn.easycms.model.OperButton;
import cn.easycms.util.StringUtil;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/21.
 */
public class OperButtonService {
    private OperButtonDaoImpl operButtonDaoImpl;

    public void setOperButtonDaoImpl(OperButtonDaoImpl operButtonDaoImpl) {
        this.operButtonDaoImpl = operButtonDaoImpl;
    }
    public List<OperButton> findByFuncOk(Func func){
        if (func!=null){
            return operButtonDaoImpl.getCurrentSession()
                    .createCriteria(OperButton.class)
                    .add(Restrictions.eq("func",func))
                    .add(Restrictions.eq("isOk","1"))
                    .list();
        }
        return null;
    }
}
