package cn.easycms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by hackingwu on 2014/4/19.
 */
public class DateUtil {
    private static Calendar calendar = Calendar.getInstance();

    //把时间转换成字符串
    public static String format(Date date, String format) {
        //format 一般是 "YYYY-mm-dd hh:MM:ss"
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        if (date != null) {
            return sdf.format(date);
        }
        return "";
    }

    public static String format(Date date) {
        return format(date, "YYYY-mm-dd hh:MM:ss");
    }

    //把时间字符串转换成时间
    public static Date parse(String date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        if (StringUtil.isNotEmpty(date)) {
            try {
                return sdf.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    //计算两个时间的时间差（毫秒）
    public static long differ(Date date1, Date date2) {
        if (date1 != null && date2 != null) {
            return date2.getTime() - date1.getTime();
        }
        return 0;
    }

    public static String getYear(Date date) {
        calendar.setTime(date);
        return String.valueOf(calendar.get(Calendar.YEAR));
    }
}
