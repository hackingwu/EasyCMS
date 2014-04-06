package cn.easycms.service;

import cn.easycms.dao.FuncDaoImpl;
import cn.easycms.model.Site;
import org.hibernate.Query;

import java.util.List;
import java.util.Queue;

/**
 * Created by hackingwu on 2014/4/4.
 */
public class FuncService {
    private FuncDaoImpl funcDaoImpl;

    public void setFuncDaoImpl(FuncDaoImpl funcDaoImpl) {
        this.funcDaoImpl = funcDaoImpl;
    }

    public List selectRoot(){
         return funcDaoImpl.getCurrentSession().createQuery("from Func where isOk='1' and parId=''").list();
    }

    public List selectAll(){
        return funcDaoImpl.findAll();
    }
    public boolean haveSon(String id){
        //看有没有记录的parId是自己的id，
        Query query = funcDaoImpl.getCurrentSession().createQuery("from Func where parId=?");
        query.setParameter(0,id);
        List list = query.list();
        return list!=null && list.size()>0;
    }
}
