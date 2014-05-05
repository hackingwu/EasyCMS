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
        //提取此站点下的链接分类
        $.post("link_clazzSelect.do", "link.site=" + id + "&link.type=" + $("#type").val(), clazzSelectComplete, "text");
    } else {
        $("#siteId").val(id);
        $("#siteName").val(name);
    }
    $.weeboxs.close();
}

function clazzSelectComplete(data) {
    $("#linkSelect").empty();
    if (data != null && data != "") {
        var json = eval(data);
        if (json != null && json.length > 0) {
            var html = "";
            for (var i = 0; i < json.length; i++) {
                if (json[i].id != "") {
                    html += "<option value='" + json[i].id + "' show='" + json[i].name + "'>" + json[i].name;
                }
            }
            $("#linkSelect").append(html);
        }
    }
}
function siteChange() {
    if (document.getElementById("siteId_edit").value != "") {
        //提取此站点下的链接分类
        $.post("link_clazzSelect.do", "link.site=" + document.getElementById("siteId_edit").value + "&link.type=" + $("#type").val(), clazzSelectComplete, "text");
    }
}
//添加
function add() {
    $.weeboxs.open('link_edit.do?link.type=' + $("#type").val(), {title: '添加' + getType() + '链接', contentType: 'ajax', height: 380, width: 500,
        onok: function () {
            if ($.trim($("#siteId_edit").val()) == "") {
                alert("请选择站点!");
                return false;
            }
            if ($.trim($("#linkSelect").val()) == "") {
                alert("请选择链接分类!");
                return false;
            }
            if ($.trim($("#name_edit").val()) == "") {
                alert("请输入名称!");
                $("#name_edit").focus();
                return false;
            }
            if ($("#type").val() == "2" && $("#img").val() == "") {
                alert("请选择图片!");
                selectImg();
                return false;
            }
            if ($.trim($("#url").val()) == "") {
                alert("请输入链接地址!");
                $("#url").focus();
                return false;
            }

            //成功
            var isok = "1";
            if (document.getElementById("isok0").checked) {
                isok = "0";
            }
            $.post("link_editDo.do", "link.name=" + $("#name_edit").val() + "&link.isOk=" + isok + "&link.orderNum=" + $("#ordernum").val()
                    + "&link.site.id=" + $("#siteId_edit").val() + "&link.parId=" + $("#linkSelect").val() + "&link.url=" + url($("#url").val())
                    + "&link.type=" + $("#type").val() + "&link.pageMark=" + $("#pagemark_edit").val() + "&link.img=" + $("#img").val()
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('link_edit.do?link.id=' + getCheckOneValue() + '&link.type=' + $("#type").val(), {title: '编辑' + getType() + '链接', contentType: 'ajax', height: 380, width: 500,
            onok: function () {
                if ($.trim($("#siteId_edit").val()) == "") {
                    alert("请选择站点!");
                    return false;
                }
                if ($.trim($("#linkSelect").val()) == "") {
                    alert("请选择链接分类!");
                    return false;
                }
                if ($.trim($("#name_edit").val()) == "") {
                    alert("请输入名称!");
                    $("#name_edit").focus();
                    return false;
                }
                if ($("#type").val() == "2" && $("#img").val() == "") {
                    alert("请选择图片!");
                    selectImg();
                    return false;
                }
                if ($.trim($("#url").val()) == "") {
                    alert("请输入链接地址!");
                    $("#url").focus();
                    return false;
                }
                //成功
                var isok = "1";
                if (document.getElementById("isok0").checked) {
                    isok = "0";
                }
                $.post("link_editDo.do", "link.id=" + getCheckOneValue() + "&link.name=" + $("#name_edit").val() + "&link.isOk=" + isok + "&link.orderNum=" + $("#ordernum").val()
                        + "&link.site.id=" + $("#siteId_edit").val() + "&link.parId=" + $("#linkSelect").val() + "&link.url=" + url($("#url").val())
                        + "&link.type=" + $("#type").val() + "&link.pageMark=" + $("#pagemark_edit").val() + "&link.img=" + $("#img").val()
                    , editComplete, "text");
            }
        });
    } else {
        alert("请选择一条记录!");
    }
}
function addComplete(data) {
    if (data.indexOf("success") == 0) {
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
        location.reload();
    } else if (data.indexOf("msg") == 0) {
        alert(data.replace("msg", ""));
    } else {
        alert("操作失败，请重试!");
    }
}
function editComplete(data) {
    if (data.indexOf("success") == 0) {
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
        var opts = document.getElementById("linkSelect").options;
        if (opts != null && opts.length > 0) {
            for (var i = 0; i < opts.length; i++) {
                if (opts[i].selected) {
                    document.getElementById("class" + id).innerHTML = opts[i].show;
                }
            }
        }
        document.getElementById("name" + id).innerHTML = $("#name_edit").val();
        document.getElementById("pagemark" + id).innerHTML = $("#pagemark_edit").val();
        document.getElementById("imgtd" + id).innerHTML = "<a href='" + $("#img").val() + "' title='点击查看原图' target='_blank'>" +
            "<img width=50 height=35 src='" + $("#img").val() + "'/></a>";
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
        if (confirm("确定删除操作么?此操作无法回退111!")) {
            $.post("link_del.do", "ids=" + getCheckValue(), delComplete, "text");
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

//选择图片
function selectImg() {
    var finder = new CKFinder();
    finder.basePath = '../../';
    finder.selectActionFunction = selectImgDo;
    finder.popup();
}
//选择图片处理
function selectImgDo(fileUrl) {
    var fileUrl = "/EasyCMS" + fileUrl;

    $("#imgSpan").html("<a href='" + fileUrl + "' target='_blank'>" +
        "<img src='" + fileUrl + "'  height='100' title='点击查看大图'/>" +
        "</a>");
    $("#imgDelBtn").fadeIn("slow");
    $("#img").val(fileUrl);
}
//删除图片
function delImg() {
    $("#imgSpan").empty();
    $("#imgDelBtn").fadeOut("slow");
    $("#img").val("");
}
