function addAnswer(questionid) {
    if ($.trim($("#name").val()) == "") {
        alert("请输入选项名称!");
        $("#name").focus();
        return false;
    }
    $("#state").fadeIn("slow");
    var isok = "1";
    if ($("#isok0").attr("checked") == true) {
        isok = "0";
    }
    var isselect = "0";
    if ($("#isselect1").attr("checked") == true) {
        isselect = "1";
    }
    var data = "pageContentNoFilter=1&answer.questionid=" + questionid + "&answer.name=" + $.trim(replaceAll($("#name").val(), "&", "<参数>"))
        + "&answer.ordernum=" + $.trim($("#order").val()) + "&answer.isok=" + isok + "&answer.isselect=" + isselect;
    $.post("answer_add.do", data, saveAnswerComplete, "text");
}
function saveAnswerComplete(data) {
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功则添加一行
        var attr = msg.split("<属性>");
        if (attr != null && attr.length > 1) {
            var str = "<tr id=\"tr" + attr[1] + "\">"
                + "<td >"
                + "<input type=\"text\" value=\"" + $("#name").val() + "\" size=\"30\" id=\"name" + attr[1] + "\" name=\"name" + attr[1] + "\" MAXLENGTH=\"50\" class=\"colorblur\" onfocus=\"this.className='colorfocus';\" onblur=\"this.className='colorblur';\">"
                + "</td>"
                + "<td >"
                + "<input type=\"radio\" id=\"isok" + attr[1] + "1\" name=\"isok" + attr[1] + "\" value=\"1\" checked=\"checked\"/>是"
                + "<input type=\"radio\" id=\"isok" + attr[1] + "0\" name=\"isok" + attr[1] + "\" value=\"0\" " + ($("#isok0").attr("checked") == true ? "checked" : "") + "/>否"
                + "  </td>"
                + "<td >"
                + "<input type=\"radio\" id=\"isselect" + attr[1] + "1\" name=\"isselect" + attr[1] + "\" value=\"1\" checked=\"checked\"/>是"
                + "<input type=\"radio\" id=\"isselect" + attr[1] + "0\" name=\"isselect" + attr[1] + "\" value=\"0\" " + ($("#isselect0").attr("checked") == true ? "checked" : "") + "/>否"
                + "  </td>"
                + "  <td >"
                + "<input type=\"text\" size=\"1\" onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')  value=\"" + $.trim($("#order").val()) + "\" id=\"order" + attr[1] + "\" name=\"order" + attr[1] + "\" MAXLENGTH=\"4\" size=\"2\" class=\"colorblur\" onfocus=\"this.className='colorfocus';\" onblur=\"this.className='colorblur';\">"
                + "  </td>"
                + "   <td >"
                + " 0 "
                + "   </td>"
                + "   <td >"
                + " <input type=\"button\" value=\"修改\" onclick=\"updateAnswer('" + attr[1] + "')\" class=\"button\">"
                + " <input type=\"button\" value=\"删除\" onclick=\"delAnswer('" + attr[1] + "')\" class=\"button\">"
                + "    </td>"
                + "  </tr>";
            $("#rows").append(str);
        }
        msg = attr[0];
        //清空添加那一行
        $("#name").val("");
        $("#isok1").attr("checked", "true");
        $("#isselect0").attr("checked", "true");
        $("#order").val("");
    }
    $("#state").fadeOut("slow");
    alert(msg);
}

function updateAnswer(id) {
    if ($.trim($("#name" + id).val()) == "") {
        alert("请输入选项名称!");
        $("#name" + id).focus();
        return false;
    }
    $("#state").fadeIn("slow");
    var isok = "1";
    if ($("#isok" + id + "0").attr("checked") == true) {
        isok = "0";
    }
    var isselect = "0";
    if ($("#isselect" + id + "1").attr("checked") == true) {
        isselect = "1";
    }
    var data = "pageContentNoFilter=1&answer.id=" + id + "&answer.name=" + $.trim(replaceAll($("#name" + id).val(), "&", "<参数>"))
        + "&answer.ordernum=" + $.trim($("#order" + id).val()) + "&answer.isok=" + isok + "&answer.isselect=" + isselect;
    $.post("answer_update.do", data, updateAnswerComplete, "text");
}

function updateAnswerComplete(data) {
    var msg = data.substr(1, data.length - 1);
    $("#state").fadeOut("slow");
    alert(msg);
}


function delAnswer(id) {
    if (confirm("确定删除么?")) {
        $("#state").fadeIn("slow");
        var data = "pageContentNoFilter=1&answer.id=" + id + "&answer.name=" + $.trim(replaceAll($("#name" + id).val(), "&", "<参数>"));
        $.post("answer_del.do", data, delAnswerComplete, "text");
    }
}

function delAnswerComplete(data) {
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