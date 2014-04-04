function siteChange() {
    $("#MyForm").submit();
}
//选择或取消选择一个站点
function check(id, name, obj) {
    if (obj.checked) {
        //选中一个
        $.post("channel_authChecked.do", "channel.id=" + id + "&wasUser=" + $("#wasUser").val(), channelCheckedComplete, "text");
    } else {
        //取消选中一个
        $.post("channel_authCheckedNo.do", "channel.id=" + id + "&wasUser=" + $("#wasUser").val(), channelCheckedNoComplete, "text");
    }
}

function channelCheckedComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        $("#console").html(new Date().toLocaleString() + msg + "<br/>" + html);
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}
function channelCheckedNoComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        $("#console").html(new Date().toLocaleString() + msg + "<br/>" + html);
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}