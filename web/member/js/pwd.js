function WebForm_OnSubmit() {
    if ($("#CurrentPassword").val() == "") {
        alert("请输入当前密码!");
        $("#CurrentPassword").focus();
        return false;
    }
    if ($("#NewPassword").val() == "") {
        alert("请输入新密码!");
        $("#NewPassword").focus();
        return false;
    }
    if ($("#ConfirmNewPassword").val() == "") {
        alert("请重复输入新密码!");
        $("#ConfirmNewPassword").focus();
        return false;
    }
    if ($("#ConfirmNewPassword").val() != $("#NewPassword").val()) {
        alert("两次输入的新密码不一致！请再输入一遍您上面填写的新密码!");
        $("#ConfirmNewPassword").focus();
        return false;
    }
    return true;
}