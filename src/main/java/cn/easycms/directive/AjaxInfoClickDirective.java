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
import java.util.UUID;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class AjaxInfoClickDirective extends BaseDirective implements TemplateDirectiveModel{
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {

        //获取参数
        //信息ID
        String infoId     = getParam(params,"infoId");
        //span的属性
        String spanAttr   = getParam(params,"spanAttr");
        //是否加载引用的javascript
        String loadJs     = getParam(params,"loadJs");
        Writer out        = env.getOut();
        if (body!=null){
            if (loopVars!=null &&loopVars.length>0 && StringUtil.isNotEmpty(infoId)){
                String contextPath = env.getDataModel().get("contextPath").toString();
                StringBuilder stringBuilder =new StringBuilder();
                if ("true".equals(loadJs)){
                    stringBuilder.append("<script src='"+contextPath+"js/jquery-1.5.1.min.js'></script>");

                }
                //生成唯一标识
                String uuid = UUID.randomUUID().toString().replace("-","");
                //生成显示点击量的span，默认显示loading
                stringBuilder.append("<span id='ajaxInfoClickSpan"+uuid+"' "+spanAttr+"><img src='"+contextPath+"js/images/ajax-loader.gif'/></span");
                stringBuilder.append("<sropt>");
                //执行ajax操作
                stringBuilder.append("$.post('"+contextPath+"info_ajaxClick.do','info.id="+infoId+"',ajaxInfoClickComplete"+uuid+"'text');");
                //回调函数
                stringBuilder.append("function ajaxInfoClickComplete"+uuid+"(data){");
                //显示点击量,data是传值进来的。
                stringBuilder.append("$('#ajaxInfoClickSpan"+uuid+"').html(data);");
                stringBuilder.append("}");
                stringBuilder.append("</script>");
                loopVars[0] = new StringModel(stringBuilder.toString(),new BeansWrapper());
                body.render(env.getOut());
            }
       }
    }

}

