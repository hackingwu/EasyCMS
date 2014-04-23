package cn.easycms.util;

import cn.easycms.model.OperButton;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hackingwu on 2014/4/21.
 */
public class OperButtonUtil {


    public static List<OperButton> getOperButtons(String funcId,HttpServletRequest request) {
        if (request!=null && StringUtil.isNotEmpty(funcId)){
            HttpSession session = request.getSession();
            if (session.getAttribute("operButtons")!=null){
                Map<String,List<OperButton>> operButtons = (HashMap<String,List<OperButton>>)session.getAttribute("operButtons");
                if (operButtons!=null && operButtons.containsKey(funcId)){
                    return operButtons.get(funcId);
                }
            }
        }
        return null;
    }

    public static OperButton getButton(String funcId,String buttonName,HttpServletRequest request){
        List<OperButton> buttons = getOperButtons(funcId,request);
        if (buttons!=null && buttons.size()>0){
            for(OperButton button :buttons){
                if (button.getName().equals(buttonName))
                    return button;
            }
        }
        return null;

    }
    public static void setOperButtons(String funcId,List<OperButton>buttons,HttpServletRequest request ) {
        if (request!=null){
            HttpSession session = request.getSession();
            Map<String,List<OperButton>> operButtons = null;
            if (session.getAttribute("operButtons")!=null){
                operButtons = (HashMap<String,List<OperButton>>)session.getAttribute("operButtons");
            }else{
                operButtons = new HashMap<String, List<OperButton>>();
            }
            if (StringUtil.isNotEmpty(funcId)&&buttons!=null &&buttons.size()>0){
                //如果key value已经存在，value会被新值replace
                operButtons.put(funcId,buttons);
                session.setAttribute("operButtons",operButtons);
            }
        }
    }
    public static boolean haveFunc(String funcId,HttpServletRequest request){
        if (request!=null){
            Map<String,List<OperButton>> operButtons = (HashMap<String,List<OperButton>>)request.getAttribute("operButtons");
            if (operButtons!=null&&operButtons.size()>0&&StringUtil.isNotEmpty(funcId))
                return operButtons.containsKey(funcId);
        }
        return false;
    }
}
