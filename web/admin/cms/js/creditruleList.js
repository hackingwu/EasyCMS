//添加
function add() {
    $.weeboxs.open('creditrule_edit.do', {title: '添加积分规则', contentType: 'ajax', height: 330, width: 450,
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
            var rewardtype = "1";
            if (document.getElementById("rewardtype0").checked) {
                rewardtype = "0";
            }
            $.post("creditrule_editDo.do", "creditrule.name=" + $("#name").val()
                    + "&creditrule.code=" + $("#code").val()
                    + "&creditrule.ordernum=" + $("#ordernum").val()
                    + "&creditrule.rewardtype=" + rewardtype
                    + "&creditrule.cycletype=" + document.getElementById("cycletype").value
                    + "&creditrule.cycletime=" + $("#cycletime").val()
                    + "&creditrule.rewardnum=" + $("#rewardnum").val()
                    + "&creditrule.credit=" + $("#credit").val()
                    + "&creditrule.experience=" + $("#experience").val()
                , addComplete, "text");
        }
    });
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('creditrule_edit.do?creditrule.id=' + getCheckOneValue(), {title: '编辑积分规则', contentType: 'ajax', height: 330, width: 450,
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
                var rewardtype = "1";
                if (document.getElementById("rewardtype0").checked) {
                    rewardtype = "0";
                }
                $.post("creditrule_editDo.do", "creditrule.id=" + getCheckOneValue()
                        + "&creditrule.name=" + $("#name").val()
                        + "&creditrule.code=" + $("#code").val()
                        + "&creditrule.ordernum=" + $("#ordernum").val()
                        + "&creditrule.rewardtype=" + rewardtype
                        + "&creditrule.cycletype=" + document.getElementById("cycletype").value
                        + "&creditrule.cycletime=" + $("#cycletime").val()
                        + "&creditrule.rewardnum=" + $("#rewardnum").val()
                        + "&creditrule.credit=" + $("#credit").val()
                        + "&creditrule.experience=" + $("#experience").val()
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
        var rewardtype = "奖励";
        if (document.getElementById("rewardtype0").checked) {
            rewardtype = "惩罚";
        }
        document.getElementById("rewardtype" + id).innerHTML = rewardtype;
        if (0 == document.getElementById("cycletype").value) {
            document.getElementById("cycletype" + id).innerHTML = "一次性";
        }
        else if (1 == document.getElementById("cycletype").value) {
            document.getElementById("cycletype" + id).innerHTML = "每天一次";
        }
        else if (2 == document.getElementById("cycletype").value) {
            document.getElementById("cycletype" + id).innerHTML = "按间隔时间";
        }
        else if (3 == document.getElementById("cycletype").value) {
            document.getElementById("cycletype" + id).innerHTML = "不限制";
        }
        document.getElementById("cycletime" + id).innerHTML = $("#cycletime").val();
        document.getElementById("rewardnum" + id).innerHTML = $("#rewardnum").val();
        document.getElementById("credit" + id).innerHTML = $("#credit").val();
        document.getElementById("experience" + id).innerHTML = $("#experience").val();
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else {
        alert("操作失败，请重试!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("creditrule_del.do", "ids=" + getCheckValue(), delComplete, "text");
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
function cycletypeChange(type) {
    if (2 == type.value) {
        $("#cycletimeTr").fadeIn("slow");
    } else {
        $("#cycletimeTr").fadeOut("slow");
    }
}