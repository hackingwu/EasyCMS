function auth() {
    if (isCheckOne()) {
        var userid = getCheckOneValue();
        $.weeboxs.open('user_auth.do?user.id=' + userid, {title: '用户授权', contentType: 'ajax', height: 400, width: 300, onok: function () {
            var roles = document.getElementsByName("roleids");
            var ids = "";
            var names = "";
            if (roles != null && roles.length > 0) {
                for (var i = 0; i < roles.length; i++) {
                    if (roles[i].checked) {
                        ids += roles[i].value + ";";
                        names += roles[i].role + ";";
                    }
                }
            }

            $.post("user_authDo.do", "user.id=" + userid + "&roleid=" + ids + "&user.loginname=" + $("#loginnamevalue" + userid).val() + "&rolename=" + names + "&delRoles=" + $("#delRoles").val(), authComplete, "text");

        }});
    } else {
        alert("请选择一条记录!");
    }
}
function authComplete(data) {
    var roleName = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        alert("操作成功!");
        document.getElementById("role" + getCheckOneValue()).innerHTML = roleName;
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else {
        alert("操作失败!");
    }
}


function del() {
    var checkValue = "";
    var names = "";
    var objs = document.getElementsByName("ids");
    if (objs != null && objs.length > 0) {
        for (var i = 0; i < objs.length; i++) {
            if (objs[i].checked) {
                checkValue += objs[i].value + ";";
                names += objs[i].show + ";";
            }
        }
    }
    if (checkValue != "") {
        if (confirm("确定删除操作么?\n注意:删除后无法恢复!")) {
            $.post("user_del.do", "ids=" + checkValue + "&names=" + names, delComplete, "text");
        }
    } else {
        alert("请选择数据!");
    }
}
function delComplete(data) {
    if (data == "1") {
        var ids = getCheckValueArr();
        if (ids != null && ids.length > 0) {
            for (var i = 0; i < ids.length; i++) {
                if (ids[i] != "") {
                    document.getElementById("tr" + ids[i]).parentNode.removeChild(document.getElementById("tr" + ids[i]));
                }
            }
        }
        alert("操作成功!");
    } else {
        alert(data);
    }
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('user_ajaxEdit.do?user.id=' + getCheckOneValue(), {title: '编辑用户', contentType: 'ajax', height: 420, width: 500,
            onok: function () {
                if ($.trim($("#name").val()) == "") {
                    alert("请输入真实姓名!");
                    $("#name").focus();
                    return false;
                }
                if ($.trim($("#email").val()) != ""
                    && !isEmail($("#email").val())) {
                    alert("请输入正确的电子邮箱！");
                    $("#email").focus();
                    return false;
                }
                /*if($.trim($("#question").val())==""){
                 alert("请输入找回密码问题!");
                 $("#question").focus();
                 return false;
                 }
                 if($.trim($("#answer").val())==""){
                 alert("请输入找回密码答案!");
                 $("#answer").focus();
                 return false;
                 }*/
                var sex = "1";
                if (document.getElementById("usersex0").checked) {
                    sex = "0";
                }
                var mail = "0";
                if (document.getElementById("mail1").checked) {
                    mail = "1";
                }
                //成功
                $.post("user_ajaxEditDo.do", "user.id=" + getCheckOneValue() + "&user.loginname=" + $("#loginname").val() + "&user.name=" + $("#name").val() + "&user.sex=" + sex + "&user.ismail=" + mail
                    + "&user.birthday=" + $("#birthday").val() + "&user.tel=" + $("#tel").val() + "&user.mobilephone=" + $("#mobilephone").val() + "&user.email=" + $("#email").val() + "&user.defaultapp="
                    + $("#defaultapp").val() + "&user.question=" + $("#question").val() + "&user.answer=" + $("#answer").val() + "&unitid=" + $("#unitid").val() + "&user.unitNames=" + $("#unitname").val(), editComplete, "text");
            }
        });
    } else {
        alert("请选择一条记录!");
    }
}

function editComplete(data) {
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        alert(msg);
        document.getElementById("name" + getCheckOneValue()).innerHTML = $("#name").val();
        document.getElementById("unitNames" + getCheckOneValue()).innerHTML = $("#unitname").val();
        $.weeboxs.close();
    } else {
        //失败
        alert(msg);
    }
}

var stateval = "1";
function state(s) {
    stateval = s;
    var names = "";
    var checkValue = "";
    var objs = document.getElementsByName("ids");
    if (objs != null && objs.length > 0) {
        for (var i = 0; i < objs.length; i++) {
            if (objs[i].checked) {
                checkValue += objs[i].value + ";";
                names += objs[i].show + ";";
            }
        }
    }
    if (checkValue != "") {
        $.post("user_state.do", "ids=" + checkValue + "&state=" + stateval + "&names=" + names, stateComplete, "text");
    } else {
        alert("请选择数据!");
    }
}
function stateComplete(data) {
    if (data == "1") {
        var ids = getCheckValueArr();
        if (ids != null && ids.length > 0) {
            for (var i = 0; i < ids.length; i++) {
                if (ids[i] != "") {
                    document.getElementById("state" + ids[i]).innerHTML = (stateval == "1" ? "是" : "否");
                }
            }
        }
        alert("操作成功!");
    } else {
        alert(data);
    }
}


function resetPwd() {
    var checkValue = "";
    var names = "";
    var objs = document.getElementsByName("ids");
    if (objs != null && objs.length > 0) {
        for (var i = 0; i < objs.length; i++) {
            if (objs[i].checked) {
                checkValue += objs[i].value + ";";
                names += objs[i].show + ";";
            }
        }
    }
    if (checkValue != "") {
        $.post("user_resetPwd.do", "ids=" + checkValue + "&names=" + names, resetPwdComplete, "text");
    } else {
        alert("请选择数据!");
    }
}
function resetPwdComplete(data) {
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        alert(msg);
    } else {
        alert(data);
    }
}
function unitSelect() {
    var para = "?test=1";
    if (document.getElementById("unitid") != null) {
        para += "&selectUnitIds=" + document.getElementById("unitid").value;
    }
    $.weeboxs.open('unit_select.do' + para, {title: '选择所属部门', contentType: 'ajax', height: 350, width: 300, onok: function () {
        document.getElementById("unitname").value = "";
        document.getElementById("unitid").value = "";
        var units = document.getElementsByName("unitids");
        if (units != null && units.length > 0) {
            for (var i = 0; i < units.length; i++) {
                if (units[i].checked) {
                    document.getElementById("unitname").value = $("#unitids" + units[i].value).attr("unit") + ";";
                    document.getElementById("unitid").value = document.getElementById("unitid").value + units[i].value + ";";
                }
            }
        }
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    }
    });
}
function clearUnit() {
    document.getElementById("unitname").value = "";
    document.getElementById("unitid").value = "";
}