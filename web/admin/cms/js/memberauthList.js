//添加
function add() {
    $.weeboxs.open('memberauth_edit.do', {title: '添加会员权限', contentType: 'ajax', height: 130, width: 450,
        onok: function () {
            if ($.trim($("#code").val()) == "") {
                alert("请输入编码!");
                $("#code").focus();
                return false;
            }
            if ($.trim($("#name").val()) == "") {
                alert("请输入名称!");
                $("#name").focus();
                return false;
            }
            //成功
            $.post("memberauth_editDo.do", "memberauth.name=" + $("#name").val()
                    + "&memberauth.code=" + $("#code").val()
                    + "&memberauth.ordernum=" + $("#ordernum").val()
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('memberauth_edit.do?memberauth.id=' + getCheckOneValue(), {title: '编辑会员权限', contentType: 'ajax', height: 130, width: 450,
            onok: function () {
                if ($.trim($("#code").val()) == "") {
                    alert("请输入编码!");
                    $("#code").focus();
                    return false;
                }
                if ($.trim($("#name").val()) == "") {
                    alert("请输入名称!");
                    $("#name").focus();
                    return false;
                }
                //成功
                $.post("memberauth_editDo.do", "memberauth.id=" + getCheckOneValue()
                        + "&memberauth.name=" + $("#name").val()
                        + "&memberauth.code=" + $("#code").val()
                        + "&memberauth.ordernum=" + $("#ordernum").val()
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
        document.getElementById("name" + id).innerHTML = $("#name").val();
        document.getElementById("code" + id).innerHTML = $("#code").val();
        document.getElementById("ordernum" + id).innerHTML = $("#ordernum").val();
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else {
        alert("操作失败，请重试!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("memberauth_del.do", "ids=" + getCheckValue(), delComplete, "text");
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