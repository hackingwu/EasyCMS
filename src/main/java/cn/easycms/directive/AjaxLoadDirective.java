package cn.easycms.directive;

import cn.easycms.base.BaseDirective;
import cn.easycms.util.StringUtil;
import freemarker.core.Environment;
import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.beans.StringModel;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.io.Writer;
import java.util.Map;

/**
 * Created by hackingwu on 2014/4/13.
 */
public class AjaxLoadDirective extends BaseDirective implements TemplateDirectiveModel {
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        String targetId = getParam(params,"targetId");
        String url      = getParam(params,"url");
        String param    = getParam(params,"param");
        String method   = getParam(params,"method","get");
        String loadJs   = getParam(params,"loadJs");
        Writer out      = env.getOut();
        if (body!=null){
            if (loopVars!=null && loopVars.length>0 && StringUtil.isNotEmpty(targetId)&&StringUtil.isNotEmpty(url)){
                String contextPath = env.getDataModel().get("contextPath").toString();
                StringBuilder stringBuilder = new StringBuilder();
                if ("true".equals(loadJs)){
                    stringBuilder.append(getCommonScriptStr(contextPath));
                }
                String uuid = getUUID();
                stringBuilder.append(getImgStr(contextPath+"js/images/ajax-loader.gif"));
                stringBuilder.append("<script>");
                stringBuilder.append("$."+method+"('"+url+"',{"+param.replaceAll("'","\"")+"},ajaxLoadComplete"+uuid+");");
                stringBuilder.append("function ajaxLoadComplete"+uuid+"(data){");
                stringBuilder.append("$('#"+targetId+"').html(data);");
                stringBuilder.append("}");
                stringBuilder.append("</script>");
                loopVars[0] = new StringModel(stringBuilder.toString(),new BeansWrapper());
                body.render(env.getOut());
            }
        }
    }
}
