package cn.easycms.util;

import cn.easycms.model.Channel;
import cn.easycms.model.Info;
import cn.easycms.model.Site;
import freemarker.template.TemplateException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hackingwu on 14-5-5.
 */
public class HtmlUtil {
    /**
     * freemarker生成首页html
     * 静态化site
     */

    public static void html(Site site, FreeMarkerUtil freeMarkerUtil, ServletContext servletContext, String contextPath, HttpServletRequest httpRequest) throws IOException, TemplateException {


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

    /**
     * 生成信息页
     * 静态化Info
     *
     * @throws TemplateException
     * @throws IOException
     */
    public static void html(Info info, Channel channel, Site site, FreeMarkerUtil freeMarkerUtil, ServletContext context, String contextPath, HttpServletRequest request) throws IOException, TemplateException {
        if (info != null) {
            //Channel channel=channelService.findById(info.getChannel());
            String template = "info.html";
            //判断info是否有信息页模板
            template = null;
            if (StringUtil.isNotEmpty(info.getTemplate())) {
                template = info.getTemplate();
            } else if (channel != null && StringUtil.isNotEmpty(channel.getContentTemplate())) {
                template = channel.getContentTemplate();
            }
            //Site site=siteService.findById(info.getSite());
            if (site != null && StringUtil.isNotEmpty(site.getIndexTemplate())) {
                //生成静态页面
                Map<String, Object> data = new HashMap<String, Object>();
                //传递site参数
                data.put("site", site);
                channel.setSitePath(contextPath + "site/" + site.getSourcePath() + "/");
                data.put("currChannel", channel);
                data.put("currInfo", info);
                data.put("contextPath", contextPath);
                data.put("contextPathNo", request.getContextPath());
                //生成目录
                String rootFolder = request.getSession().getServletContext().getRealPath("/") + "/site/" + site.getSourcePath() + "/" + info.getChannelFolder() + "/info/" + (info.getAddTime().getYear() + 1900) + "/";
                File folder = new File(rootFolder);
                if (!folder.exists()) {
                    folder.mkdirs();
                }
                freeMarkerUtil.createHTML(context, data,
                        "template/" + site.getIndexTemplate().trim() + "/" + template,
                        rootFolder + info.getHtmlFileName() + ".html");

            }
        }
    }
    /**
     * 静态化channel
     */
    /**
     * 栏目页静态化
     *
     * @throws TemplateException
     * @throws IOException
     */
    public static void html(Site site, Channel channel, FreeMarkerUtil freeMarkerUtil, ServletContext context, HttpServletRequest request, int pageNum) throws IOException, TemplateException {
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
            if (channel.getMaxPage() > 0) {
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
