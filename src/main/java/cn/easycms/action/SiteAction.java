package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.*;
import cn.easycms.service.*;
import cn.easycms.util.*;

import java.util.*;

/**
 * Created by hackingwu on 2014/4/8.
 */
public class SiteAction extends BaseAction {

    private String type;
    private List siteList;
    private Template template;
    private HtmlQuartz htmlQuartz;
    private SiteService siteService;
    private OperlogsService operlogsService;
    private TemplateService templateService;
    private TemplateChannelService templateChannelService;
    private TemplateLinkService templateLinkService;
    private ChannelService channelService;
    private LinkService linkService;
    private HtmlQuartzService htmlQuartzService;
    private FreeMarkerUtil freeMarkerUtil;//freeMarkerUtil的作用和service一样只不过命名更像本身类。
    private String root = "";
    private Site site;
    private String onclick;

    public HtmlQuartz getHtmlQuartz() {
        return htmlQuartz;
    }

    public void setHtmlQuartz(HtmlQuartz htmlQuartz) {
        this.htmlQuartz = htmlQuartz;
    }

    public Template getTemplate() {
        return template;
    }

    public void setTemplate(Template template) {
        this.template = template;
    }

    public void setHtmlQuartzService(HtmlQuartzService htmlQuartzService) {
        this.htmlQuartzService = htmlQuartzService;
    }

    public void setFreeMarkerUtil(FreeMarkerUtil freeMarkerUtil) {
        this.freeMarkerUtil = freeMarkerUtil;
    }

