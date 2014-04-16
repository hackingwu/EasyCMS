package cn.easycms.directive;

import cn.easycms.base.BaseDirective;
import cn.easycms.util.StringUtil;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.util.Map;

/**
 * Created by hackingwu on 2014/4/13.
 */
public class ApplyopenQueryDirective extends BaseDirective implements TemplateDirectiveModel{


    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        String queryCode = getParam(params,"queryCode");
        if(StringUtil.isNotEmpty(queryCode)){
            if (body!=null){
                if (loopVars!=null && loopVars.length>0){

                }
            }
        }
    }
}
