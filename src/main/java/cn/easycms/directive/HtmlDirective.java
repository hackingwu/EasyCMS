package cn.easycms.directive;

import cn.easycms.base.BaseDirective;
import cn.easycms.util.HtmlCodeUtil;
import cn.easycms.util.StringUtil;
import freemarker.core.Environment;
import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.beans.StringModel;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.util.Map;

/**
 * 参数
 * code       html代码
 * length     显示长度
 * delHtml    删除html标签，默认删除，0不删除
 * Created by hackingwu on 2014/4/19.
 */
public class HtmlDirective extends BaseDirective implements TemplateDirectiveModel{
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        String code = getParam(params,"code");
        int  length = getParam(params,"length",0);
        String delHtml = getParam(params,"delHtml");
        if (body!=null){
            if (loopVars!=null && loopVars.length>0){
                if (StringUtil.isNotEmpty(code)){
                    if (!"0".equals(delHtml)){
                        //删除html标签，利用正则表达式
                        code = HtmlCodeUtil.replaceHtml(code);
                    }
                    if (length>0 && code.length()>length){
                        code = code.substring(0,length);
                    }
                }
            }
            loopVars[0] = new StringModel(code,new BeansWrapper());
            body.render(env.getOut());
        }
    }
}
