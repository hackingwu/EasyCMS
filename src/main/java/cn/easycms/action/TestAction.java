package cn.easycms.action;

import cn.easycms.directive.LinkDirective;
import cn.easycms.util.FreeMarkerUtil;
import com.opensymphony.xwork2.ActionSupport;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hackingwu on 2014/4/20.
 */
public class TestAction extends ActionSupport{

    private FreeMarkerUtil freeMarkerUtil;

    public void setFreeMarkerUtil(FreeMarkerUtil freeMarkerUtil) {
        this.freeMarkerUtil = freeMarkerUtil;
    }

    public String freemarker() {
//        try {
//            Configuration configuration = new Configuration();
//            configuration.setSharedVariable("link", linkDirective);
//            File file = new File("E:\\workspace\\IdeaProjects\\EasyCMS\\src\\main\\java\\cn\\easycms\\directive");
//            configuration.setDirectoryForTemplateLoading(file);
//            Template template = configuration.getTemplate("test.ftl");
//            Map root = new HashMap();
//            root.put("name", "wu");
//            File file1 = new File("E:\\workspace\\IdeaProjects\\EasyCMS\\src\\main\\java\\cn\\easycms\\directive\test.html");
//            System.out.println(file1.getCanonicalPath());
//            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file1), "UTF-8"));
//            template.process(root, out);
//            out.flush();
//        }catch (Exception e){
//            e.printStackTrace();
//        }
        try {
            Map root = new HashMap();
            root.put("contextPath", "EasyCMS/");
            freeMarkerUtil.createHTML(null, root, "test.ftl", "E:\\workspace\\IdeaProjects\\EasyCMS\\src\\main\\java\\cn\\easycms\\directive\\test.html");
        }catch (Exception e){
            e.printStackTrace();
        }return null;
    }
}
