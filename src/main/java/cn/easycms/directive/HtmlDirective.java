package cn.easycms.directive;

import cn.easycms.base.BaseDirective;
import freemarker.core.Environment;
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
                if ()
            }
        }
    }
}
