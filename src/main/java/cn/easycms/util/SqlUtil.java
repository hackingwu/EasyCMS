package cn.easycms.util;

/**
 * Created by hackingwu on 2014/4/18.
 */
public class SqlUtil {
    //过滤危险的sql符号
    //避免sql注入
    public static String replace(String sql){
        sql.replaceAll("&","");
        sql.replaceAll("%","");
        sql.replaceAll("|","");
        sql.replaceAll(">","");
        sql.replaceAll("<","");
        sql.replaceAll("/","");
        sql.replaceAll("%","");
        sql.replaceAll("--","");
        sql.replaceAll("'","");
        sql.replaceAll(";","");
        return sql;
    }
}
