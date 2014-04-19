package cn.easycms.directive;

import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hackingwu on 2014/4/17.
 */
public class Test {
    public static void main(String[] args) throws Exception{
        Configuration configuration = new Configuration();
        configuration.setSharedVariable("link",new LinkDirective());
        Template template = configuration.getTemplate("test.ftl");
        Map root = new HashMap();
        root.put("name","wu");
        File file = new File("test.html");
        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
        template.process(root,out);
        out.flush();
    }
}
