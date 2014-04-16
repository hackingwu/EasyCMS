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
public class AjaxStoreDirective extends BaseDirective implements TemplateDirectiveModel {

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        String objId = getParam(params,"objId");
        String objType = getParam(params,"objType");
        String siteId = getParam(params,"siteId");
        String channelId = getParam(params,"channelId");
        String show = getParam(params,"show","收藏");
        String spanAttr = getParam(params,"spanAttr");
        String loadJs   = getParam(params,"loadJs");
        Writer out = env.getOut();
        if (body!=null){
            if (loopVars != null && loopVars.length>0 && StringUtil.isNotEmpty(objId) && StringUtil.isNotEmpty(objType) ){
                String contextPath = env.getDataModel().get("contextPath").toString();
                StringBuilder stringBuilder = new StringBuilder();
                if ("true".equals(loadJs)){
                    stringBuilder.append(getCommonScriptStr(contextPath));
                }
                String uuid = getUUID();
                stringBuilder.append("<span id='ajaxStoreSpan"+uuid+"' "+spanAttr+"onclick='ajaxStore"+uuid+"()' style='cursor:hand'>"+show+"</span");
                stringBuilder.append("<script>");
                stringBuilder.append("function ajaxStore"+uuid+"(){");
                //执行ajax操作
                stringBuilder.append("$.post('"+contextPath+"store_ajaxStore.do','store.objId="+objId+"&store.objType="+objType+
                "&store.siteId="+siteId+"&store.channelId="+channelId+"',ajaxStoreComplete"+uuid+",'text');");
                stringBuilder.append("}");
                stringBuilder.append("function ajaxStoreComplete"+uuid+"(data){");
                stringBuilder.append("alter(data)");
                stringBuilder.append("}</script>");
                loopVars[0] = new StringModel(stringBuilder.toString(),new BeansWrapper());
                body.render(env.getOut());

            }
        }
    }
}
