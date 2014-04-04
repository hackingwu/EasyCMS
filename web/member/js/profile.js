function delImg() {
    $("#oldImgSpan").fadeOut("slow");
    $("#oldImg").val("");
}
function checkform() {
    if ($("#name").val() == "") {
        alert("请输入名称");
        $("#name").focus();
        return false;
    }
    if ($.trim($("#email").val()) != ""
        && !isEmail($("#email").val())) {
        alert("请输入正确的电子邮箱！");
        $("#email").focus();
        return false;
    }
    if ($.trim($("#intro").val()).length > 200) {
        alert("简介只能在200字以内！");
        $("#intro").focus();
        return false;
    }
    return true;
}