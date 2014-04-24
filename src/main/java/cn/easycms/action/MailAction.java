package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Mail;
import cn.easycms.model.User;
import cn.easycms.service.MailService;
import cn.easycms.service.UserService;
import cn.easycms.util.Pager;
import cn.easycms.util.StringUtil;

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
    private MailService mailService;
    private String  order;
    private int currPage;
    private int pageSize;

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    private String pageStr;

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    private int totalCount;

    public List<Mail> getMailList() {
        return mailList;
    }

    public void setMailList(List<Mail> mailList) {
        this.mailList = mailList;
    }

    private List<Mail> mailList;

    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public String[] getMailtypes() {
        return mailtypes;
    }

    public void setMailtypes(String[] mailtypes) {
        this.mailtypes = mailtypes;
    }

    public Mail getMail() {
        return mail;
    }

    public void setMail(Mail mail) {
        this.mail = mail;
    }

    public void setUserService(UserService userService) {

        this.userService = userService;
    }


    /**
     * 列表
     * @return
     */
    public String list(){
        user=new User();
        user.setIsmail("1");
        userList=userService.find(user);
        if (StringUtil.isNotEmpty(getConfig().get("mailType").toString()))
            mailtypes=getConfig().get("mailType").toString().split(",");
        if (mail==null ){
            mail=new Mail();
        }
//        if (!isAdminLogin()) {
//            //不是admin,只能查看自己所属单位或个人的
//            if ("unit".equals(mail.getType())) {
//                mail.setUnitids(getLoginUnitIdsSql());
//                if (mail.getUnitids().trim().length()==0) {
//                    mail.setUnitids("'no'");
//                }
//            }else if ("user".equals(mail.getType())) {
//                mail.setUserId(getLoginAdmin().getId());
//            }
//        }
        mailList=mailService.find(mail, order, currPage, pageSize);
//        mailList = mailService.getMailDaoImpl().findAll();
        totalCount=mailService.count(mail);
//        totalCount = 50;
        Pager pager=new Pager(getHttpRequest());
        pager.appendParam("mail.type");
        pager.appendParam("mail.queryCode");
        pager.appendParam("mail.mailType");
        pager.appendParam("mail.title");
        pager.appendParam("mail.writer");
        pager.appendParam("mail.state");
        pager.appendParam("mail.unitId");
        pager.appendParam("mail.userId");
        pager.appendParam("mail.isOpen");
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
