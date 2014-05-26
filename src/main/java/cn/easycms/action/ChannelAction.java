package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Channel;
import cn.easycms.model.HtmlQuartz;
import cn.easycms.model.Site;
import cn.easycms.service.ChannelService;
import cn.easycms.service.HtmlQuartzService;
import cn.easycms.service.SiteService;
import cn.easycms.util.*;
import freemarker.template.TemplateException;

import java.io.IOException;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/21.
 */
public class ChannelAction extends BaseAction {

    private Channel channel;
    private Site site;
    private HtmlQuartz htmlQuartz;
    private String root;
    private String onclick;
    private List<Channel> channelList;
    private ChannelService channelService;
    private SiteService siteService;
    private HtmlQuartzService htmlQuartzService;
    private String htmlindex;//首页静态化
    private String htmlChannel;//本栏目静态化
    private String htmlChannelPar;//本栏目的父栏目静态化
    private FreeMarkerUtil freeMarkerUtil;

    public void setFreeMarkerUtil(FreeMarkerUtil freeMarkerUtil) {
        this.freeMarkerUtil = freeMarkerUtil;
    }

    public String getHtmlindex() {
        return htmlindex;
    }

    public void setHtmlindex(String htmlindex) {
        this.htmlindex = htmlindex;
    }

    public String getHtmlChannel() {
        return htmlChannel;
    }

    public void setHtmlChannel(String htmlChannel) {
        this.htmlChannel = htmlChannel;
    }

    public String getHtmlChannelPar() {
        return htmlChannelPar;
    }

    public void setHtmlChannelPar(String htmlChannelPar) {
        this.htmlChannelPar = htmlChannelPar;
    }

    public HtmlQuartz getHtmlQuartz() {
        return htmlQuartz;
    }

    public void setHtmlQuartz(HtmlQuartz htmlQuartz) {
        this.htmlQuartz = htmlQuartz;
    }

    public String getOnclick() {
        return onclick;
    }

    public void setOnclick(String onclick) {
        this.onclick = onclick;
    }

    public String getRoot() {
        return root;
    }

    public void setRoot(String root) {
        this.root = root;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public List<Channel> getChannelList() {
        return channelList;
    }

    public void setChannelList(List<Channel> channelList) {
        this.channelList = channelList;
    }

    public void setHtmlQuartzService(HtmlQuartzService htmlQuartzService) {
        this.htmlQuartzService = htmlQuartzService;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
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

    /**
     * 栏目管理
     */
    public String channel() {

        if (channel != null && channel.getSite() != null) {
            site = siteService.findById(channel.getSite().getId());
        } else {
            site = getManageSite();
        }
        if (site != null) {
            if (channel != null && StringUtil.isNotEmpty(channel.getId())) {
                if (!channel.getId().equals("select")) {
                    channel = channelService.findById(channel.getId());
                }
                channelList = channelService.findBySiteAndParAndStateAndNavi(site, "", null, null);
                if (channelList != null && channelList.size() > 0) {
                    for (int i = 0; i < channelList.size(); i++) {
                        if (channelService.hasChildren(channelList.get(i).getId())) {
                            channelList.get(i).setHasChildren("1");
                        }
                        if (!isAdminLogin()) {
                            //普通管理员登陆
                        }
                    }
                }
                return "channelSelect";
            } else {
                channelList = channelService.findBySiteAndParAndStateAndNavi(site, "", null, null);
                if (channelList != null && channelList.size() > 0) {
                    for (int i = 0; i < channelList.size(); i++) {
                        if (channelService.hasChildren(channelList.get(i).getId())) {
                            channelList.get(i).setHasChildren("1");
                        }
                        if (!isAdminLogin()) {
                            //普通管理员登陆
                        }
                    }
                }
            }
        }
        return "channel";
    }

    /**
     * 树结构
     *
     * @return
     */
    public String son() {
        List<Channel> list = null;
        if (root.equals("source"))
            root = "";
        list = channelService.findBySiteAndParAndStateAndNavi(null, root, null, null);
        //生成树
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                if (channel != null && channel.getId() != null && channel.getId().trim().length() > 0 && channel.getId().equals(list.get(i).getId())) {
                    continue;
                }
                if (!"[".equals(stringBuilder.toString())) {
                    stringBuilder.append(",");
                }
                stringBuilder.append("{ \"text\": \"");
                //是否生成onclick事件
                boolean click = true;
                //权限验证
//                if ("1".equals(auth)
//                        && !isAdminLogin()
//                        && !isSiteAdmin()
//                        && !roleChannelService.haves(getLoginRoleIdsSql(), list.get(i).getId())) {
//                    //如果没有权限则不生成onclick事件
//                    click=false;
//                }
                if (click) {
                    stringBuilder.append("<a  onclick=");
                    if (onclick != null && onclick.trim().length() > 0) {
                        stringBuilder.append(onclick);
                    } else {
                        stringBuilder.append("showOne");
                    }
                    stringBuilder.append("('");
                    stringBuilder.append(list.get(i).getId());
                    stringBuilder.append("','");
                    stringBuilder.append(list.get(i).getName().replaceAll(" ", ""));
                    stringBuilder.append("')><b>");
                }
                stringBuilder.append(list.get(i).getName());
                if (click) {
                    stringBuilder.append("</b>");
                }
                stringBuilder.append("\", \"hasChildren\": ");
                if (channelService.hasChildren(list.get(i).getId())) {
                    stringBuilder.append("true");
                } else {
                    stringBuilder.append("false");
                }
                stringBuilder.append(",\"id\":\"");
                stringBuilder.append(list.get(i).getId());
                stringBuilder.append("\" }");
            }
        }
        stringBuilder.append("]");
        ResponseUtil.writeUTF(getHttpResponse(), stringBuilder.toString());
        return null;
    }

