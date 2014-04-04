//添加
function add() {
    $.weeboxs.open('question_edit.do', {title: '添加网上调查', contentType: 'ajax', height: 230, width: 450,
        onok: function () {
            if ($.trim($("#name").val()) == "") {
                alert("请输入名称!");
                $("#name").focus();
                return false;
            }
            //成功
            var isok = "1";
            if (document.getElementById("isok0").checked) {
                isok = "0";
            }
            var selecttype = "0";
            if (document.getElementById("selecttype1").checked) {
                selecttype = "1";
            }
            $.post("question_editDo.do", "question.name=" + $("#name").val()
                    + "&question.isok=" + isok
                    + "&question.selecttype=" + selecttype
                    + "&question.detail=" + $("#detail").val()
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('question_edit.do?question.id=' + getCheckOneValue(), {title: '编辑网上调查', contentType: 'ajax', height: 230, width: 450,
            onok: function () {
                if ($.trim($("#name").val()) == "") {
                    alert("请输入名称!");
                    $("#name").focus();
                    return false;
                }
                //成功
                var isok = "1";
                if (document.getElementById("isok0").checked) {
                    isok = "0";
                }
                var selecttype = "0";
                if (document.getElementById("selecttype1").checked) {
                    selecttype = "1";
                }
                $.post("question_editDo.do", "question.id=" + getCheckOneValue()
                        + "&question.name=" + $("#name").val()
                        + "&question.isok=" + isok
                        + "&question.selecttype=" + selecttype
                        + "&question.detail=" + $("#detail").val()
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
        var isok = "是";
        if (document.getElementById("isok0").checked) {
            isok = "否";
        }
        document.getElementById("isok" + id).innerHTML = isok;
        var selecttype = "单选";
        if (document.getElementById("selecttype1").checked) {
            selecttype = "多选";
        }
        document.getElementById("selecttype" + id).innerHTML = selecttype;
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else {
        alert("操作失败，请重试!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("question_del.do", "ids=" + getCheckValue(), delComplete, "text");
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
function answer() {
    $.weeboxs.open('answer.jsp?id=' + getCheckOneValue(), {title: '设置选项', contentType: 'ajax', height: 400, width: 672, showOk: false, showButton: false, showOk: false, showCancel: false});
}