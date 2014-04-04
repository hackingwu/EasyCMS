//选择站点
function selectSite() {
    $.weeboxs.open('site_site.do?type=select', {title: '选择站点', contentType: 'ajax', height: 320, width: 280
    });
}
//选择站点中选择一个站点时触发的事件
function showDetail(id, name, siteid) {
    var url = location.href;
    url = url.replace("site.id=", "site.idold=");
    url = url.replace("#", "");
    location.href = url + "&site.id=" + id;
}
//点击栏目
function showOne(id, name) {
    $("#infoFrame").attr("src", "info_list.do?pageFuncId=" + $("#pageFuncId").val() + "&info.channel=" + id);
}
function selectChange(obj) {
    var url = location.href;
    url = url.replace("site.id=", "site.idold=");
    url = url.replace("#", "");
    location.href = url + "&site.id=" + obj.value;
}