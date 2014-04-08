//动态加载页面
function ajaxLoadPage(url, target) {
    var myajax = new Ajax.Updater(target,
				url,
				{
				    method: 'post',
				    parameters: '',
				    evalScripts: true
				});		
}