//添加
function add() {
    $.weeboxs.open('sensitive_edit.do', {title: '添加敏感词', contentType: 'ajax', height: 130, width: 400,
        onok: function () {
            if ($.trim($("#sensitiveword").val()) == "") {
                alert("请输入敏感词!");
                $("#sensitiveword").focus();
                return false;
            }
            if ($.trim($("#replaceto").val()) == "") {
                alert("请输入替换为!");
                $("#replaceto").focus();
                return false;
            }
            //成功
            $.post("sensitive_editDo.do", "sensitive.sensitiveword=" + $("#sensitiveword").val()
                    + "&sensitive.replaceto=" + $("#replaceto").val()
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('sensitive_edit.do?sensitive.id=' + getCheckOneValue(), {title: '编辑敏感词', contentType: 'ajax', height: 130, width: 400,
            onok: function () {
                if ($.trim($("#sensitiveword").val()) == "") {
                    alert("请输入敏感词!");
                    $("#sensitiveword").focus();
                    return false;
                }
                if ($.trim($("#replaceto").val()) == "") {
                    alert("请输入替换为!");
                    $("#replaceto").focus();
                    return false;
                }
                //成功
                $.post("sensitive_editDo.do", "sensitive.sensitiveword=" + $("#sensitiveword").val()
                        + "&sensitive.replaceto=" + $("#replaceto").val() + "&sensitive.id=" + $("#id").val()
                    , editComplete, "text");
            }
        });
    } else {
        alert("请选择一条记录!");
    }
}
function addComplete(data) {
    if (data == "succ") {
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
        location.href = location.href;
    } else {
        alert("操作失败，请重试!");
    }
}
function editComplete(data) {
    if (data == "succ") {
        var id = getCheckOneValue();
        document.getElementById("sensitiveword" + id).innerHTML = $("#sensitiveword").val();
        document.getElementById("replaceto" + id).innerHTML = $("#replaceto").val();
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else {
        alert("操作失败，请重试!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("sensitive_del.do", "ids=" + getCheckValue(), delComplete, "text");
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