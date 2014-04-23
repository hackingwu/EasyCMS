package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Channel;
import cn.easycms.model.HtmlQuartz;
import cn.easycms.model.Site;
import cn.easycms.service.ChannelService;
import cn.easycms.service.HtmlQuarztService;
import cn.easycms.service.SiteService;
import cn.easycms.util.ResponseUtil;
import cn.easycms.util.StringUtil;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/21.
 */
public class ChannelAction extends BaseAction {

    private Channel channel;
    private Site       site;
    private HtmlQuartz htmlQuartz;

    public HtmlQuartz getHtmlQuartz() {
        return htmlQuartz;
    }

    public void setHtmlQuartz(HtmlQuartz htmlQuartz) {
        this.htmlQuartz = htmlQuartz;
    }

    private String     root;

    public String getOnclick() {
        return onclick;
    }

    public void setOnclick(String onclick) {
        this.onclick = onclick;
    }

    private String  onclick;

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

    private List<Channel> channelList;

    public List<Channel> getChannelList() {
        return channelList;
    }

    public void setChannelList(List<Channel> channelList) {
        this.channelList = channelList;
    }

    private ChannelService channelService;
    private SiteService    siteService;
    private HtmlQuarztService htmlQuarztService;

    public void setHtmlQuarztService(HtmlQuarztService htmlQuarztService) {
        this.htmlQuarztService = htmlQuarztService;
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
    public String channel(){

        if (channel!=null&& channel.getSite()!=null) {
                site    = siteService.findById(channel.getSite().getId());
            }else {
                site    = getManageSite();
            }
        if (site!=null){
            if (channel!=null && StringUtil.isNotEmpty(channel.getId())){
                if (!channel.getId().equals("select")){
                    channel=channelService.findById(channel.getId());
                }
                channelList = channelService.findBySiteAndParAndStateAndNavi(site,"",null,null);
                if (channelList!=null && channelList.size()>0){
                    for (int i = 0 ;i < channelList.size() ;i++){
                        if (channelService.hasChildren(channelList.get(i).getId())){
                            channelList.get(i).setHasChildren("1");
                        }
                        if (!isAdminLogin() ){
                            //普通管理员登陆
                        }
                    }
                }
                return "channelSelect";
            }else{
                channelList = channelService.findBySiteAndParAndStateAndNavi(site,"",null,null);
                if (channelList!=null && channelList.size()>0){
                    for (int i = 0 ;i < channelList.size() ;i++){
                        if (channelService.hasChildren(channelList.get(i).getId())){
                            channelList.get(i).setHasChildren("1");
                        }
                        if (!isAdminLogin() ){
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
     * @return
     */
    public String son(){
        List<Channel> list=null;
        if (root.equals("source"))
            root="";
        list=channelService.findBySiteAndParAndStateAndNavi(null, root, null, null);
        //生成树
        StringBuilder stringBuilder=new StringBuilder();
        stringBuilder.append("[");
        if (list!=null && list.size()>0) {
            for (int i = 0; i <list.size() ; i++) {
                if (channel!=null && channel.getId()!=null && channel.getId().trim().length()>0 && channel.getId().equals(list.get(i).getId())) {
                    continue;
                }
                if (!"[".equals(stringBuilder.toString())) {
                    stringBuilder.append(",");
                }
                stringBuilder.append("{ \"text\": \"");
                //是否生成onclick事件
                boolean click=true;
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
                    if (onclick!=null && onclick.trim().length()>0) {
                        stringBuilder.append(onclick);
                    }else {
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
                }else {
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
     * @return
     */
    public String edit(){
        if (site!=null && StringUtil.isNotEmpty(site.getId())) {
            site=siteService.findById(site.getId());
        }
        if (channel!=null && StringUtil.isNotEmpty(channel.getId())) {
            channel=channelService.findById(channel.getId());
            htmlQuartz=htmlQuarztService.findByChannelId(channel.getId());
            site=siteService.findById(channel.getSite().getId());
        }
        return "edit";
    }
}
