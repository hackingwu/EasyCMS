//发送
function send() {
    location.href = "msg_send.do?pageFuncId=" + $("#pageFuncId").val();
}
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("msg_del.do", "ids=" + getCheckValue(), delComplete, "text");
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