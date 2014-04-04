//添加一级栏目
function addOne() {
    if ($("#templetId").val() != "") {
        $("#channelFrame").attr("src", "templetChannel_edit.do?templet.id=" + $("#templetId").val());
    }
}
//点击栏目
function showOne(id, name) {
    $("#channelFrame").attr("src", "templetChannel_edit.do?templetChannel.id=" + id);
}
//从站点导入
function importSite() {
    if ($("#templetId").val() != "") {
        $.weeboxs.open('site_site.do?type=select', {title: '选择站点', contentType: 'ajax', height: 350, width: 240});
    }
}
//选择一个站点
function showDetail(id, name, siteid) {
    $("#mixedpar").html("正在导入中,请稍候...");
    location.href = "templetChannel_importSite.do?templet.id=" + $("#templetId").val() + "&site.id=" + id;
}