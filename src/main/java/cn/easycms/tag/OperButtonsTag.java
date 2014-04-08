package cn.easycms.tag;

import cn.easycms.base.BaseTag;

import javax.servlet.jsp.JspException;

/**
 * Created by hackingwu on 2014/4/7.
 */
public class OperButtonsTag extends BaseTag{
    private String buttonAttr = " class=\"button\" ";
    private String split      = "&nbsp";
    public int doStartTag() throws JspException{
        return this.SKIP_BODY;
    }
}