    /**
     * 编辑页面
     *
     * @return
     */
    public String edit() {
        if (site != null && StringUtil.isNotEmpty(site.getId())) {
            site = siteService.findById(site.getId());
        }
        if (channel != null && StringUtil.isNotEmpty(channel.getId())) {
            channel = channelService.findById(channel.getId());
            htmlQuartz = htmlQuartzService.findByChannelId(channel.getId());
            site = siteService.findById(channel.getSite().getId());
        }
        return "edit";
    }
    /**
     * 编辑页面保存
     *
     */
    public String editDo(){
        site = siteService.findById(site.getId());
        if(StringUtil.isNotEmpty(channel.getId())){
            //channel已经有了id，说明已经保存至数据库中，那么就是更新操作
            Channel oldChannel = channelService.findById(channel.getId());
            //如果修改了channel的pageMark，则返回一个提醒
            if (StringUtil.isNotEmpty(channel.getPageMark())&&StringUtil.isNotEmpty(oldChannel.getPageMark())&&!channel.getPageMark().equals(oldChannel.getPageMark())){
                if(channelService.hasPageMark(channel.getSite(),channel.getPageMark())){
                    write("<script>alert('该页面标识已经存在');history.back();</script>","UTF-8");
                    return null;
                }
            }
            channelService.update(channel);
        }else{
            channelService.insert(channel);
        }
        return "makehtml";
    }
    public String makehtml(){
        String message = "";
        if (channel!=null&&StringUtil.isNotEmpty(channel.getId())){
            channel = channelService.findById(channel.getId());
            site = siteService.findById(channel.getSite().getId());
        }
        try{
            //选中首页静态化
            if("1".equals(htmlindex)){
                IndexHtmlUtil.html(site,freeMarkerUtil,getServletContext(),getContextPath(),getHttpRequest());
            }
            //选中本栏目静态化
            if("1".equals(htmlChannel)){
                ChannelHtmlUtil.html(channel,site,freeMarkerUtil,getServletContext(),getHttpRequest(),0);
            }
            //本栏目的所有父栏目静态化
            if ("1".equals(htmlChannelPar)){
                //从父栏目到本栏目的静态化
                List<Channel> channels = channelService.findPath(channel.getId());
                if (channels!=null&&channels.size()>0){
                    for(Channel temp : channels){
                        //排除本栏目的静态化
                        if (!temp.getId().equals(channel.getId())){
                            ChannelHtmlUtil.html(temp,site,freeMarkerUtil,getServletContext(),getHttpRequest(),0);
                        }
                    }
                }

            }
            message = "静态化成功!";
        } catch (TemplateException e) {
            e.printStackTrace();
            message = "静态化失败，原因："+e.getMessage().replace("<","&lt;").replace(">","&gt;").replace("\n","<br/>");
        } catch (IOException e) {
            e.printStackTrace();
            message = "静态化失败，原因："+e.getMessage().replace("<","&lt;").replace(">","&gt;").replace("\n","<br/>");
        }
        return showMessage(message);
    }
}
