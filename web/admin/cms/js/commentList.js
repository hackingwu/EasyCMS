function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("comment_del.do", "ids=" + getCheckValue(), delComplete, "text");
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

function state(s) {
    if (isCheck()) {
        $.post("comment_state.do", "ids=" + getCheckValue(), stateComplete, "text");
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
                    document.getElementById("state" + ids[i]).innerHTML = ("已审核");
                }
            }
        }
        alert("操作成功!");
    } else {
        alert(data);
    }
}

