package cn.easycms.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by hackingwu on 2014/4/19.
 */
public class HtmlCodeUtil {
    public static String encode(String s){

        if (StringUtil.isNotEmpty(s)){
            s = s.replaceAll("&","&amp;");
            s = s.replaceAll(">", "&gt;");
            s = s.replaceAll("<","&lt;");
            s = s.replaceAll("\'","'");
            s = s.replaceAll("\"","&quot;");
            return s;
        }
        return "";
    }
    public static String decode(String s){
        if (StringUtil.isNotEmpty(s)){
            s = s.replaceAll("&amp;","&");
            s = s.replaceAll("&lt;","<");
            s = s.replaceAll("&gt;",">");
            s = s.replaceAll("'","\'");
            s = s.replaceAll("&quot;","\"");
            return s;
        }
        return "";
    }
    //url上参数的转换，$param$=?,$and$=&,$percent$=%;
    public static String url(String s){
        return s.replace("$param$","?").replace("$and$","&").replace("$percent$","%");

    }
    public static String replaceHtml(String html){
        String regEx = "<.+?>";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(html);
        String  s = m.replaceAll("");
        return  s;
    }
}
