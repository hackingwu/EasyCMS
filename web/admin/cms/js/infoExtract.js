//选择站点
function selectSite() {
    $.weeboxs.open('site_site.do?type=select', {title: '选择站点', contentType: 'ajax', height: 320, width: 280
    });
}
//选择站点中选择一个站点时触发的事件
function showDetail(id, name, siteid) {
    $.weeboxs.close();
    if (id != $("#siteid").val()) {
        $("#channelid").val("");
        $("#channelname").val("");
    }
    $("#siteid").val(id);
    $("#sitename").val(name);
}
//选择栏目
function selectChannel() {
    if ($("#siteid").val() != "") {
        $.weeboxs.open('channel_channel.do?channel.id=select&channel.site=' + $("#siteid").val(), {title: '选择栏目', contentType: 'ajax', height: 320, width: 280
        });
    } else {
        alert("请先选择站点");
        selectSite();
    }
}
//点击栏目
function showOne(id, name) {
    $.weeboxs.close();
    $("#channelid").val(id);
    $("#channelname").val(name);
}
//提取到栏目
function extract() {
    if (isCheck()) {
        $.weeboxs.open('channel_channel.do?channel.id=select&onclick=extractChannel', {title: '选择栏目', contentType: 'ajax', height: 320, width: 280
        });
    } else {
        alert("请选择要操作的记录!");
    }
}
//点击栏目
function extractChannel(id, name) {
    $.weeboxs.close();
    if (confirm("确定提取操作么?此操作无法回退!")) {
        location.href = "info_extractDo.do?ids=" + getCheckValue() + "&info.channel=" + id;
    }
}