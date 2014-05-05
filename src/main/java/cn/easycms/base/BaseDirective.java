package cn.easycms.base;

import freemarker.core.Environment;
import freemarker.template.TemplateModelException;

import java.util.Map;
import java.util.UUID;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class BaseDirective {

    public String getParam(Map data, String key) {
        String value = null;
        if (data.get(key) != null) {
            value = data.get(key).toString();
        }
        return value;
    }

    public String getParam(Map data, String key, String defaultParam) {
        String value = defaultParam;
        if (data.get(key) != null) {
            value = data.get(key).toString();
        }
        return value;
    }

    public int getParam(Map data, String key, int defaultParam) {
        int value = defaultParam;
        if (data.get(key) != null) {
            value = Integer.parseInt(data.get(key).toString());
        }
        return value;
    }


    public String getData(Environment env, String key) {
        Object value = null;
        try {
            value = env.getDataModel().get(key);
        } catch (TemplateModelException e) {
            e.printStackTrace();
        }
        return value != null ? value.toString() : "";

    }

    public String getData(Environment env, String key, String defaultData) {
        String temp = getData(env, key);
        return temp.equals("") ? defaultData : temp;
    }

    public String getCommonScriptStr(String path) {
        return "<script src='" + path + "js/jquery-1.5.1.min.js'></script>";
    }

    public String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    public String getImgStr(String path) {
        return "<img src='" + path + "'/>";
    }
}
