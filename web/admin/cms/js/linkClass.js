function getType() {
    var type = document.getElementById("type").value;
    if ("1" == type) {
        return "下拉";
    }
    else if ("2" == type) {
        return "图片";
    }
    else if ("3" == type) {
        return "文字";
    }
}
var isEdit = "0";
//选择站点
function selectSite() {
    isEdit = "0";
    $.weeboxs.open('site_site.do?type=select', {title: '选择站点', contentType: 'ajax', height: 320, width: 280
    });
}
//选择站点(编辑页面)
function selectSite_edit() {
    isEdit = "1";
    $.weeboxs.open('site_site.do?type=select', {title: '选择站点', contentType: 'ajax', height: 320, width: 280
    });
}
//选择站点中选择一个站点时触发的事件
function showDetail(id, name, siteid) {
    if (isEdit == "1") {
        $("#siteId_edit").val(id);
        $("#siteName_edit").val(name);
    } else {
        $("#siteId").val(id);
        $("#siteName").val(name);
    }
    $.weeboxs.close();
}
//添加
function add() {
    $.weeboxs.open('link_clazzEdit.do', {title: '添加' + getType() + '链接分类', contentType: 'ajax', height: 240, width: 500,
        onok: function () {
            if ($.trim($("#siteId_edit").val()) == "") {
                alert("请选择站点!");
                return false;
            }
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
            $.post("link_clazzEditDo.do", "link.name=" + $("#name_edit").val() + "&link.isok=" + isok + "&link.ordernum=" + $("#ordernum").val()
                    + "&link.site=" + $("#siteId_edit").val() + "&link.type=" + $("#type").val() + "&link.pagemark=" + $("#pagemark_edit").val()
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('link_clazzEdit.do?link.id=' + getCheckOneValue(), {title: '编辑' + getType() + '链接分类', contentType: 'ajax', height: 240, width: 500,
            onok: function () {
                if ($.trim($("#siteId_edit").val()) == "") {
                    alert("请选择站点!");
                    return false;
                }
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
                $.post("link_clazzEditDo.do", "link.id=" + getCheckOneValue() + "&link.name=" + $("#name_edit").val() + "&link.isok=" + isok + "&link.ordernum=" + $("#ordernum").val()
                        + "&link.site=" + $("#siteId_edit").val() + "&link.type=" + $("#type").val() + "&link.pagemark=" + $("#pagemark_edit").val()
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
        var h = location.href.replace("link.site", "link.oldsite");
        h = h + (h.indexOf("?") > -1 ? "&" : "?") + "link.site=" + data.replace("succ", "");
        location.href = h;
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
        if ("SELECT" == $("#siteId_edit").attr("tagName")) {
            var opts = document.getElementById("siteId_edit").options;
            if (opts != null && opts.length > 0) {
                for (var i = 0; i < opts.length; i++) {
                    if (opts[i].selected) {
                        document.getElementById("site" + id).innerHTML = opts[i].show;
                    }
                }
            }
        }
        if ($("#siteName_edit").val() != undefined) {
            document.getElementById("site" + id).innerHTML = $("#siteName_edit").val();
        }
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
function searchFormSubmit(form) {
    if ($.trim($("#siteId").val()) == "") {
        alert("请选择站点!");
        return false;
    }
    form.submit();
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("link_clazzDel.do", "ids=" + getCheckValue(), delComplete, "text");
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