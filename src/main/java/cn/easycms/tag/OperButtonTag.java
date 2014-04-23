package cn.easycms.tag;

import cn.easycms.base.BaseTag;
import cn.easycms.model.Func;
import cn.easycms.model.OperButton;
import cn.easycms.service.FuncService;
import cn.easycms.service.OperButtonService;
import cn.easycms.util.OperButtonUtil;
import cn.easycms.util.StringUtil;
import org.springframework.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/21.
 */
public class OperButtonTag extends BaseTag{
    String buttonAttr = " \"button\" ";
    String buttonName = "";

    @Override
    public int doStartTag() throws JspException {
        try{
            HttpServletRequest request = getRequest();
            if (StringUtil.isNotEmpty(request.getParameter("pageFuncId"))){
                String pageFuncId = request.getParameter("pageFuncId").trim();
                OperButton button = OperButtonUtil.getButton(pageFuncId,buttonName,request);
                if (button==null && !OperButtonUtil.haveFunc(pageFuncId,request) ){
                    OperButtonService service = (OperButtonService)getApplicationContext().getBean("OperButtonService");
                    Func func = ((FuncService)getApplicationContext().getBean("FuncService")).findById(pageFuncId);
                    List<OperButton>buttons = service.findByFuncOk(func);
                    OperButtonUtil.setOperButtons(pageFuncId,buttons,request);
                    if (buttons!=null && buttons.size()>0){

                        for (OperButton buttonTemp :buttons){
                            if (buttonTemp.getName().equals(buttonName)) {
                                button = buttonTemp;
                                break;
                            }
                        }
                    }
                }
                if (button!=null){
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("<input type= \"button\"");
                    stringBuilder.append("value= \""+buttonName+"\"");
                    stringBuilder.append("onclick= \""+button.getCode()+"\"");
                    stringBuilder.append(buttonAttr);
                    stringBuilder.append("/>");
                    pageContext.getOut().println(stringBuilder.toString());
                }


            }

        }catch (IOException e){
            e.printStackTrace();
        }
        return this.SKIP_BODY;
    }

    public String getButtonAttr() {
        return buttonAttr;
    }

    public void setButtonAttr(String buttonAttr) {
        this.buttonAttr = buttonAttr;
    }

    public String getButtonName() {
        return buttonName;
    }

    public void setButtonName(String buttonName) {
        this.buttonName = buttonName;
    }
}
