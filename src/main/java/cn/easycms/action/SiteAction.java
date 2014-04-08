package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Site;
import cn.easycms.service.OperlogsService;
import cn.easycms.service.SiteService;
import cn.easycms.util.FileUtil;
import cn.easycms.util.ResponseUtil;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/8.
 */
public class SiteAction extends BaseAction {

    private String type;
    private List siteList;
    private SiteService siteService;
    private OperlogsService operlogsService;

    public OperlogsService getOperlogsService() {
        return operlogsService;
    }

    public void setOperlogsService(OperlogsService operlogsService) {
        this.operlogsService = operlogsService;
    }

    private String root = "";

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

    private Site site;
    private String onclick;

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
     *查询子站点
     * @return
     */
    public String son(){
        List<Site> list = null;
        if (root.equals("source")){root = "";}
        list = siteService.selectByParId(root);
        StringBuilder stringBuilder = new StringBuilder();
        //拼Json语句
        //[{"text":"","hasChildren":""}]
        stringBuilder.append("[");

        if (list!=null&&list.size()>0){
            for (int i = 0;i<list.size();i++){
                if (site!=null && site.getId()!=null && site.getId().trim().length()>0 && site.getId().equals(list.get(i).getId())){
                    continue;
                }
                //如果不是json的开头
                if (!"[".equals(stringBuilder.toString())){
                    stringBuilder.append(",");
                }
                stringBuilder.append("{ \"text\": \"<a onclick=");
                if (onclick!=null && onclick.trim().length()>0){
                    stringBuilder.append(onclick);
                }else{
                    stringBuilder.append("showDetail");
                }
                //onclick或者showDetail方法 showDetail()。。。
                stringBuilder.append("('");
                stringBuilder.append(list.get(i).getId());
                stringBuilder.append("','"+list.get(i).getName().replaceAll(" ","")+"','"+(site!=null && site.getId()!=null?site.getId():"")+"')><b>");
                stringBuilder.append(list.get(i).getName());
                stringBuilder.append("\",\"hasChildren\":");
                if (siteService.hasChildren(list.get(i).getId())){
                    stringBuilder.append("true");
                }else {
                    stringBuilder.append("false");
                }
                stringBuilder.append(",\"id\":\"");
                stringBuilder.append(list.get(i).getName());
                stringBuilder.append("\"}");
            }
        }





        stringBuilder.append("]");
        ResponseUtil.writeUTF(getHttpResponse(),stringBuilder.toString());

        return null;
    }


    /**
     * 建站向导
     * @return
     */
    public String guide(){
        return "guide";
    }

    /**
     * 建站向导->创建站点
     * @return
     */
    public String guideSite(){
        if (siteService.haveSourcePath(site.getSourcePath())){
            ResponseUtil.writeUTF(getHttpResponse(),"<script>altert('此源文件目录已经存在');history.back();</script>");
            return null;
        }
        //如果源文件目录不存在，则可以创建源文件目录
        FileUtil.mkdir(site.getSourcePath());
        siteService.insert(site);
        operlogsService.log(getLoginName(),"添加站点"+site.getName(),getHttpRequest());
        return "guideTemplate";

    }
}
