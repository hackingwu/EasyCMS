function addOperbutton(funcid) {
    if ($.trim($("#name").val()) == "") {
        alert("请输入按钮名称!");
        $("#name").focus();
        return false;
    }
    $("#state").fadeIn("slow");
    var isok = "1";
    if ($("#isok0").attr("checked") == true) {
        isok = "0";
    }
    var data = "pageContentNoFilter=1&operbutton.func=" + funcid + "&operbutton.name=" + $.trim(replaceAll($("#name").val(), "&", "<参数>"))
        + "&operbutton.code=" + $.trim(replaceAll($("#code").val(), "&", "<参数>"))
        + "&operbutton.ordernum=" + $.trim($("#order").val()) + "&operbutton.isok=" + isok;
    $.post("operButton_add.do", data, saveOperbuttonComplete, "text");
}
function saveOperbuttonComplete(data) {
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功则添加一行
        var attr = msg.split("<属性>");
        if (attr != null && attr.length > 1) {
            var str = "<tr id=\"tr" + attr[1] + "\">"
                + "<td >"
                + "<input type=\"text\" value=\"" + $("#name").val() + "\" size=\"8\" id=\"name" + attr[1] + "\" name=\"name" + attr[1] + "\" MAXLENGTH=\"50\" class=\"colorblur\" onfocus=\"this.className='colorfocus';\" onblur=\"this.className='colorblur';\">"
                + "</td>"
                + "<td >"
                + "<input type=\"radio\" id=\"isok" + attr[1] + "1\" name=\"isok" + attr[1] + "\" value=\"1\" checked=\"checked\"/>是"
                + "<input type=\"radio\" id=\"isok" + attr[1] + "0\" name=\"isok" + attr[1] + "\" value=\"1\" " + ($("#isok0").attr("checked") == true ? "checked" : "") + "/>否"
                + "  </td>"
                + "  <td >"
                + "<input type=\"text\" size=\"1\" onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')  value=\"" + $.trim($("#order").val()) + "\" id=\"order" + attr[1] + "\" name=\"order" + attr[1] + "\" MAXLENGTH=\"4\" size=\"2\" class=\"colorblur\" onfocus=\"this.className='colorfocus';\" onblur=\"this.className='colorblur';\">"
                + "  </td>"
                + "   <td >"
                + " <input type=\"text\" size=\"40\" value=\"" + $("#code").val() + "\" id=\"code" + attr[1] + "\" name=\"code" + attr[1] + "\" MAXLENGTH=\"500\" class=\"colorblur\" onfocus=\"this.className='colorfocus';\" onblur=\"this.className='colorblur';\">"
                + "   </td>"
                + "   <td >"
                + " <input type=\"button\" value=\"修改\" onclick=\"updateOperbutton('" + attr[1] + "')\" class=\"button\">"
                + " <input type=\"button\" value=\"删除\" onclick=\"delOperbutton('" + attr[1] + "')\" class=\"button\">"
                + "    </td>"
                + "  </tr>";
            $("#rows").append(str);
        }
        msg = attr[0];
        //清空添加那一行
        $("#name").val("");
        $("#isok1").attr("checked", "true");
        $("#order").val("");
        $("#code").val("");
    }
    $("#state").fadeOut("slow");
    alert(msg);
}

function updateOperbutton(id) {
    if ($.trim($("#name" + id).val()) == "") {
        alert("请输入按钮名称!");
        $("#name" + id).focus();
        return false;
    }
    $("#state").fadeIn("slow");
    var isok = "1";
    if ($("#isok" + id + "0").attr("checked") == true) {
        isok = "0";
    }
    var data = "pageContentNoFilter=1&operbutton.id=" + id + "&operbutton.name=" + $.trim(replaceAll($("#name" + id).val(), "&", "<参数>"))
        + "&operbutton.code=" + $.trim(replaceAll($("#code" + id).val(), "&", "<参数>"))
        + "&operbutton.ordernum=" + $.trim($("#order" + id).val()) + "&operbutton.isok=" + isok;
    $.post("operButton_update.do", data, updateOperbuttonComplete, "text");
}

function updateOperbuttonComplete(data) {
    var msg = data.substr(1, data.length - 1);
    $("#state").fadeOut("slow");
    alert(msg);
}


function delOperbutton(id) {
    if (confirm("确定删除操作按钮么?")) {
        $("#state").fadeIn("slow");
        var data = "pageContentNoFilter=1&operbutton.id=" + id + "&operbutton.name=" + $.trim(replaceAll($("#name" + id).val(), "&", "<参数>"));
        $.post("operButton_del.do", data, delOperbuttonComplete, "text");
    }
}

function delOperbuttonComplete(data) {
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功则删除一行
        var attr = msg.split("<属性>");
        if (attr != null && attr.length > 1) {
            $("#tr" + attr[1]).remove();
        }
        msg = attr[0];
    }
    $("#state").fadeOut("slow");
    alert(msg);
}