function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('role_ajaxEdit.do?role.id=' + getCheckOneValue(), {title: '编辑角色', contentType: 'ajax', height: 120, width: 380,
            onok: function () {
                if ($.trim($("#name").val()) == "") {
                    alert("请输入角色名称!");
                    $("#name").focus();
                    return false;
                }
                //更新数据
                var isok = "1";
                if (document.getElementById("isok0").checked) {
                    isok = "0";
                }
                $.post("role_ajaxEditDo.do", "role.id=" + getCheckOneValue() + "&role.name=" + $("#name").val() + "&role.isok=" + isok, editComplete, "text");
            }
        });
    } else {
        alert("请选择一条记录!");
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
        document.getElementById("isokStr" + id).innerHTML = isok;
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else if (data == "haveName") {
        alert("角色名称已存在!");
        $("#name").focus();
    } else {
        alert("操作失败，请重试!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("role_del.do", "ids=" + getCheckValue(), delComplete, "text");
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
function auth() {
    if (isCheckOne()) {
        $.weeboxs.open('role_auth.do?role.id=' + getCheckOneValue(), {title: '角色授权', contentType: 'ajax', height: 400, width: 600, showButton: false,//不显示按钮栏
            showOk: false,//不显示确定按钮
            showCancel: false//不显示取消按钮
        });
    } else {
        alert("请选择一条记录!");
    }
}
function authAdd() {
    if (isCheck()) {
        $.weeboxs.open('role_authBatch.do?batchType=add&ids=' + getCheckValue(), {title: '角色批量增加权限', contentType: 'ajax', height: 400, width: 600, showButton: false,//不显示按钮栏
            showOk: false,//不显示确定按钮
            showCancel: false//不显示取消按钮
        });
    } else {
        alert("请选择要操作的记录!");
    }
}
function authDel() {
    if (isCheck()) {
        $.weeboxs.open('role_authBatch.do?batchType=del&ids=' + getCheckValue(), {title: '角色批量减少权限', contentType: 'ajax', height: 400, width: 600, showButton: false,//不显示按钮栏
            showOk: false,//不显示确定按钮
            showCancel: false//不显示取消按钮
        });
    } else {
        alert("请选择要操作的记录!");
    }
}
function funcChecked(obj) {
    if (obj.checked) {
        //选中一个菜单
        //$.post("role_funcChecked.do","func.id="+obj.value+"&role.id="+getCheckOneValue()+"&dataLevel="+$("#dataLevel"+obj.value+" option:selected").val(),funcCheckedComplete,"text");
        $.post("role_funcChecked.do", "func.id=" + obj.value + "&role.id=" + getCheckOneValue(), funcCheckedComplete, "text");
    } else {
        //取消选中一个菜单
        $.post("role_funcCheckedNo.do", "func.id=" + obj.value + "&role.id=" + getCheckOneValue(), funcCheckedNoComplete, "text");
    }
}
function funcCheckedComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        //设置需要checked的checkbox
        var ids = msg.split(";");
        if (ids != null && ids.length > 1) {
            $("#console").html(new Date().toLocaleString() + ids[0] + "<br/>" + html);
            for (var i = 1; i < ids.length; i++) {
                if (document.getElementById(ids[i]) != null) {
                    document.getElementById(ids[i]).checked = true;
                }
            }
        }
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}
function funcCheckedNoComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        //设置需要no checked的checkbox
        var ids = msg.split(";");
        if (ids != null && ids.length > 1) {
            $("#console").html(new Date().toLocaleString() + ids[0] + "<br/>" + html);
            for (var i = 1; i < ids.length; i++) {
                if (document.getElementById(ids[i]) != null) {
                    document.getElementById(ids[i]).checked = false;
                }
            }
        }
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}
function buttonChecked(obj) {
    if (obj.checked) {
        //选中一个按钮
        $.post("role_buttonChecked.do", "operbutton.id=" + obj.value + "&role.id=" + getCheckOneValue() + "&dataLevel=" + $("#dataLevel" + obj.func + " option:selected").val(), buttonCheckedComplete, "text");
    } else {
        //取消选中一个按钮
        $.post("role_buttonCheckedNo.do", "operbutton.id=" + obj.value + "&role.id=" + getCheckOneValue(), funcCheckedNoComplete, "text");
    }
}
function buttonCheckedComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        //设置需要checked的checkbox
        var ids = msg.split(";");
        if (ids != null && ids.length > 1) {
            $("#console").html(new Date().toLocaleString() + ids[0] + "<br/>" + html);
            for (var i = 1; i < ids.length; i++) {
                if (document.getElementById(ids[i]) != null) {
                    document.getElementById(ids[i]).checked = true;
                }
            }
        }
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}
function buttonCheckedNoComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        //设置需要no checked的checkbox
        var ids = msg.split(";");
        if (ids != null && ids.length > 1) {
            $("#console").html(new Date().toLocaleString() + ids[0] + "<br/>" + html);
            for (var i = 1; i < ids.length; i++) {
                if (document.getElementById(ids[i]) != null) {
                    document.getElementById(ids[i]).checked = false;
                }
            }
        }
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}
function dataLevelChange(obj) {
    $.post("role_dataLevelChange.do", "func.id=" + obj.func + "&role.id=" + getCheckOneValue() + "&dataLevel=" + obj.value, dataLevelChangeComplete, "text");
}
function dataLevelChangeComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        //设置需要checked的checkbox
        var ids = msg.split(";");
        if (ids != null && ids.length > 1) {
            $("#console").html(new Date().toLocaleString() + ids[0] + "<br/>" + html);
            for (var i = 1; i < ids.length; i++) {
                if (document.getElementById(ids[i]) != null) {
                    document.getElementById(ids[i]).checked = true;
                }
            }
        }
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}
//站点授权
function siteAuth() {
    if (isCheckOne()) {
        $.weeboxs.open('cms/site_auth.do?role.id=' + getCheckOneValue(), {title: '角色站点授权(★代表有管理权限)', contentType: 'ajax', height: 400, width: 600, showButton: false,//不显示按钮栏
            showOk: false,//不显示确定按钮
            showCancel: false//不显示取消按钮
        });
    } else {
        alert("请选择一条记录!");
    }
}