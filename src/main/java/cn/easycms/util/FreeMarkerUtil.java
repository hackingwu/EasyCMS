package cn.easycms.util;

import cn.easycms.directive.AjaxInfoClickDirective;
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

    /**
     * 生成静态页面的主方法 默认编码为UTF-8
     * @param servletContext
     * @param data ftl的数据集
     * @param templatePath ftl模板路径
     * @param htmlPath 生成静态页面的路径
     */
    public static void createHTML(ServletContext servletContext, Map<String, Object> data, String templatePath, String htmlPath) throws IOException,TemplateException{
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

    public static void createHTML(ServletContext servletContext,Map<String,Object> data,String templatePath,String templateEncode,String htmlPath,String htmlEncode)throws IOException,TemplateException{

        Configuration freemarkerCfg = initCfg(servletContext,templateEncode);
        Template template           = freemarkerCfg.getTemplate(templatePath,templateEncode);
        template.setEncoding(templateEncode);
        File htmlFile               = new File(htmlPath);
        if (!htmlFile.getParentFile().exists()){
            htmlFile.getParentFile().mkdirs();
        }
        Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile),htmlEncode));
        template.process(data,writer);
        writer.flush();
    }

    private static Configuration initCfg(ServletContext servletContext, String templateEncode) {
        Configuration freemarkerCfg = null ;
        if (servletContext.getAttribute("freemarkerCfg")!=null){

            freemarkerCfg = (Configuration)servletContext.getAttribute("freemarkerCfg");

        }else{
            freemarkerCfg = new Configuration();
            freemarkerCfg.setServletContextForTemplateLoading(servletContext,"/");
            freemarkerCfg.setEncoding(Locale.getDefault(),templateEncode);
            //加载自定义标签
            //Ajax类
            freemarkerCfg.setSharedVariable("ajaxInfoClick",new AjaxInfoClickDirective());
        }
        return freemarkerCfg;
    }
}
