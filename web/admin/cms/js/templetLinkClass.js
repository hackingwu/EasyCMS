//添加
function add() {
    $.weeboxs.open('templetLink_clazzEdit.do', {title: '添加链接分类', contentType: 'ajax', height: 240, width: 500,
        onok: function () {
            if ($.trim($("#name_edit").val()) == "") {
                alert("请输入名称!");
                $("#name_edit").focus();
                return false;
            }
            //成功
            var isok = "1";
            if (document.getElementById("isok0").checked) {
                isok = "0";
            }
            $.post("templetLink_clazzEditDo.do", "templetLink.name=" + $("#name_edit").val() + "&templetLink.isok=" + isok + "&templetLink.ordernum=" + $("#ordernum").val()
                    + "&templetLink.templet=" + $("#templetId").val() + "&templetLink.type=" + $("#type_edit").val() + "&templetLink.pagemark=" + $("#pagemark_edit").val()
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('templetLink_clazzEdit.do?templetLink.id=' + getCheckOneValue(), {title: '编辑链接分类', contentType: 'ajax', height: 240, width: 500,
            onok: function () {
                if ($.trim($("#name_edit").val()) == "") {
                    alert("请输入名称!");
                    $("#name_edit").focus();
                    return false;
                }
                //成功
                var isok = "1";
                if (document.getElementById("isok0").checked) {
                    isok = "0";
                }
                $.post("templetLink_clazzEditDo.do", "templetLink.id=" + getCheckOneValue() + "&templetLink.name=" + $("#name_edit").val() + "&templetLink.isok=" + isok + "&templetLink.ordernum=" + $("#ordernum").val()
                        + "&templetLink.templet=" + $("#templetId").val() + "&templetLink.type=" + $("#type_edit").val() + "&templetLink.pagemark=" + $("#pagemark_edit").val()
                    , editComplete, "text");
            }
        });
    } else {
        alert("请选择一条记录!");
    }
}
function addComplete(data) {
    if (data.indexOf("succ") == 0) {
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
        location.href = location.href;
    } else if (data.indexOf("msg") == 0) {
        alert(data.replace("msg", ""));
    }
    else {
        alert("操作失败，请重试!");
    }
}
function editComplete(data) {
    if (data.indexOf("succ") == 0) {
        var id = getCheckOneValue();
        document.getElementById("name" + id).innerHTML = $("#name_edit").val();
        document.getElementById("pagemark" + id).innerHTML = $("#pagemark_edit").val();
        var isok = "是";
        if (document.getElementById("isok0").checked) {
            isok = "否";
        }
        document.getElementById("isok" + id).innerHTML = isok;
        document.getElementById("ordernum" + id).innerHTML = $("#ordernum").val();
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else if (data.indexOf("msg") == 0) {
        alert(data.replace("msg", ""));
    } else {
        alert("操作失败，请重试!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("templetLink_clazzDel.do", "ids=" + getCheckValue(), delComplete, "text");
        }
    } else {
        alert("请选择要操作的记录!");
    }
}
function delComplete(data) {
    if (data != "") {
        var datas = data.split(";");
        if (datas != null && datas.length > 0) {
            for (var i = 0; i < datas.length; i++) {
                if (datas[i] != "" && document.getElementById("tr" + datas[i]) != null) {
                    document.getElementById("tr" + datas[i]).parentNode.removeChild(document.getElementById("tr" + datas[i]));
                }
            }
        }
    }
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
    location.href = "templetLink_importSite.do?templet.id=" + $("#templetId").val() + "&site.id=" + id;
}