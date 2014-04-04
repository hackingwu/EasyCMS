function typeChange(type) {
    if (1 == type) {
        $("#beginexperienceTr").fadeOut("slow");
    } else {
        $("#beginexperienceTr").fadeIn("slow");
    }
}

//提交验证
function save() {
    if ($("#name").val() == "") {
        alert("请输入名称");
        $("#name").focus();
        return false;
    }
    if (document.getElementById("type0").checked && $("#beginexperience").val() == "") {
        alert("请输入开始经验值");
        $("#beginexperience").focus();
        return false;
    }
    $("#MyForm").submit();
}
function delImg() {
    $("#oldImgSpan").fadeOut("slow");
    $("#oldImg").val("");
}