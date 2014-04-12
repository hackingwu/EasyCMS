package cn.easycms.util;

/**
 * Created by hackingwu on 2014/4/10.
 */
public class StringUtil {
    public static boolean isNotEmpty(String s){
        return s!=null && s.trim().length()>0;
    }
}
