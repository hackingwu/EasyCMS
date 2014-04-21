package cn.easycms.util;

import cn.easycms.directive.*;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.Locale;
import java.util.Map;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class FreeMarkerUtil {

    private LinkDirective linkDirective;
    private InfoListDirective infoListDirective;
    private ChannelListDirective channelListDirective;
    private ChannelDirective     channelDirective;
    private HtmlDirective        htmlDirective;

    public void setLinkDirective(LinkDirective linkDirective) {
        this.linkDirective = linkDirective;
    }

    public void setInfoListDirective(InfoListDirective infoListDirective) {
        this.infoListDirective = infoListDirective;
    }

    public void setChannelListDirective(ChannelListDirective channelListDirective) {
        this.channelListDirective = channelListDirective;
    }

    public void setChannelDirective(ChannelDirective channelDirective) {
        this.channelDirective = channelDirective;
    }

    public void setHtmlDirective(HtmlDirective htmlDirective) {
        this.htmlDirective = htmlDirective;
    }

    /**
     * 生成静态页面的主方法 默认编码为UTF-8
     * @param servletContext
     * @param data ftl的数据集
     * @param templatePath ftl模板路径
     * @param htmlPath 生成静态页面的路径
     */
    public  void createHTML(ServletContext servletContext, Map<String, Object> data, String templatePath, String htmlPath) throws IOException,TemplateException{
        createHTML(servletContext,data,templatePath,"UTF-8",htmlPath,"UTF-8");

    }

    /**
     * 生成静态页面主方法
     * @param servletContext
     * @param data ftl所有的数据集
     * @param templatePath ftl模板的路径
     * @param templateEncode ftl模板的编码
     * @param htmlPath 生成静态页面的路径
     * @param htmlEncode 生成静态页面的编码
     */

     public  void createHTML(ServletContext servletContext,Map<String,Object> data,String templatePath,String templateEncode,String htmlPath,String htmlEncode)throws TemplateException,IOException{

            Configuration freemarkerCfg = initCfg(servletContext, templateEncode);
            Template template = freemarkerCfg.getTemplate(templatePath, templateEncode);
            template.setEncoding(templateEncode);
            File htmlFile = new File(htmlPath);
            System.out.println(htmlFile.getCanonicalPath());
            if (!htmlFile.getParentFile().exists()) {
                htmlFile.getParentFile().mkdirs();
            }
            Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile), htmlEncode));
            template.process(data, writer);
            writer.flush();

    }

    private Configuration initCfg(ServletContext servletContext, String templateEncode) throws IOException{
        Configuration freemarkerCfg = null ;
        if (servletContext!=null && servletContext.getAttribute("freemarkerCfg")!=null){

            freemarkerCfg = (Configuration)servletContext.getAttribute("freemarkerCfg");

        }else{
            freemarkerCfg = new Configuration();
            freemarkerCfg.setServletContextForTemplateLoading(servletContext,"/");

//            freemarkerCfg.setDirectoryForTemplateLoading(new File("E:\\workspace\\IdeaProjects\\EasyCMS\\src\\main\\java\\cn\\easycms\\directive"));
            freemarkerCfg.setEncoding(Locale.SIMPLIFIED_CHINESE,templateEncode);
            //加载自定义标签
            freemarkerCfg.setSharedVariable("channelList",channelListDirective);
            freemarkerCfg.setSharedVariable("link"       ,linkDirective);
            freemarkerCfg.setSharedVariable("channel"   ,channelDirective);
            freemarkerCfg.setSharedVariable("infoList"   ,infoListDirective);
            freemarkerCfg.setSharedVariable("html"       ,htmlDirective);
            servletContext.setAttribute("freemarkerCfg",freemarkerCfg);
        }

        return freemarkerCfg;
    }
}
