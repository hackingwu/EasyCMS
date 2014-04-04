function getType() {
    var type = $("#type").val();
    if ("0" == type) {
        return "系统";
    } else {
        return "个人";
    }
}
//添加
function add() {
    $.weeboxs.open('adminlink_edit.do?adminlink.type=' + $("#type").val(), {title: '添加' + getType() + '链接', contentType: 'ajax', height: 280, width: 500,
        onok: function () {
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
            $.post("adminlink_editDo.do", "adminlink.name=" + $("#name_edit").val() + "&adminlink.isok=" + isok + "&adminlink.ordernum=" + $("#ordernum").val()
                    + "&adminlink.url=" + url($("#url").val())
                    + "&adminlink.type=" + $("#type").val() + "&adminlink.img=" + $("#img").val()
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('adminlink_edit.do?adminlink.id=' + getCheckOneValue() + '&adminlink.type=' + $("#type").val(), {title: '编辑' + getType() + '链接', contentType: 'ajax', height: 280, width: 500,
            onok: function () {
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
                $.post("adminlink_editDo.do", "adminlink.id=" + getCheckOneValue() + "&adminlink.name=" + $("#name_edit").val() + "&adminlink.isok=" + isok + "&adminlink.ordernum=" + $("#ordernum").val()
                        + "&adminlink.url=" + url($("#url").val())
                        + "&adminlink.type=" + $("#type").val() + "&adminlink.img=" + $("#img").val()
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
    } else {
        alert("操作失败，请重试!");
    }
}
function editComplete(data) {
    if (data.indexOf("succ") == 0) {
        var id = getCheckOneValue();
        document.getElementById("name" + id).innerHTML = $("#name_edit").val();
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
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("adminlink_del.do", "ids=" + getCheckValue(), delComplete, "text");
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
    finder.basePath = '../';
    finder.selectActionFunction = selectImgDo;
    finder.popup();
}
//选择图片处理
function selectImgDo(fileUrl) {
    fileUrl = ckfinderUrl(fileUrl, $("#ckfinderCurrentFolder").val());
    $("#imgSpan").html("<a href='" + fileUrl + "' target='_blank'>" +
        "<img src='" + fileUrl + "' width='100' height='100' title='点击查看大图'/>" +
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
