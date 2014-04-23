package cn.easycms.tag;

import cn.easycms.base.BaseTag;
import cn.easycms.model.Func;
import cn.easycms.model.OperButton;
import cn.easycms.service.FuncService;
import cn.easycms.service.OperButtonService;
import cn.easycms.util.OperButtonUtil;
import cn.easycms.util.StringUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.util.List;

/**
 * 操作按钮列表标签
 * Created by hackingwu on 2014/4/7.
 */
public class OperButtonsTag extends BaseTag{
    private String buttonAttr = " class=\"button\" "; //标签中的class属性，class='button';
    private String split      = "&nbsp";

    @Override
    public int doEndTag() throws JspException {
        return super.doEndTag();
    }

    public String getButtonAttr() {
        return buttonAttr;
    }

    public void setButtonAttr(String buttonAttr) {
        this.buttonAttr = buttonAttr;
    }

    public String getSplit() {
        return split;
    }

    public void setSplit(String split) {
        this.split = split;
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            HttpServletRequest request = getRequest();
            if (StringUtil.isNotEmpty(request.getParameter("pageFuncId"))){
                String pageFuncId = request.getParameter("pageFuncId");
                List<OperButton> buttons = OperButtonUtil.getOperButtons(pageFuncId,request);
                if (buttons==null || buttons.size() == 0){
                    OperButtonService service = (OperButtonService)getApplicationContext().getBean("OperButtonService");
                    Func func = ((FuncService)getApplicationContext().getBean("FuncService")).findById(pageFuncId);
                    buttons = service.findByFuncOk(func);
                    OperButtonUtil.setOperButtons(pageFuncId,buttons,request);
                }
                if (buttons!=null && buttons.size()>0){
                    StringBuilder sb = new StringBuilder();
                    for(OperButton button:buttons){
                        sb.append("<input type=\"button\"");
                        sb.append("value=\""+button.getName()+"\"");
                        sb.append("onclick=\""+button.getCode()+"\"");
                        sb.append(buttonAttr);
                        sb.append("/>");
                        sb.append(split);
                    }
                    pageContext.getOut().println(sb.toString());
                }
            }
        }catch (IOException e){
            e.printStackTrace();
        }
        return this.SKIP_BODY;

    }
}
