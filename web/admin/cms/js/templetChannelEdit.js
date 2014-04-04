function save(form) {
    if ($("#name").val() == "") {
        alert("请输入栏目名称");
        $("#name").focus();
        return false;
    }
    form.submit();
}

function delImg() {
    $("#oldImgSpan").fadeOut("slow");
    $("#oldImg").val("");
}
function addSon(channelid, templetid) {
    location.href = "templetChannel_edit.do?templetChannel.parid=" + channelid + "&templet.id=" + templetid;
}
function del(id) {
    if (confirm("确定删除此栏目么?\n注意:删除此栏目将同时删除其子栏目,此操作不可恢复.")) {
        location.href = "templetChannel_del.do?templetChannel.id=" + id;
    }
}
function parButton(id) {
    $.weeboxs.open('templetChannel_templetChannel.do?templet.id=' + $("#templetId").val() + '&templetChannel.id=' + id, {title: '改变所属栏目', contentType: 'ajax', height: 360, width: 300, showOk: false});
}
function showOne(id, name) {
    $.post("templetChannel_par.do", "templetChannel.id=" + $("#templetChannelId").val() + "&templetChannel.parid=" + id, parComplete, "text");
}
function parTemplet(templetid) {
    $.post("templetChannel_par.do", "templetChannel.id=" + $("#templetChannelId").val() + "&templetChannel.templetid=" + templetid, parComplete, "text");
}
function parComplete(data) {
    alert(data);
    if ("操作成功" == data) {
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    }
    parent.location.reload();
}
var templetFileWeeboxs;
function selectTempletFile(templetid, inputid) {
    templetFileWeeboxs = $.weeboxs.open('templet_selectFile.do?inputid=' + inputid + '&templet.id=' + templetid, {title: '选择模板文件', contentType: 'ajax', height: 400, width: 500,
        onok: function () {
        }});
}
function closeWeebox() {
    templetFileWeeboxs.close();
}
//展开关闭描述
function descOpenClose() {
    if ($("#descOpenCloseV").val() == "0") {
        $("#descOpenCloseV").val("1");
        $("#descSpan").text("点击关闭");
        $("#dsecTd").fadeIn("slow");
    } else {
        $("#descOpenCloseV").val("0");
        $("#descSpan").text("点击展开");
        $("#dsecTd").fadeOut("slow");
    }
}
