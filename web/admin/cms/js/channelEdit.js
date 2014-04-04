function save(form) {
    if ($("#name").val() == "") {
        alert("请输入栏目名称");
        $("#name").focus();
        return false;
    }

}

function delImg() {
    $("#oldImgSpan").fadeOut("slow");
    $("#oldImg").val("");
}
function addSon(channelid, siteid) {
    location.href = "channel_edit.do?channel.parid=" + channelid + "&site.id=" + siteid;
}
function del(id) {
    if (confirm("确定删除此栏目么?\n注意:删除此栏目将同时删除其子栏目,此操作不可恢复.")) {
        location.href = "channel_del.do?channel.id=" + id;
    }
}
function parButton(id) {
    $.weeboxs.open('channel_channel.do?channel.id=' + id, {title: '改变所属栏目', contentType: 'ajax', height: 360, width: 300, showOk: false});
}
function showOne(id, name) {
    $.post("channel_par.do", "channel.id=" + $("#channelId").val() + "&channel.parid=" + id, parComplete, "text");
}
function parSite(siteid) {
    $.post("channel_par.do", "channel.id=" + $("#channelId").val() + "&channel.site=" + siteid, parComplete, "text");
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

function htmlquartzTypeChange(obj) {
    if ("" == obj.value) {
        $("#exetimeTd").fadeOut("slow");
        $("#intervalTd").fadeOut("slow");
    } else if ("0" == obj.value) {
        $("#exetimeTd").fadeIn("slow");
        $("#intervalTd").fadeOut("slow");
    } else if ("1" == obj.value) {
        $("#exetimeTd").fadeOut("slow");
        $("#intervalTd").fadeIn("slow");
    }
}
function intervalTypeChange(obj) {
    if ("" == obj.value) {
        $("#intervalhourTd").fadeOut("slow");
        $("#intervalminTd").fadeOut("slow");
    } else if ("0" == obj.value) {
        $("#intervalhourTd").fadeIn("slow");
        $("#intervalminTd").fadeOut("slow");
    } else if ("1" == obj.value) {
        $("#intervalhourTd").fadeOut("slow");
        $("#intervalminTd").fadeIn("slow");
    }
}