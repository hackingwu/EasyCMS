package cn.easycms.util;

import cn.easycms.model.Channel;
import cn.easycms.model.Site;
import freemarker.template.TemplateException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hackingwu on 5/11/14.
 */
public class ChannelHtmlUtil {


    /**
     * 静态化channel
     */
    /**
     * 栏目页静态化
     *
     * @throws freemarker.template.TemplateException
     * @throws java.io.IOException
     */
    public static void html(Channel channel, Site site, FreeMarkerUtil freeMarkerUtil, ServletContext context, HttpServletRequest request, int pageNum) throws IOException, TemplateException {
        if (site != null && channel != null
                && StringUtil.isNotEmpty(site.getIndexTemplate())) {
            //生成模板位置
            String templatePath = "template/" + site.getIndexTemplate().trim() + "/channel.html";
            if (StringUtil.isNotEmpty(channel.getTemplate())) {
                templatePath = "template/" + site.getIndexTemplate().trim() + "/" + channel.getTemplate().trim();
            }
            //判断模板文件是否存在
            File templateFile = new File(request.getSession().getServletContext().getRealPath("/") + templatePath);
            channel.setSitePath(request.getContextPath() + "/site/" + site.getSourcePath() + "/");
            if (templateFile.exists()) {
                //先生成第一页
                htmlPage(site, channel, freeMarkerUtil, context, request, templatePath, 1, pageNum);
            }
        }
    }

    /**
     * 栏目页静态化每一页
     *
     * @throws TemplateException
     * @throws IOException
     */
    public static void htmlPage(Site site, Channel channel, FreeMarkerUtil freeMarkerUtil, ServletContext context, HttpServletRequest request, String templatePath, int page, int pageNum) throws IOException, TemplateException {
        if (site != null && channel != null
                && StringUtil.isNotEmpty(site.getIndexTemplate())) {
            //如果设置了最大生成页数
            if (channel.getMaxPage()!=null&&channel.getMaxPage() > 0) {
                pageNum = channel.getMaxPage();
            }
            if (pageNum == 0 || (pageNum > 0 && pageNum >= page)) {
                //生成静态页面
                Map<String, Object> data = new HashMap<String, Object>();
                //传递site参数
                data.put("site", site);
                data.put("currChannel", channel);
                data.put("page", page);
                data.put("pageNum", pageNum);
                data.put("contextPath", request.getContextPath() + "/");
                data.put("contextPathNo", request.getContextPath());
                String rootPath = request.getSession().getServletContext().getRealPath("/") + "/site/" + site.getSourcePath() + "/" + channel.getFolder() + "/";
                //判断栏目文件夹是否存在
                File channelFolder = new File(rootPath);
                if (!channelFolder.exists()) {
                    channelFolder.mkdirs();
                }
                freeMarkerUtil.createHTML(context, data,
                        templatePath,
                        rootPath + "index" + (page > 1 ? "_" + (page - 1) : "") + ".html");

                String content = FileUtil.readFile(rootPath + "index" + (page > 1 ? "_" + (page - 1) : "") + ".html");
                //如果内容里有<!--hasNextPage-->字符串则需要生成下一页
                if (content.indexOf("hasNextPage") > -1) {
                    htmlPage(site, channel, freeMarkerUtil, context, request, templatePath, page + 1, pageNum);
                }
            }
        }
    }

}
