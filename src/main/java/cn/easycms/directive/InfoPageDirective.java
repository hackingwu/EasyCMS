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
 * Created by hackingwu on 5/12/14.
 */
public class InfoPageDirective extends BaseDirective implements TemplateDirectiveModel {
    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody body) throws TemplateException, IOException {

    }
}
