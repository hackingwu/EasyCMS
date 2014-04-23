package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.*;
import cn.easycms.service.*;
import cn.easycms.util.Pager;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/22.
 */
public class InfoAction extends BaseAction{
    private Site site;
    private Info info;
    private Channel channel;
    private InfoImg infoImg;
    private InfoSign infoSign;
    private List<InfoSign> infoSignList;
    private List<Channel>  channelList;
    private String order;
    private List<Info> infoList;
    private int currPage;
    private int pageSize;
    private String channelname;
    private String sitename;

    public String getChannelname() {
        return channelname;
    }

    public void setChannelname(String channelname) {
        this.channelname = channelname;
    }

    public String getSitename() {
        return sitename;
    }

    public void setSitename(String sitename) {
        this.sitename = sitename;
    }

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    private String pageStr;

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

    public List<Info> getInfoList() {
        return infoList;
    }

    public void setInfoList(List<Info> infoList) {
        this.infoList = infoList;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    private int totalCount;

    public List<Channel> getChannelList() {
        return channelList;
    }

    public void setChannelList(List<Channel> channelList) {
        this.channelList = channelList;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public Info getInfo() {
        return info;
    }

    public void setInfo(Info info) {
        this.info = info;
    }

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    public InfoImg getInfoImg() {
        return infoImg;
    }

    public void setInfoImg(InfoImg infoImg) {
        this.infoImg = infoImg;
    }

    public InfoSign getInfoSign() {
        return infoSign;
    }

    public void setInfoSign(InfoSign infoSign) {
        this.infoSign = infoSign;
    }

    public List<InfoSign> getInfoSignList() {
        return infoSignList;
    }

    public void setInfoSignList(List<InfoSign> infosignList) {
        this.infoSignList = infosignList;
    }

    public List<InfoImg> getInfoImgList() {
        return infoImgList;
    }

    public void setInfoImgList(List<InfoImg> infoImgList) {
        this.infoImgList = infoImgList;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    private List<InfoImg> infoImgList;
    private List<User>    userList;
    private InfoService infoService;
    private ChannelService channelService;
    private InfoSignService infoSignService;
    private InfoImgService infoImgService;
    private UserService    userService;

    public void setInfoService(InfoService infoService) {
        this.infoService = infoService;
    }

    public void setChannelService(ChannelService channelService) {
        this.channelService = channelService;
    }

    public void setInfoSignService(InfoSignService infoSignService) {
        this.infoSignService = infoSignService;
    }

    public void setInfoImgService(InfoImgService infoImgService) {
        this.infoImgService = infoImgService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 编辑页面，信息管理-》快速添加
     * @return
     */
    public String edit(){
        site=getManageSite();
        if (site!=null) {
            //权限管理
//            if (!isAdminLogin() && !isSiteAdmin()) {
//                //普通用户只提取自己有权限的栏目
//                channelList=channelService.findByRoles(site.getId(), getLoginRoleIdsSql());
//            }
            //编辑
            if (info!=null && info.getId()!=null && info.getId().trim().length()>0) {
                info=infoService.findById(info.getId());
                channel=channelService.findById(info.getChannel().getId());
                //查询签收用户
                infoSignList=infoSignService.findByInfo(info);
                //查询图片集
                InfoImg infoImg=new InfoImg();
                infoImg.setInfo(info);
                infoImgList=infoImgService.find(infoImg, " ordernum ");
            }
            //添加,传递参数channel.id
            if (channel!=null && channel.getId()!=null && channel.getId().trim().length()>0) {
                channel=channelService.findById(channel.getId());
            }
            //查询所有用户，签收时使用
            userList=userService.findAll();
        }
        return "edit";
    }
    /**
     * 信息管理-》管理页面
     * @return
     */
    public String info(){

        site=getManageSite();
        if (site!=null) {
            //提取站点信息和此站点的一级栏目
            channelList=channelService.findBySiteAndParAndStateAndNavi(site,"",null,null);
            if (channelList!=null && channelList.size()>0) {
                for (int i = 0; i < channelList.size(); i++) {
                    if (channelService.hasChildren(channelList.get(i).getId())) {
                        channelList.get(i).setHasChildren("1");
                    }
//                    if (!isAdminLogin() && !isSiteAdmin()) {
//                        //如果是普通管理员则设置是否有权限管理
//                        if (roleChannelService.haves(getLoginRoleIdsSql(), channelList.get(i).getId())) {
//                            channelList.get(i).setHaveChannelRole("1");
//                        }
//                    }
                }
            }
        }
        return "info";
    }
    /**
     * 信息管理-》信息提取
     * @return
     */
    public String extract(){
        if (info==null) {
            info=new Info();
        }

        List<String> orderDesc = new ArrayList<String>();
        if (order!=null&&order.trim().length()==0) {

            orderDesc.add("addTime");
        }

        infoList=infoService.find(info, null,orderDesc, currPage, pageSize);
        totalCount=infoService.count(info);
        Pager pager=new Pager(getHttpRequest());
        pager.appendParam("info.channel");
        pager.appendParam("info.site");
        pager.appendParam("channelname");
        pager.appendParam("sitename");
        pager.appendParam("info.searchKey");
        pager.appendParam("order");
        pager.appendParam("pageSize");
        pager.appendParam("pageFuncId");
        pager.setCurrPage(currPage);
        pager.setPageSize(pageSize);
        pager.setTotalCount(totalCount);
        pager.setOutStr("info_extract.do");
        pageStr=pager.getOutStr();
        return "extract";
    }


}
