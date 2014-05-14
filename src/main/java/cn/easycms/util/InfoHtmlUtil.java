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
 * Created by hackingwu on 5/11/14.
 */
public class InfoHtmlUtil {
    /**
     * 生成信息页
     * 静态化Info
     *
     * @throws freemarker.template.TemplateException
     * @throws java.io.IOException
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

                String rootFolder = request.getSession().getServletContext().getRealPath("/") + "/site/" + site.getSourcePath() + "/" + info.getChannelFolder() + "/info/" + DateUtil.getYear(info.getAddTime()) + "/";
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
     * 删除信息页
     *
     * @throws TemplateException
     * @throws IOException
     */
    public static void delHtml(Info info, Site site, HttpServletRequest request) throws IOException, TemplateException {
        //查询信息

        if (info != null) {

            if (site != null) {
                //删除静态文件

                String htmlFile = request.getSession().getServletContext().getRealPath("/") + "/site/" + site.getSourcePath() +
                        "/" + info.getChannelFolder() + "/info/" + DateUtil.getYear(info.getAddTime()) + "/" + info.getHtmlFileName() + ".html";
                File file = new File(htmlFile);
                if (file.exists()) {
                    file.delete();
                }
            }
        }
    }
}
