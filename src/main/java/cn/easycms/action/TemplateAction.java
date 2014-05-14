package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Site;
import cn.easycms.model.Template;
import cn.easycms.service.SiteService;
import cn.easycms.service.TemplateChannelService;
import cn.easycms.service.TemplateLinkService;
import cn.easycms.service.TemplateService;
import cn.easycms.util.FileUtil;
import cn.easycms.util.Pager;
import cn.easycms.util.StringUtil;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/10.
 */
public class TemplateAction extends BaseAction {

    private TemplateService templateService;
    private TemplateChannelService templateChannelService;
    private TemplateLinkService templateLinkService;
    private SiteService siteService;
    private Site site;
    private Template template;
    private List<Template> templateList;
    private int currPage;
    private int pageSize;
    private String pageStr;
    private String root;
    private String inputid;
    private List<File> sonFiles;
    private String type;
    private String currFolder;
    private String onClick;
    private String rootHasSon;
    private int totalCount;
    private String order;

    public String getInputid() {
        return inputid;
    }

    public void setInputid(String inputid) {
        this.inputid = inputid;
    }

    public List<File> getSonFiles() {
        return sonFiles;
    }

    public void setSonFiles(List<File> sonFiles) {
        this.sonFiles = sonFiles;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCurrFolder() {
        return currFolder;
    }

    public void setCurrFolder(String currFolder) {
        this.currFolder = currFolder;
    }

    public String isOnClick() {
        return onClick;
    }

    public void setOnClick(String onClick) {
        this.onClick = onClick;
    }

    public String getRoot() {
        return root;
    }

    public void setRoot(String root) {
        this.root = root;
    }

    public String getRootHasSon() {
        return rootHasSon;
    }

    public void setRootHasSon(String rootHasSon) {
        this.rootHasSon = rootHasSon;
    }

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
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

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public List<Template> getTemplateList() {
        return templateList;
    }

    public void setTemplateList(List<Template> templateList) {
        this.templateList = templateList;
    }

    public Template getTemplate() {
        return template;
    }

    public void setTemplate(Template template) {
        this.template = template;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public void setTemplateService(TemplateService templateService) {
        this.templateService = templateService;
    }

    public void setTemplateChannelService(TemplateChannelService templateChannelService) {
        this.templateChannelService = templateChannelService;
    }

    public void setTemplateLinkService(TemplateLinkService templateLinkService) {
        this.templateLinkService = templateLinkService;
    }

    public void setSiteService(SiteService siteService) {
        this.siteService = siteService;
    }


    public String select() {

        if (site != null && StringUtil.isNotEmpty(site.getId())) {
            //编辑站点的时候
            site = siteService.findById(site.getId());
            if (template == null)
                template = new Template();
            templateList = templateService.findAll();

        } else {
            //添加新站点时
            templateList = templateService.findAll();
        }
        return "select";

    }

    /**
     * 模板管理
     * 列表
     *
     * @return
     */
    public String list() {
        if (template == null) {
            template = new Template();
        }
        template.setNoDel("1");
        //普通用户只查看自己添加的
        if (!isAdminLogin()) {
            template.setAddUser(getLoginAdmin());
        }
        if (!StringUtil.isNotEmpty(order)) {
            order = "orderNum";
        }
        templateList = templateService.find(template, order, currPage, pageSize);
        totalCount = templateService.count(template);
        Pager pager = new Pager(getHttpRequest());
        pager.appendParam("template.name");
        pager.appendParam("order");
        pager.appendParam("pageSize");
        pager.appendParam("pageFuncId");
        pager.setCurrPage(currPage);
        pager.setPageSize(pageSize);
        pager.setTotalCount(totalCount);
        pager.setOutStr("template_list.do");
        pageStr = pager.getOutStr();
        return "list";
    }

    /**
     * 选择模板文件
     *
     * @return
     */
    public String selectFile() {
        if (site != null && site.getId() != null && site.getId().trim().length() > 0) {
            //如果有site.id参数则查询站点的模板
            site = siteService.findById(site.getId());
            if (site != null) {
                if (template == null) {
                    template = new Template();
                }
                template.setId(site.getIndexTemplate());
            }
        }
        if (template != null && StringUtil.isNotEmpty(template.getId())) {
            template = templateService.findById(template.getId());
            //判断根目录有无子文件夹
            if (FileUtil.hasSonFolder(getHttpRequest().getSession().getServletContext().getRealPath("/") + "/template/" + template.getId())) {
                rootHasSon = "1";
            }
        }
        return "selectFile";
    }

    /**
     * 查询子文件夹
     *
     * @return
     * @throws UnsupportedEncodingException
     */
    public String folderSon() throws UnsupportedEncodingException {
        if (root != null && root.trim().length() > 0) {
            root = URLDecoder.decode(root, "utf-8");
            List<File> sonFiles = FileUtil.getFolders(root);
            //生成树
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[");
            if (sonFiles != null && sonFiles.size() > 0) {
                for (int i = 0; i < sonFiles.size(); i++) {
                    if (sonFiles.get(i).isDirectory()) {
                        if (!"[".equals(stringBuilder.toString())) {
                            stringBuilder.append(",");
                        }
                        stringBuilder.append("{ \"text\": \"<a  onclick=");
                        if (StringUtil.isNotEmpty(onClick)) {
                            stringBuilder.append(onClick);
                        } else {
                            stringBuilder.append("showOne");
                        }
                        stringBuilder.append("('");
                        stringBuilder.append(URLEncoder.encode(sonFiles.get(i).getPath().replace("\\", "/"), "UTF-8"));
                        stringBuilder.append("')>");
                        stringBuilder.append(sonFiles.get(i).getName());
                        stringBuilder.append("</a>\", \"hasChildren\": ");
                        if (FileUtil.hasSonFolder(sonFiles.get(i))) {
                            stringBuilder.append("true");
                        } else {
                            stringBuilder.append("false");
                        }
                        stringBuilder.append(",\"id\":\"");
                        stringBuilder.append(URLEncoder.encode(sonFiles.get(i).getPath().replace("\\", "/"), "UTF-8"));
                        stringBuilder.append("\" }");
                    }
                }
            }
            stringBuilder.append("]");
            write(stringBuilder.toString(), "UTF-8");
        }
        return null;
    }

    /**
     * 获取目录下所有文件
     *
     * @return
     * @throws UnsupportedEncodingException
     */
    public String fileSon() throws UnsupportedEncodingException {
        if (root != null && root.trim().length() > 0) {
            root = URLDecoder.decode(root, "utf-8");

            String realPath = getHttpRequest().getSession().getServletContext().getRealPath("/").replace("\\", "/");
            currFolder = root.replace(realPath + "template/", "");
            if (currFolder.indexOf("/") > -1) {
                currFolder = currFolder.substring(currFolder.indexOf("/"));
            } else {
                currFolder = "根目录";
            }
            sonFiles = FileUtil.getFiles(root);
        }
        if ("select".equals(type)) {
            return "fileSonSelect";
        }
        return "fileSon";
    }


}
