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
function delLogo() {
    $("#oldLogoSpan").fadeOut("slow");
    $("#oldLogo").val("");
}
function addSon(id) {
    location.href = "site_edit.do?site.parid=" + id;
}
function del(id) {
    if (confirm("确定删除此站点么?注意:删除此站点将同时删除此站点的子站点，并且此操作不可恢复!")) {
        location.href = "site_del.do?site.id=" + id;
    }
}
function preview(siteid) {
    window.open("../../site_preview.do?site.id=" + siteid);
}
function parButton(id) {
    $.weeboxs.open('site_site.do?type=selectPar&site.id=' + id, {title: '改变所属站点', contentType: 'ajax', height: 320, width: 280
    });
}
//改变所属站点中选择一个站点时触发的事件
function showDetail(id, name, siteid) {
    location.href = "site_sitePar.do?site.id=" + $("#siteId").val() + "&site.parid=" + id;
}
//改变所属站点中选择一个站点时触发的事件
function parSite(siteid) {
    location.href = "site_sitePar.do?site.id=" + $("#siteId").val() + "&site.parid=" + siteid;
}
//选择模板
function selectTemplet(id) {
    $.weeboxs.open('templet_select.do?site.id=' + id, {title: '选择模板', contentType: 'ajax', height: 370, width: 280
    });
}
function selectTempletDo(id, name) {
    $("#indextemplet").val(id);
    $("#indextempletName").val(name);
    $.weeboxs.close();
}
//同步资源
function syncRes() {
    if ($("#indextemplet").val() == "") {
        alert("请选择页面模板");
        selectTemplet($("#siteId").val());
        return false;
    }
    if (confirm("此操作将把模板资源文件复制并覆盖到此站点,确认此操作么?")) {
        $.post("site_syncRes.do", "site.id=" + $("#siteId").val() + "&site.indextemplet=" + $("#indextemplet").val(), syncResComplete, "text");
    }
}
function syncResComplete(data) {
    alert(data);
}
function htmlquartzTypeChange(obj) {
    if ("" == obj.value) {
        $("#exetimeTd").fadeOut("slow");
        $("#intervalTd").fadeOut("slow");
    } else if ("0" == obj.value) {
        $("#exetimeTd").fadeIn("slow");
        $("#intervalTd").fadeOut("slow");
    } else if ("1" == obj.value) {
        $("#exetimeTd").fadeOut("slow");
        $("#intervalTd").fadeIn("slow");
    }
}
function intervalTypeChange(obj) {
    if ("" == obj.value) {
        $("#intervalhourTd").fadeOut("slow");
        $("#intervalminTd").fadeOut("slow");
    } else if ("0" == obj.value) {
        $("#intervalhourTd").fadeIn("slow");
        $("#intervalminTd").fadeOut("slow");
    } else if ("1" == obj.value) {
        $("#intervalhourTd").fadeOut("slow");
        $("#intervalminTd").fadeIn("slow");
    }
}