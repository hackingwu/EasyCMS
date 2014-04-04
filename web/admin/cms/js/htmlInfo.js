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

}
function createHtml() {
    if ($("#siteId").val() == "") {
        alert("请选择站点");
        return false;
    }
    if ($.trim($("#endtime").val()) != "" && $.trim($("#starttime").val()) != ""
        && $.trim($("#endtime").val()) < $.trim($("#starttime").val())) {
        alert("结束时间必须大于开始时间");
        $("#endtime").focus();
        return false;
    }
    $("#buttonTable").fadeOut("slow");
    $("#operInfo").fadeIn("slow");
    document.getElementById("form1").submit();
}