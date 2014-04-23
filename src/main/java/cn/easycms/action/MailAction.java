package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Mail;
import cn.easycms.model.User;
import cn.easycms.service.UserService;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/23.
 */
public class MailAction extends BaseAction{
    private UserService userService;
    private User user;
    private List<User> userList;
    private String[] mailtypes;
    private Mail     mail;
    /**
     * 列表
     * @return
     */
    public String list(){
        init("unitService","userService");
        unitList=unitService.findByPar("", "1", "1",false);
        user=new Users();
        user.setIsmail("1");
        userList=userService.find(user,false);
        mailtypes=getConfig().get("mailType").toString().split(",");
        if (mail==null ){
            mail=new Mail();
        }
        if (!isAdminLogin()) {
            //不是admin,只能查看自己所属单位或个人的
            if ("unit".equals(mail.getType())) {
                mail.setUnitids(getLoginUnitIdsSql());
                if (mail.getUnitids().trim().length()==0) {
                    mail.setUnitids("'no'");
                }
            }else if ("user".equals(mail.getType())) {
                mail.setUserid(getLoginAdmin().getId());
            }
        }
        mailList=mailService.find(mail, order, currPage, pageSize,false);
        totalCount=mailService.count(mail,false);
        Pager pager=new Pager(getHttpRequest());
        pager.appendParam("mail.type");
        pager.appendParam("mail.querycode");
        pager.appendParam("mail.mailtype");
        pager.appendParam("mail.title");
        pager.appendParam("mail.writer");
        pager.appendParam("mail.state");
        pager.appendParam("mail.unitid");
        pager.appendParam("mail.userid");
        pager.appendParam("mail.isopen");
        pager.appendParam("order");
        pager.appendParam("pageSize");
        pager.appendParam("pageFuncId");
        pager.setCurrPage(currPage);
        pager.setPageSize(pageSize);
        pager.setTotalCount(totalCount);
        pager.setOutStr("mail_list.do");
        pageStr=pager.getOutStr();
        return "list";
    }
}
