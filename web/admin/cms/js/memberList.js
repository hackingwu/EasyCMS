//添加
function add() {
    location.href = "member_edit.do?pageFuncId=" + $("#pageFuncId").val();
}
//编辑
function edit() {
    if (isCheckOne()) {
        location.href = "member_edit.do?member.id=" + getCheckOneValue() + "&pageFuncId=" + $("#pageFuncId").val();
    } else {
        alert("请选择一条记录!");
    }
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("member_del.do", "ids=" + getCheckValue(), delComplete, "text");
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

var isokval = "1";
function isok(s) {
    isokval = s;
    var names = "";
    var objs = document.getElementsByName("ids");
    if (objs != null && objs.length > 0) {
        for (var i = 0; i < objs.length; i++) {
            if (objs[i].checked) {
                names += objs[i].show + ";";
            }
        }
    }
    if (isCheck()) {
        $.post("member_isok.do", "ids=" + getCheckValue() + "&isok=" + isokval + "&names=" + names, isokComplete, "text");
    } else {
        alert("请选择数据!");
    }
}
function isokComplete(data) {
    if (data == "1") {
        var ids = getCheckValueArr();
        if (ids != null && ids.length > 0) {
            for (var i = 0; i < ids.length; i++) {
                if (ids[i] != "") {
                    document.getElementById("isok" + ids[i]).innerHTML = (isokval == "1" ? "是" : "否");
                }
            }
        }
        alert("操作成功!");
    } else {
        alert(data);
    }
}

