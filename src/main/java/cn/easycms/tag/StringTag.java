package cn.easycms.tag;

import cn.easycms.base.BaseTag;

import javax.servlet.jsp.JspException;
import java.io.IOException;

/**
 * Created by hackingwu on 2014/4/7.
 */
public class StringTag extends BaseTag{

    private String str = "";
    //字符串显示的默认长度
    private int len = 10;

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }

    public int getLen() {
        return len;
    }

    public void setLen(int len) {
        this.len = len;
    }

    public int dostartTag() throws JspException{
        if (str!=null && str.trim().length()>0){
            if (str.length() > len){
                str = str.substring(0,len);
            }
            try {
                pageContext.getOut().println(str);
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        return  this.SKIP_BODY;

    }

}
