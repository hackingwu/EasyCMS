package cn.easycms.util;

import cn.easycms.model.Site;
import freemarker.template.TemplateException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hackingwu on 14-5-5.
 */
public class HtmlUtil {
    //--freemarker生成html
    public static void html(Site site, FreeMarkerUtil freeMarkerUtil, ServletContext servletContext, String contextPath, HttpServletRequest httpRequest, String loginName) throws IOException, TemplateException {


        //有site并且site有模板
        if (site != null && StringUtil.isNotEmpty(site.getIndexTemplate())) {
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("site", site);
            //contextPath 比getContextPath多了"/";
            data.put("contextPath", contextPath);
            data.put("contextPathNo", httpRequest.getContextPath());
            String realPath = httpRequest.getSession().getServletContext().getRealPath("/");
            freeMarkerUtil.createHTML(servletContext, data,
                    "template/" + site.getIndexTemplate().trim() + "/index.html",
                    realPath + "/site/" + site.getSourcePath() + "/index.html");

        }
    }
}
