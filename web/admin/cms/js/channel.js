//站点选择改变时调用
function selectChange() {
    var url = location.href;
    url = url.replace("site.id=", "site.idold=");
    location.href = url + "&site.id=" + $("#siteId").val();
}
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
    $("#channelFrame").attr("src", "channel_edit.do?channel.id=" + id);
}
//添加一级栏目
function addOne() {
    if ($("#siteId").val() != "") {
        $("#channelFrame").attr("src", "channel_edit.do?site.id=" + $("#siteId").val());
    } else {
        alert("请选择站点");
        selectSite();
    }
}