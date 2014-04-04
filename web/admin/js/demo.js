//添加
function add() {
    $.weeboxs.open('demo_edit.do', {title: '添加演示', contentType: 'ajax', height: 330, width: 400,
        onok: function () {
            if ($.trim($("#textdemo").val()) == "") {
                alert("请输入演示!");
                $("#textdemo").focus();
                return false;
            }
            if ($.trim($("#textareademo").val()) == "") {
                alert("请输入文本区域!");
                $("#textareademo").focus();
                return false;
            }
            var chk_value = [];
            $('input[name="checkboxdemo"]:checked').each(function () {
                chk_value.push($(this).val());
            });
            //成功
            $.post("demo_editDo.do", "demo.textdemo=" + $("#textdemo").val()
                    + "&demo.textareademo=" + $("#textareademo").val()
                    + "&demo.selectdemo=" + $("#selectdemo  option:selected").val()
                    + "&demo.radiodemo=" + $('input[name="radiodemo"]:checked').val()
                    + "&demo.checkboxdemo=" + chk_value
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('demo_edit.do?demo.id=' + getCheckOneValue(), {title: '编辑演示', contentType: 'ajax', height: 330, width: 400,
            onok: function () {
                if ($.trim($("#textdemo").val()) == "") {
                    alert("请输入演示!");
                    $("#textdemo").focus();
                    return false;
                }
                if ($.trim($("#textareademo").val()) == "") {
                    alert("请输入文本区域!");
                    $("#textareademo").focus();
                    return false;
                }
                var chk_value = [];
                $('input[name="checkboxdemo"]:checked').each(function () {
                    chk_value.push($(this).val());
                });
                //成功
                $.post("demo_editDo.do", "demo.textareademo=" + $("#textareademo").val()
                        + "&demo.textdemo=" + $("#textdemo").val() + "&demo.id=" + $("#id").val()
                        + "&demo.selectdemo=" + $("#selectdemo  option:selected").val()
                        + "&demo.radiodemo=" + $('input[name="radiodemo"]:checked').val()
                        + "&demo.checkboxdemo=" + chk_value
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
        document.getElementById("textdemo" + id).innerHTML = $("#textdemo").val();
        var chk_value = [];
        $('input[name="checkboxdemo"]:checked').each(function () {
            chk_value.push($(this).val());
        });
        document.getElementById("checkboxdemo" + id).innerHTML = chk_value;
        document.getElementById("radiodemo" + id).innerHTML = $('input[name="radiodemo"]:checked').val();
        document.getElementById("selectdemo" + id).innerHTML = $("#selectdemo  option:selected").val();
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else {
        alert("操作失败，请重试!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("demo_del.do", "ids=" + getCheckValue(), delComplete, "text");
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