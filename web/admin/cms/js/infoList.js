function add() {
    alert($("#channelId").val());
    location.href = "info_edit.do?pageFuncId=" + $("#pageFuncId").val() + "&channel.id=" + $("#channelId").val();
}
function edit() {
    if (isCheckOne()) {
        location.href = "info_edit.do?pageFuncId=" + $("#pageFuncId").val() + "&info.id=" + getCheckOneValue();
    } else {
        alert("请选择一条记录!");
    }
}

function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("info_del.do", "ids=" + getCheckValue(), delComplete, "text");
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
function infosign(infoid) {
    $.weeboxs.open('../../info_sign.do?cansign=false&info.id=' + infoid + '&date=' + new Date(),
        {title: '信息签收', contentType: 'ajax', height: 420, width: 450});
}
var action = "copy";
function showOne(id, name) {
    if (confirm("确定操作么?此操作无法回退!")) {
        location.href = "info_" + action + ".do?ids=" + getCheckValue() + "&tochannelid=" + id + "&oldchannelid=" + $("#channelId").val() + "&pageFuncId=" + $("#pageFuncId").val();
    }
}
function parSite(siteid) {
}
function move() {
    action = "move";
    if (isCheck()) {
        $.weeboxs.open('channel_channel.do?channel.id=select',
            {title: '移动到栏目', contentType: 'ajax', height: 360, width: 300, showOk: false});
    } else {
        alert("请选择要操作的记录!");
    }
}
function complete(data) {
    $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    if (data != "") {
        if ("move" == action) {
            var datas = data.split(";");
            if (datas != null && datas.length > 0) {
                for (var i = 0; i < datas.length; i++) {
                    if (datas[i] != "" && document.getElementById("tr" + datas[i]) != null) {
                        document.getElementById("tr" + datas[i]).parentNode.removeChild(document.getElementById("tr" + datas[i]));
                    }
                }
            }
        } else if ("copy" == action) {
            if (data == "succ") {
                alert("操作成功");
            } else {
                alert("操作失败，请重试!");
            }
        }
    }
}
function copy() {
    action = "copy";
    if (isCheck()) {
        $.weeboxs.open('channel_channel.do?channel.id=select',
            {title: '复制到栏目', contentType: 'ajax', height: 360, width: 300, showOk: false});
    } else {
        alert("请选择要操作的记录!");
    }
}
function html() {
    if (isCheck()) {
        location.href = "info_html.do?ids=" + getCheckValue();
    } else {
        alert("请选择要操作的记录!");
    }
}