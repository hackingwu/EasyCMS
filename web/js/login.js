/**
 * Created by flywu_000 on 2014/4/14.
 */
$(document).ready(function(){
    if (GetCookie("loginName") != null) {
        document.getElementById("RememberMe").checked = true;
    }
    if (GetCookie("loginName") != null)document.getElementById("username").value = GetCookie("loginName");
    if (GetCookie("password") != null)document.getElementById("password").value = GetCookie("password");

});

function RememberMeClick() {
    if (document.getElementById("RememberMe").checked == false) {
    //删除cookie
    DelCookie("loginName");
    DelCookie("password");
    }
    }
function submitForm() {



    if ($.trim($("#username").val()) == "") {
    alert("请输入用户名!");
    $("#username").focus();
        return false;
    }
    if ($.trim($("#password").val()) == "") {
    alert("请输入密码!");
    $("#password").focus();
        return false;
    }
    if ($.trim($("#ValidateCode").val()) == "") {
    alert("请输入验证码!");
    $("#ValidateCode").focus();
        return false;

    }

    if (document.getElementById("RememberMe").checked == true) {
    //设置cookie

    SetCookie("loginName", document.getElementById("username").value, 60 * 60 * 24 * 365);
    SetCookie("password", document.getElementById("password").value, 60 * 60 * 24 * 365);
    }
    return true;

    }


