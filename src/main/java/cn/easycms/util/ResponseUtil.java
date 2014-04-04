package cn.easycms.util;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by hackingwu on 2014/4/2.
 */
public class ResponseUtil {
    public static void writeUTF(HttpServletResponse response, String content) {
        response.setContentType("text/html;charset=UTF-8");
        try {
            response.getWriter().print(content);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