    public void setChannelService(ChannelService channelService) {
        this.channelService = channelService;
    }

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }

    public void setTemplateLinkService(TemplateLinkService templateLinkService) {
        this.templateLinkService = templateLinkService;
    }

    public void setTemplateChannelService(TemplateChannelService templateChannelService) {
        this.templateChannelService = templateChannelService;
    }

    public TemplateService getTemplateService() {
        return templateService;
    }

    public void setTemplateService(TemplateService templateService) {
        this.templateService = templateService;
    }

    public OperlogsService getOperlogsService() {
        return operlogsService;
    }

    public void setOperlogsService(OperlogsService operlogsService) {
        this.operlogsService = operlogsService;
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

    public String getOnclick() {
        return onclick;
    }

    public void setOnclick(String onclick) {
        this.onclick = onclick;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List getSiteList() {
        return siteList;
    }

    public void setSiteList(List siteList) {
        this.siteList = siteList;
    }

    public SiteService getSiteService() {
        return siteService;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }

    /**
     * 生成树形结构的site列表
     *
     * @return
     */
    public String site() {
        if (isAdminLogin()) {
            siteList = siteService.selectByParId("");
        } else {
            //普通用户只提取自己有权限的站点
        }
        if ("select".equals(type))
            return "siteSelect";
        else if ("selectPar".equals(type))
            return "siteSelectPar";
        else if ("siteSelectPage".equals(type))
            return "siteSelectPage";

        return "site";
    }

    /**
     * 查询子站点
     *
     * @return
     */
    public String son() {
        List<Site> list = null;
        if (root.equals("source")) {
            root = "";
        }
        list = siteService.selectByParId(root);
        StringBuilder stringBuilder = new StringBuilder();
        //拼Json语句
        //[{"text":"","hasChildren":""}]
        stringBuilder.append("[");

        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
//                if (site!=null && site.getId()!=null && site.getId().trim().length()>0 && site.getId().equals(list.get(i).getId())){
//                      忽略当前site。
//                      continue;
//                }
                //如果不是json的开头
                if (!"[".equals(stringBuilder.toString())) {
                    stringBuilder.append(",");
                }
                stringBuilder.append("{ \"text\": \"<a onclick=");
                if (onclick != null && onclick.trim().length() > 0) {
                    stringBuilder.append(onclick);
                } else {
                    stringBuilder.append("showDetail");
                }
                //onclick或者showDetail方法 showDetail()。。。
                stringBuilder.append("('");
                stringBuilder.append(list.get(i).getId());
                stringBuilder.append("','" + list.get(i).getName().replaceAll(" ", "") + "','" + (site != null && site.getId() != null ? site.getId() : "") + "')><b>");
                stringBuilder.append(list.get(i).getName());
                stringBuilder.append("</b>\",\"hasChildren\":");
                if (siteService.hasChildren(list.get(i).getId())) {
                    stringBuilder.append("true");
                } else {
                    stringBuilder.append("false");
                }
                stringBuilder.append(",\"id\":\"");
                stringBuilder.append(list.get(i).getId());
                stringBuilder.append("\"}");
            }
        }


        stringBuilder.append("]");
        ResponseUtil.writeUTF(getHttpResponse(), stringBuilder.toString());

        return null;
    }


    /**
     * 建站向导
     *
     * @return
     */
    public String guide() {
        return "guide";
    }

    /**
     * 建站向导->创建站点
     *
     * @return
     */
    public String guideSite() {
        if (siteService.haveSourcePath(site.getSourcePath())) {
            ResponseUtil.writeUTF(getHttpResponse(), "<script>altert('此源文件目录已经存在');history.back();</script>");
            return null;
        }
        //如果源文件目录不存在，则可以创建源文件目录
        FileUtil.mkdir(getHttpSession().getServletContext().getRealPath("/") + "site/" + site.getSourcePath());
        siteService.insert(site);
        log("添加站点" + site.getName());
        return "guideTemplate";

    }

    /**
     * 建站向导->模板选择
     *
     * @return
     */

    public String guideTemplate() {
        //这里的site是建站向导第一步“创建向导”时让在request中的。
        //id是保存site的时候uuid。
        if (site != null && site.getId().trim().length() > 0) {
            site = siteService.findById(site.getId());

            if (site != null) {
                //选择模板和创建新模板 radio传值，之前就用过type，所有不用再new。
                if ("0".equals(type)) {
                    //选择模板
                    site.setIndexTemplate(template.getId());
                } else {
                    //创建新模板
                    template.setState("1");
                    template.setAddUser(getLoginAdmin());
                    site.setIndexTemplate(templateService.add(template));
                    try {
                        FileUtil.copyDirectory(getHttpSession().getServletContext().getRealPath("/") + "/template/default", getHttpSession().getServletContext().getRealPath("/") + "/template/" + template.getId());
                    } catch (Exception e) {
                        e.printStackTrace();
                        return showMessage(e.getMessage(), getForwardUrl(), getForwardSeconds());
                    }
                }

                //模板结束，创建源文件目录
                //FileUtil.mkdir(getHttpSession().getServletContext().getRealPath("/") + "site/" + site.getSourcePath());
                boolean isInit = false;
                if (site.getIndexTemplate() != null && site.getIndexTemplate().trim().length() > 0) {
                    template = templateService.findById(site.getIndexTemplate());
                    if (template != null) {
                        //如果模板不为空，就要把模板文件夹下的resources拷到新的路径中。
                        FileUtil.copyDirectory(
                                getHttpSession().getServletContext().getRealPath("/") + "template/" + template.getId() + "/resources",
                                getHttpSession().getServletContext().getRealPath("/") + "site/" + site.getSourcePath() + "/resources"
                        );
                    }
                    if (templateChannelService.count(template) > 0) {
                        isInit = true;
                    } else {
                        if (templateLinkService.count(template) > 0) {
                            isInit = true;

                        }
                    }
                }
                siteService.update(site);
                log("站点" + site.getName() + "选择模板" + template.getName());
                if (isInit) {
                    return "guideInit";
                }
                return guideCompleted();
            } else {
                return showMessage("没有找到此站点", getForwardUrl(), getForwardSeconds());
            }
        } else {
            return showMessage("没有传递站点id参数", getForwardUrl(), getForwardSeconds());
        }

    }

    /**
     * 建站向导 初始化站点
     */

    public String guideInit() {
        try {
            if (StringUtil.isNotEmpty(site.getId()) && StringUtil.isNotEmpty(site.getIndexTemplate())) {
                site = siteService.findById(site.getId());
                template = templateService.findById(site.getIndexTemplate());
                if (site != null && template != null) {
                    importSiteChannels(template, site);
                    importSiteLinks(template, site);
                }
            }
            return guideCompleted();
        } catch (Exception e) {
            e.printStackTrace();
            return showMessage("站点初始化失败：" + e.getMessage(), getForwardUrl(), getForwardSeconds());

        }

    }

    private String guideCompleted() {
        if (site.getId() != null && site.getId().trim().length() > 0) {
            site = siteService.findById(site.getId());
        }
        return "guideCompleted";
    }

    /**
     * 站点预览
     *
     * @return
     */
    public String preview() {
        if (StringUtil.isNotEmpty(site.getId())) {
            site = siteService.findById(site.getId());

            try {
                HtmlUtil.html(site, freeMarkerUtil, getServletContext(), getContextPath(), getHttpRequest());
                log("首页静态化：" + site.getName());
                getHttpResponse().sendRedirect("/EasyCMS/site/" + site.getSourcePath() + "/index.html");
            } catch (Exception e) {
                e.printStackTrace();
                return showMessage("预览站点失败：" + e.getMessage(), getForwardUrl(), getForwardSeconds());
            }
        }
        return null;
    }

    /**
     * 站点设置
     *
     * @param
     */
    public String config() {
        site = getManageSite();
        if (site != null) {
            if (StringUtil.isNotEmpty(site.getIndexTemplate())) {
                template = templateService.findById(site.getIndexTemplate());
                if (template != null) {
                    site.setIndexTemplateName(template.getName());
                }
            }
        } else {
            return showMessage("未选择管理站点：");
        }
        return "config";

    }

    public String edit() {
        if (site != null && StringUtil.isNotEmpty(site.getId())) {
            site = siteService.findById(site.getId());
            if (StringUtil.isNotEmpty(site.getIndexTemplate())) {
                template = templateService.findById(site.getIndexTemplate());
                site.setIndexTemplateName(template.getName());
            }
            htmlQuartz = htmlQuartzService.findBySiteId(site.getId());
        }
        return "edit";
    }

    public void del() {
        if (site != null && StringUtil.isNotEmpty(site.getId()))
            site = siteService.findById(site.getId());
        //删除该站点的channel
        channelService.delBySite(site);
        //删除该站点的link
        linkService.delBySite(site);
        //删除该站点的静态调度，暂时不处理。
        //删除site；
        siteService.delByPrimaryKey(site.getId());


        operlogsService.log(getLoginName(), "删除站点" + site.getName(), getHttpRequest());
        write("<script>alert('删除成功！');parent.location.reload();</script>", "utf-8");
    }

    public void log(String content) {
        operlogsService.log(getLoginName(), content, getHttpRequest());
    }


    //------------------------action中的方法调用的子方法-----------------------------------------------------------------

    /**
     * 导入站点栏目数据
     *
     * @param template
     * @param site
     */
    public void importSiteChannels(Template template, Site site) {
        if (template != null && site != null) {
            //全部的Template_Channel
            List<TemplateChannel> templateChannelList = templateChannelService.findByParWithTemplate(template, null);
            Map<String, String> parMap = new HashMap<String, String>();
            //父亲Template_Channel的集合
            List<TemplateChannel> templateChannelPars = new ArrayList<TemplateChannel>();
            //孩子TemplateChannel的集合
            List<TemplateChannel> templateChannels = new ArrayList<TemplateChannel>();
            //不能再遍历的时候删除其中的元素，因为这样会改变他的size。
            Iterator<TemplateChannel> iterator = templateChannelList.iterator();
            while (iterator.hasNext()) {
                TemplateChannel templateChannel = iterator.next();
                if (StringUtil.isNotEmpty(templateChannel.getParId())) {
                    templateChannels.add(templateChannel);
                } else {
                    templateChannelPars.add(templateChannel);

                }
            }
            if (templateChannelPars != null && templateChannelPars.size() > 0) {
                for (TemplateChannel templateChannel : templateChannelPars) {
                    Channel channel = getNewChannel(templateChannel);
                    String channelId = channelService.insert(channel);
                    parMap.put(templateChannel.getId(), channelId);
                }
            }

            for (TemplateChannel templateChannel : templateChannels) {
                Channel channel = getNewChannel(templateChannel);
                String parId = parMap.get(templateChannel.getParId());
                channel.setParId(parId);
                channelService.insert(channel);
            }
        }
    }

    private Channel getNewChannel(TemplateChannel templateChannel) {
        Channel channel = new Channel();
        channel.setName(templateChannel.getName());
        channel.setTemplate(templateChannel.getTemplate());
        channel.setContentTemplate(templateChannel.getContentTemplate());
        //处理图片
        if (StringUtil.isNotEmpty(templateChannel.getImg())) {
            channel.setImg("/site/" + site.getSourcePath() + "/" + templateChannel.getImg());
        }
        channel.setDescription(templateChannel.getDescription());
        channel.setUrl(templateChannel.getUrl());
        channel.setState(templateChannel.getState());
        channel.setOrderNum(templateChannel.getOrderNum());
        channel.setNavigation(templateChannel.getNavigation());
        channel.setPageMark(templateChannel.getPageMark());
        channel.setHtmlChannel(templateChannel.getHtmlChannel());
        channel.setHtmlChannelOld(templateChannel.getHtmlChannelOld());
        channel.setHtmlParChannel(templateChannel.getHtmlParChannel());
        channel.setHtmlSite(templateChannel.getHtmlSite());
        channel.setSite(site);
        return channel;
    }


    /**
     * 导入站点链接分类数据
     *
     * @param template
     * @param site
     */

    public void importSiteLinks(Template template, Site site) {

        if (template != null && site != null) {


            List<TemplateLink> list = templateLinkService.findAllByTemplate(template, "");
            if (list != null && list.size() > 0) {

                TemplateLink templateLink = new TemplateLink();
                for (int i = 0; i < list.size(); i++) {
                    templateLink = list.get(i);
                    if (templateLink != null) {
                        Link link = new Link();
                        link.setSite(site);
                        link.setName(templateLink.getName());
                        link.setImg(templateLink.getImg());
                        link.setParId(templateLink.getParId());
                        link.setUrl(templateLink.getUrl());
                        link.setOrderNum(templateLink.getOrderNum());
                        link.setPageMark(templateLink.getPageMark());
                        link.setIsOk(templateLink.getIsOk());
                        link.setType(templateLink.getType());
                        linkService.add(link);
                    }
                }
            }
        }
    }


}
