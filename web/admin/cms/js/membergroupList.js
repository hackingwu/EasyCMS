//添加
function add() {
    location.href = "membergroup_edit.do?pageFuncId=" + $("#pageFuncId").val();
}
//编辑
function edit() {
    if (isCheckOne()) {
        location.href = "membergroup_edit.do?membergroup.id=" + getCheckOneValue() + "&pageFuncId=" + $("#pageFuncId").val();
    } else {
        alert("请选择一条记录!");
    }
}
//授权
function auth() {
    if (isCheckOne()) {
        var groupid = getCheckOneValue();
        $.weeboxs.open('membergroup_auth.do?membergroup.id=' + groupid, {title: '会员组授权', contentType: 'ajax', height: 400, width: 300, onok: function () {
            var auths = document.getElementsByName("authids");
            var ids = "";
            var names = "";
            if (auths != null && auths.length > 0) {
                for (var i = 0; i < auths.length; i++) {
                    if (auths[i].checked) {
                        ids += auths[i].value + ";";
                        names += auths[i].auth + ";";
                    }
                }
            }

            $.post("membergroup_authDo.do", "membergroup.id=" + groupid + "&ids=" + ids + "&names=" + names, authComplete, "text");

        }});
    } else {
        alert("请选择一条记录!");
    }
}
function authComplete(data) {
    var roleName = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        alert("操作成功!");
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else {
        alert("操作失败!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("membergroup_del.do", "ids=" + getCheckValue(), delComplete, "text");
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