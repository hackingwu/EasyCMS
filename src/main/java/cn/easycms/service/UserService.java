package cn.easycms.service;

import cn.easycms.dao.UserDaoImpl;
import cn.easycms.model.User;
import org.hibernate.Query;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/3.
 */
public class UserService {
    private UserDaoImpl userDaoImpl;

    public void setUserDaoImpl(UserDaoImpl userDaoImpl) {
        this.userDaoImpl = userDaoImpl;
    }

    public String isExist(HttpSession session,User user) {
        String msg = "";
        Query query = userDaoImpl.getCurrentSession().createQuery("from User u where u.loginName=? and u.pwd=?");
        query.setParameter(0, user.getLoginName());
        query.setParameter(1, user.getPwd());
        List list = query.list();
        if (list != null && list.size() > 0) {
            user = (User) list.get(0);
            if ("1".equals(user.getIsOk())) {
                user.setLastLoginTime(user.getLastestLoginTime());
                user.setLastestLoginTime(new Date());
                userDaoImpl.update(user);
                session.setAttribute("loginAdmin",user);
                session.setAttribute("currentFolder","/"+user.getLoginName()+"/");

            } else {
                msg = "此用户已禁用";
            }
        } else {
            msg = "用户名或密码错误";
        }
        return msg;
    }

    public List<User> findAll() {

        return userDaoImpl.findAll();
    }
}
