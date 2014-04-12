package cn.easycms.util;

import freemarker.template.Configuration;

import javax.servlet.ServletContext;
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
    public static void createHTML(ServletContext servletContext, Map<String, Object> data, String templatePath, String htmlPath) {
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

    public static void createHTML(ServletContext servletContext,Map<String,Object> data,String templatePath,String templateEncode,String htmlPath,String htmlEncode){

        Configuration freemarkerCfg = initCfg(servletContext,templateEncode);

    }

    private static Configuration initCfg(ServletContext servletContext, String templateEncode) {
        Configuration freemarkerCfg = null ;
        if (servletContext.getAttribute("freemarkerCfg")!=null){

            freemarkerCfg = (Configuration)servletContext.getAttribute("freemarkerCfg");

        }else{
            freemarkerCfg = new Configuration();
            freemarkerCfg.setServletContextForTemplateLoading(servletContext,"/");
            freemarkerCfg.setEncoding(Locale.getDefault(),templateEncode);

        }
        return freemarkerCfg;
    }
}
