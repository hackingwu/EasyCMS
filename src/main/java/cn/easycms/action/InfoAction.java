package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.*;
import cn.easycms.service.*;
import cn.easycms.util.*;
import org.apache.commons.lang3.StringUtils;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
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
    private String channelName;
    private String siteName;
    private String channelId;
    private String pageFuncId;
    private OperlogsService operlogsService;
    private FreeMarkerUtil freeMarkerUtil;
    private String showMessage;
    private String type;
    private String oldChannelId;
    private SiteService siteService;
    private String[] signUsers;
    private String delOldImgs;
    private String msg;
    private String videoUploadFileName;
    private File videoUpload;
    private String pageStr;
    private int totalCount;
    private List<InfoImg> infoImgList;
    private List<User> userList;
    private InfoService infoService;
    private ChannelService channelService;
    private InfoSignService infoSignService;
    private InfoImgService infoImgService;
    private UserService userService;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getShowMessage() {
        return showMessage;
    }

    public void setShowMessage(String showMessage) {
        this.showMessage = showMessage;
    }

    public String getOldChannelId() {
        return oldChannelId;
    }

    public void setOldChannelId(String oldChannelId) {
        this.oldChannelId = oldChannelId;
    }

    public void setFreeMarkerUtil(FreeMarkerUtil freeMarkerUtil) {
        this.freeMarkerUtil = freeMarkerUtil;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    public String[] getSignUsers() {
        return signUsers;
    }

    public void setSignUsers(String[] signUsers) {
        this.signUsers = signUsers;
    }

    public String getDelOldImgs() {
        return delOldImgs;
    }

    public void setDelOldImgs(String delOldImgs) {
        this.delOldImgs = delOldImgs;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setOperlogsService(OperlogsService operlogsService) {
        this.operlogsService = operlogsService;
    }

    public String getVideoUploadFileName() {
        return videoUploadFileName;
    }

    public void setVideoUploadFileName(String videoUploadFileName) {
        this.videoUploadFileName = videoUploadFileName;
    }

    public File getVideoUpload() {
        return videoUpload;
    }

    public void setVideoUpload(File videoUpload) {
        this.videoUpload = videoUpload;
    }

    public String getPageFuncId() {
        return pageFuncId;
    }

    public void setPageFuncId(String pageFuncId) {
        this.pageFuncId = pageFuncId;
    }

    public String getChannelId() {
        return channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
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
                infoImgList = infoImgService.find(infoImg, "orderNum");
            }
            //添加,传递参数channel.id
            if (StringUtil.isNotEmpty(channel.getId())) {
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
        pager.appendParam("channelName");
        pager.appendParam("siteName");
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


    /**
     * 信息列表
     *
     * @return
     */
    public String list() {
        if (info == null) {
            info = new Info();
        }
        if (StringUtil.isNotEmpty(order)) {
            order = "addTime";
        }
        if (StringUtil.isNotEmpty(info.getChannel().getId())) {
            channel = channelService.findById(info.getChannel().getId());
            if (channel != null)
                info.setChannel(channel);
        }
        infoList = infoService.find(info, order, currPage, pageSize);
        totalCount = infoService.count(info);
        Pager pager = new Pager(getHttpRequest());
        pager.appendParam("info.channel");
        pager.appendParam("info.isSign");
        pager.appendParam("info.isComment");
        pager.appendParam("order");
        pager.appendParam("pageSize");
        pager.appendParam("pageFuncId");
        pager.setCurrPage(currPage);
        pager.setPageSize(pageSize);
        pager.setTotalCount(totalCount);
        pager.setOutStr("info_list.do");
        pageStr = pager.getOutStr();
        return "list";
    }

    /**
     * 编辑处理
     *
     * @return
     */
    public String editDo() {
        site = getManageSite();
        if (info != null) {
            String oper = "添加";
            try {
                //敏感词处理
//                init("sensitiveService");
//                info.setTitle(sensitiveService.replace(info.getTitle()));
//                info.setShorttitle(sensitiveService.replace(info.getShorttitle()));
//                info.setContent(sensitiveService.replace(info.getContent()));
//                info.setDescription(sensitiveService.replace(info.getDescription()));
                if (videoUpload != null) {
                    //生成目标文件
                    String root = getServletContext().getRealPath("/");
                    String ext = FileUtil.getExt(videoUploadFileName).toLowerCase();
                    if (!"flv".equals(ext)) {
                        msg = "<script>alert('只能上传flv格式的视频!');history.back();</script>";
                        return "msg";
                    }

                    //为了安全性,把真实的文件名隐藏。
//                    String id = new UUID().randomUUID().toString();
//                    File targetFile = new File(root+"/upload"+site.getId()+"/"+id+"."+ext);
                    File targetFile = new File(root + "/upload/" + site.getId() + "/" + videoUploadFileName);
                    File folder = new File(root + "/upload/" + site.getId() + "/");
                    if (!folder.exists()) {
                        folder.mkdirs();
                    }
                    if (!targetFile.exists()) {
                        targetFile.createNewFile();
                    }
                    //复制到目标文件
                    FileUtil.copy(videoUpload, targetFile);

                    //生成访问地址
                    info.setVideo("/upload/" + site.getId() + "/" + videoUploadFileName);
                }
                if (info.getImg() == null || info.getImg().trim().length() == 0) {
                    //如果没有选择信息图片，则检查信息内容中是否有图片
                    try {
                        Parser parser = new Parser(info.getContent());
                        NodeFilter filter = new TagNameFilter("img");
                        NodeList nodes = parser.extractAllNodesThatMatch(filter);
                        Node eachNode = null;
                        ImageTag imageTag = null;
                        if (nodes != null && nodes.size() > 0) {
                            //遍历所有的img节点
                            for (int i = 0; i < nodes.size(); i++) {
                                if (info.getImg() == null || info.getImg().trim().length() == 0) {
                                    eachNode = (Node) nodes.elementAt(i);
                                    if (eachNode instanceof ImageTag) {
                                        imageTag = (ImageTag) eachNode;
                                        info.setImg(imageTag.getAttribute("src"));
                                    }
                                } else {
                                    break;
                                }
                            }
                        }
                    } catch (ParserException e) {
                        e.printStackTrace();
                    }
                }
                //处理图片集
                Enumeration<String> paramNames = getHttpRequest().getParameterNames();
                String paramName, imgsid;
                List<InfoImg> infoImgList = new ArrayList<InfoImg>();
                List<InfoImg> oldInfoImgList = new ArrayList<InfoImg>();
                while (paramNames.hasMoreElements()) {
                    paramName = paramNames.nextElement();
                    if (paramName.startsWith("imgsurl")) {
                        imgsid = paramName.replace("imgsurl", "");
                        InfoImg infoImg = new InfoImg();
                        infoImg.setImg(getHttpRequest().getParameter("imgsurl" + imgsid));
                        infoImg.setContent(getHttpRequest().getParameter("imgscontent" + imgsid));
                        try {
                            infoImg.setOrderNum(Integer.parseInt(getHttpRequest().getParameter("imgsordernum" + imgsid)));
                        } catch (Exception e) {
                        }
                        infoImg.setTitle(getHttpRequest().getParameter("imgstitle" + imgsid));
                        infoImgList.add(infoImg);
                        //如果没有选择信息图片，使用图片集中的第一张图片
                        if (info.getImg() == null || info.getImg().trim().length() == 0) {
                            info.setImg(infoImg.getImg());
                        }
                    }
                    if (paramName.startsWith("oldimgsid")) {
                        //需要更新的图片
                        imgsid = paramName.replace("oldimgsid", "");
                        InfoImg infoImg = new InfoImg();
                        infoImg.setId(imgsid);
                        infoImg.setInfo(info);
                        infoImg.setImg(getHttpRequest().getParameter("oldimgsurl" + imgsid));
                        infoImg.setContent(getHttpRequest().getParameter("oldimgscontent" + imgsid));
                        try {
                            infoImg.setOrderNum(Integer.parseInt(getHttpRequest().getParameter("oldimgsordernum" + imgsid)));
                        } catch (Exception e) {
                        }
                        infoImg.setTitle(getHttpRequest().getParameter("oldimgstitle" + imgsid));
                        oldInfoImgList.add(infoImg);
                    }
                }
                //如果没有摘要，则自动生成
                if (!StringUtil.isNotEmpty(info.getDescription())) {
                    info.setDescription(HtmlCodeUtil.replaceHtml(info.getContent()));
                    if (info.getDescription().length() > 500) {
                        info.setDescription(info.getDescription().substring(0, 500));
                    }
                }
                info.setIsImgs("0");
                if (info.getId() != null && info.getId().trim().length() > 0) {
                    //把info是否有ID来区分是添加还是更新
                    oper = "更新";
                    Info oldInfo = infoService.findById(info.getId());
                    if (oldInfo != null) {
                        oldInfo.setAuthor(info.getAuthor());
                        oldInfo.setAddTime(info.getAddTime());
                        oldInfo.setAttchs(info.getAttchs());
                        oldInfo.setChannel(info.getChannel());
                        oldInfo.setContent(info.getContent());
                        oldInfo.setDescription(info.getDescription());
                        oldInfo.setImg(info.getImg());
                        oldInfo.setIsTop(info.getIsTop());
                        oldInfo.setIsHot(info.getIsHot());
                        oldInfo.setShortTitle(info.getShortTitle());
                        oldInfo.setSite(info.getSite());
                        oldInfo.setSource(info.getSource());
                        oldInfo.setTags(info.getTags());
                        oldInfo.setTemplate(info.getTemplate());
                        oldInfo.setTitle(info.getTitle());
                        oldInfo.setTitleBlod(info.getTitleBlod());
                        oldInfo.setTitleColor(info.getTitleColor());
                        oldInfo.setTopEndTime(info.getTopEndTime());
                        oldInfo.setUrl(info.getUrl());
                        oldInfo.setIsSign(info.getIsSign());
                        oldInfo.setIsComment(info.getIsComment());
                        oldInfo.setVideo(info.getVideo());
                        oldInfo.setOpenEndTime(info.getOpenEndTime());
                        oldInfo.setOpenTimeType(info.getOpenTimeType());
                        oldInfo.setOpenType(info.getOpenType());
                        oldInfo.setIndexNum(info.getIndexNum());
                        infoService.update(oldInfo);
                        operlogsService.log(getLoginName(), oper + "信息(" + oldInfo.getTitle() + ")成功", getHttpRequest());
                        //删除图片集
                        if (StringUtils.isNotEmpty(delOldImgs)) {
                            String dels[] = delOldImgs.split(";");
                            if (dels != null && dels.length > 0) {
                                for (int i = 0; i < dels.length; i++) {
                                    if (dels[i].trim().length() > 0) {
                                        infoImgService.del(dels[i]);
                                    }
                                }
                            }
                        }
                        if (oldInfoImgList.size() > 0) {
                            for (int i = 0; i < oldInfoImgList.size(); i++) {
                                infoImgService.update(oldInfoImgList.get(i));
                            }
                        }
                        //更新图片集
                    }
                } else {
                    //添加
                    if (info.getAddTime() == null) {
                        info.setAddTime(new Date());
                    }
                    info.setAddUser(getLoginAdmin().getId());
                    info.setClickNum(0);
                    infoService.insert(info);
                    operlogsService.log(getLoginName(), oper + "信息(" + info.getTitle() + ")成功", getHttpRequest());
                }
                //处理签收用户
                List<User> users = new ArrayList<User>();
                for (String signUser : signUsers) {
                    users.add(userService.findById(signUser));
                }

                infoSignService.infoEdit(info, users);
                //处理图片集
                if (infoImgList.size() > 0) {
                    for (int i = 0; i < infoImgList.size(); i++) {
                        infoImgList.get(i).setInfo(info);
                        infoImgService.add(infoImgList.get(i));
                    }
                }

                //查询图片集
                InfoImg infoImg = new InfoImg();
                infoImg.setInfo(info);
                if (infoImgService.count(infoImg) > 0) {
                    info = infoService.findById(info.getId());
                    info.setIsImgs("1");
                    infoService.update(info);
                }
                //生成静态页面
                Channel channel = info.getChannel();
                Site site = siteService.findById(info.getSite());
                HtmlUtil.html(info, channel, site, freeMarkerUtil, getServletContext(), getContextPath(), getHttpRequest());
                operlogsService.log(getLoginName(), "信息页静态化:" + info.getTitle(), getHttpRequest());
                //检查此信息所属栏目是否设置当此栏目中的信息变更后需要进行的静态化处理
                channel = channelService.findById(info.getChannel().getId());
                boolean isMakeHtml = true;
                if (channel != null) {

                    if ("1".equals(channel.getHtmlChannel())) {
                        //所属栏目静态化
                        HtmlUtil.html(site, channel, freeMarkerUtil, getServletContext(), getHttpRequest(), 0);
                        operlogsService.log(getLoginName(), "栏目静态化:" + channel.getName(), getHttpRequest());
                        isMakeHtml = false;
                    }
                    if ("1".equals(channel.getHtmlChannelOld())) {
                        //原所属栏目静态化
                        if (StringUtil.isNotEmpty(oldChannelId) && !oldChannelId.equals(info.getChannel().getId())) {
                            Channel oldChannel = channelService.findById(oldChannelId);
                            HtmlUtil.html(site, oldChannel, freeMarkerUtil, getServletContext(), getHttpRequest(), 0);
                            isMakeHtml = false;
                            operlogsService.log(getLoginName(), "栏目静态化：" + channel.getName(), getHttpRequest());
                        }
                    }
                    if ("1".equals(channel.getHtmlParChannel())) {
                        //所属栏目的父栏目静态化
                        List<Channel> channelList = channelService.findPath(info.getChannel().getId());
                        if (channelList != null && channelList.size() > 0) {
                            for (int i = 0; i < channelList.size(); i++) {
                                if (!channelList.get(i).getId().equals(info.getChannel().getId())) {
                                    HtmlUtil.html(site, channelList.get(i), freeMarkerUtil, getServletContext(), getHttpRequest(), 0);
                                }
                            }
                        }
                        isMakeHtml = false;
                    }
                    if ("1".equals(channel.getHtmlSite())) {
                        site = siteService.findById(info.getSite());
                        //首页静态化
                        HtmlUtil.html(site, freeMarkerUtil, getServletContext(), getHttpRequest().getContextPath() + "/", getHttpRequest());
                        isMakeHtml = false;
                    }
                }
                if (isMakeHtml) {
                    return "makeHtml";
                } else {
                    if ("channel".equals(type)) {
                        write("<script>alert('操作成功');location.href='info_list.do?info.channel=" + info.getChannel() + "&pageFuncId=" + pageFuncId + "';</script>", "GBK");
                    } else {
                        write("<script>alert('操作成功');location.href='info_edit.do?pageFuncId=" + pageFuncId + "';</script>", "GBK");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                operlogsService.log(getLoginName(), oper + "信息(" + info.getTitle() + ")失败:" + e.toString(), getHttpRequest());
                showMessage = "操作失败:" + e.toString();
                return showMessage(showMessage);
            }
        }
        return null;
    }
}
