package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Channel;
import cn.easycms.model.Site;
import cn.easycms.service.ChannelService;
import cn.easycms.service.SiteService;
import cn.easycms.util.ChannelHtmlUtil;
import cn.easycms.util.FreeMarkerUtil;
import cn.easycms.util.IndexHtmlUtil;
import cn.easycms.util.StringUtil;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/23.
 */
public class HtmlAction extends BaseAction {
    private ChannelService channelService;
    private SiteService siteService;
    private FreeMarkerUtil freeMarkerUtil;
    private List<Channel> channelList;
    private Channel channel;
    private Site site;
    private String pageNum;//选择要静态化的前几页
    private String createType;//选择要静态化的类型
    private String[] channels;//选中的channels数组

    public String[] getChannels() {
        return channels;
    }

    public void setChannels(String[] channels) {
        this.channels = channels;
    }

    public String getPageNum() {
        return pageNum;
    }

    public void setPageNum(String pageNum) {
        this.pageNum = pageNum;
    }

    public String getCreateType() {
        return createType;
    }

    public void setCreateType(String createType) {
        this.createType = createType;
    }

    public void setFreeMarkerUtil(FreeMarkerUtil freeMarkerUtil) {
        this.freeMarkerUtil = freeMarkerUtil;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    public List<Channel> getChannelList() {
        return channelList;
    }

    public void setChannelList(List<Channel> channelList) {
        this.channelList = channelList;
    }

    public void setChannelService(ChannelService channelService) {
        this.channelService = channelService;
    }

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    /**
     * 首页静态化页面
     *
     * @return
     */
    public String indexConfirm() {
        return "indexConfirm";
    }

    /**
     * 首页静态化处理
     *
     * @return
     */
    public String indexDo() {
        String showMessage = "";
        try {
            site = getManageSite();
            if (site != null) {
                //生成首页
                IndexHtmlUtil.html(site, freeMarkerUtil, getServletContext(), getContextPath(), getHttpRequest());
            }
            showMessage = "首页静态化处理成功!";
        } catch (Exception e) {
            e.printStackTrace();
            showMessage = "首页静态化处理失败，原因:" + e.getMessage().replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br/>");
        }
        return showMessage(showMessage, "", 0);
    }


    /**
     * 栏目页静态化页面
     *
     * @return
     */
    public String channel() {
        site = getManageSite();
        if (site != null) {
            //获取当前管理站点
            if (channel != null && channel.getId() != null && channel.getId().trim().length() > 0) {
                if (!channel.getId().equals("select")) {
                    channel = channelService.findById(channel.getId());
                }
                channelList = channelService.findBySiteAndParAndStateAndNavi(site, "", null, null);
                if (channelList != null && channelList.size() > 0) {
                    for (int i = 0; i < channelList.size(); i++) {
                        if (channelService.hasChildren(channelList.get(i).getId())) {
                            channelList.get(i).setHasChildren("1");
                        }
                        //权限操作
//                        if (!isAdminLogin() && !isSiteAdmin()) {
//                            //如果是普通管理员则设置是否有权限管理
//                            if (roleChannelService.haves(getLoginRoleIdsSql(), channelList.get(i).getId())) {
//                                channelList.get(i).setHaveChannelRole("1");
//                            }
//                        }
                    }
                }
                return "channelSelect";
            } else {
                //栏目管理页面
                //获取一级栏目
                channelList = channelService.findBySiteAndParAndStateAndNavi(site, "", null, null);
                //设置是否有子栏目
                if (channelList != null && channelList.size() > 0) {
                    for (int i = 0; i < channelList.size(); i++) {
                        if (channelService.hasChildren(channelList.get(i).getId())) {
                            channelList.get(i).setHasChildren("1");
                        }
                        //权限操作
//                        if (!isAdminLogin() && !isSiteAdmin()) {
//                            //如果是普通管理员则设置是否有权限管理
//                            if (roleChannelService.haves(getLoginRoleIdsSql(), channelList.get(i).getId())) {
//                                channelList.get(i).setHaveChannelRole("1");
//                            }
//                        }
                    }
                }
            }
        }
        return "channel";
    }
    public String channelDo(){
        String message = "";//返回首页的静态化信息，成功或者失败
        site = getManageSite();
        int page = 0;
        if(StringUtil.isNotEmpty(pageNum))
            page = Integer.parseInt(pageNum);

        try{
            //对不同的生成类型进行页面的静态化
            if("channels".equals(createType)){
                //静态化选中的channel；
                if(channels!=null&&channels.length>0){
                    for(String channelStr : channels){
                        Channel channel = channelService.findById(channelStr);
                        if (channel!=null){
                            ChannelHtmlUtil.html(channel,site,freeMarkerUtil,getServletContext(),getHttpRequest(),page);
                        }
                    }
                }
            }else if("all".equals(createType)){
                //静态化所有的channel；
                List<Channel> channelList = channelService.findListBySiteAndPageMark(site,null);
                for(Channel channel : channelList){
                    if (channel!=null)
                        ChannelHtmlUtil.html(channel,site,freeMarkerUtil,getServletContext(),getHttpRequest(),page);
                }
            }
            message = "栏目页面静态化成功!";
        }catch (Exception e){
            e.printStackTrace();
            message="静态化失败，原因："+e.getMessage().replace("<","&lt;").replace(">","&gt;").replace("\n","<br/>");
        }
        return showMessage(message);
    }
    /**
     * 信息静态化页面
     *
     * @return
     */
    public String info() {
        site = getManageSite();
        if (site != null) {
            //获取当前管理站点
            if (channel != null && channel.getId() != null && channel.getId().trim().length() > 0) {
                if (!channel.getId().equals("select")) {
                    channel = channelService.findById(channel.getId());
                }
                channelList = channelService.findBySiteAndParAndStateAndNavi(site, "", null, null);
                if (channelList != null && channelList.size() > 0) {
                    for (int i = 0; i < channelList.size(); i++) {
                        if (channelService.hasChildren(channelList.get(i).getId())) {
                            channelList.get(i).setHasChildren("1");
                        }
                        //权限管理
//                        if (!isAdminLogin() && !isSiteAdmin()) {
//                            //如果是普通管理员则设置是否有权限管理
//                            if (roleChannelService.haves(getLoginRoleIdsSql(), channelList.get(i).getId())) {
//                                channelList.get(i).setHaveChannelRole("1");
//                            }
//                        }
                    }
                }
                return "channelSelect";
            } else {
                //栏目管理页面
                //获取一级栏目
                channelList = channelService.findBySiteAndParAndStateAndNavi(site, "", null, null);
                //设置是否有子栏目
                if (channelList != null && channelList.size() > 0) {
                    for (int i = 0; i < channelList.size(); i++) {
                        if (channelService.hasChildren(channelList.get(i).getId())) {
                            channelList.get(i).setHasChildren("1");
                        }
                        //权限管理
//                        if (!isAdminLogin() && !isSiteAdmin()) {
//                            //如果是普通管理员则设置是否有权限管理
//                            if (roleChannelService.haves(getLoginRoleIdsSql(), channelList.get(i).getId())) {
//                                channelList.get(i).setHaveChannelRole("1");
//                            }
//                        }
                    }
                }
            }
        }
        return "info";
    }
}
