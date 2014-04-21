function save(form) {
    if ($.trim($("#name").val()) == "") {
        alert("请输入名称");
        $("#name").focus();
        return false;
    }
    if ($.trim($("#sourcepath").val()) == "") {
        alert("请输入源文件目录名");
        $("#sourcepath").focus();
        return false;
    }
    form.submit();
}
function selectPar() {
    $.weeboxs.open('site_site.do?type=select', {title: '选择父站点', contentType: 'ajax', height: 320, width: 280});
}
//选择一个站点时触发的事件
function showDetail(id, name, siteid) {
    $("#parid").val(id);
    $("#parname").val(name);
    $.weeboxs.close();
}