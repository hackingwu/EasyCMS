<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>FreeCMS-会员登录</title>
    <script src="js/jquery-1.5.1.min.js"></script>
    <script src="js/cookie.js"></script>
    <script language="JavaScript">
        if (window.top != self) {
            window.top.location = self.location;
        }

    </script>
    <link rel="stylesheet" href="img/style.css" type="text/css"/>
    <link rel="stylesheet" href="img/style2.css" type="text/css"/>
</head>
<style type="text/css">
    body {
        margin: 20px auto auto 6px;
        text-align: center;
        padding: 0;
        line-height: 22px;
    }

    img {
        border: 0
    }

    .tip {
        padding: 4px 0 6px 46px;
        color: #999;
    }

    #Logo {
        width: 760px;
        margin: auto;
        text-align: left;
    }

    #Logo .lg {
        position: absolute;
        top: 22px
    }

    #Logo .nav {
        float: right;
        margin-right: 5px;
        color: #1A82D2
    }

    #Main {
        width: 770px;
        margin: auto;
        text-align: center;
    }

    #Bot {
        width: 750px;
        clear: both;
        margin: auto;
        text-align: center;
        line-height: 18px;
        border-top: 1px solid #DADADA;
        padding-top: 13px;
        margin-top: 25px;
    }

    #Bot a {
        color: #494949;
    }

    #Banner {
        width: 503px;
        height: 170px;
        float: left;
        margin-top: 30px;
    }

    #Banner .conn_left {
        float: left;
        width: 3px;
        height: 170px;
        background: #208DE1
    }

    #Banner .conn_img {
        margin-top: 164px;
    }

    #Banner .index_banner {
        float: left;
        background: #208DE1;
        width: 216px;
        height: 170px;
    }

    #Banner .index_bg {
        float: left;
        background: url(img/index_login_bg.gif) repeat-y;
        width: 280px;
        height: 145px !important;
        height /**/: 170px;
        padding: 25px 0 0 4px;
        font: normal 12px tahoma;
        line-height: 24px;
        text-align: left;
        color: #2A58A6;
    }

    #Banner .color {
        clear: both;
        width: 503px;
        height: 16px;
        background: #D4ECFF;
        border-top: 2px solid #fff;
    }

    #Banner ul {
        list-style: none;
        margin: 12px 0 0 6px;
    }

    #Banner ul li {
        text-align: left;
        height: 48px;
    }

    .txt {
        color: #1274BA;
    }

    .txt_ {
        font-family: tahoma;
    }

    .txt1 {
        color: #F86B2D;
    }

    .txt2 {
        font-size: 11px !important;
        font-size /**/: 8pt;
        font-family: tahoma;
    }

    .left {
        float: left;
    }

    .right {
        float: right;
    }

    #Login {
        width: 255px;
        float: left;
        font-family: tahoma;
        color: #494949
    }

    #Login .top {
        height: 4px;
        background: url(img/login_top_bg.gif) repeat-x;
    }

    #Login .login_bg {
        height: 310px;
        background: #F6F6F6;
        border-right: 1px solid #8A8A8A;
        border-left: 1px solid #8A8A8A;
    }

    #Login .lg_title {
        text-align: left;
        height: 23px;
        margin: 0 11px 0px 11px;
        padding-top: 3px;
        padding-left: 4px;
        border-bottom: 1px solid #B5B5B5;
    }

    #Login .lg_title1 {
        text-align: left;
        margin: 5px 11px;
        padding-top: 3px;
        padding-left: 4px;
        border-bottom: 1px solid #B5B5B5;
    }

    #Login .lg_title2 {
        text-align: left;
        margin: 0 11px;
        padding-top: 3px;
        padding-left: 4px;
        color: #ff0000;
    }

    #Login .input_id {
        text-align: left;
        margin: 0px 0 0 26px;
    }

    #Login .input_pwd {
        text-align: left;
        margin: 6px 0 0 26px;
    }

    #Login .input_vc {
        text-align: left;
        margin: 6px 0 0 14px;
    }

    #Login .input_post {
        text-align: left;
        margin: 8px 0 0 75px;
    }

    #Login .input_fpwd {
        text-align: left;
        margin: 5px 0 0 32px;
    }

    #Login .bottom {
        height: 4px;
        background: url(img/login_bottom_bg.gif) repeat-x;
    }

    #Login .intro_txt {
        color: #959595;
        text-align: left;
        margin-left: 62px;
    }

    #Login .txt3 {
        text-align: left;
        margin: 10px 0 0 22px;
        clear: both
    }

    .input_n {
        width: 110px;
        height: 15px !important;
        height /**/: 20px;
        border-style: inset;
        padding: 2px 0 0 2px;
        font: normal 12px tahoma;
    }

    .input_s {
        width: 62px;
        height: 27px;
        padding-top: 2px;
        font-weight: bold;
        border-style: outset;
    }

    #Right {
        margin-top: 30px;
        float: left;
        width: 12px;
        height: 170px;
        background: #A5D3F7;
    }

    #Right .color {
        margin-top: 170px;
        width: 12px;
        height: 16px;
        background: #D4ECFF;
        border-top: 2px solid #fff;
    }
</style>
<body>
<form id="fm1" class="fm-v clearfix" action="member_login.do" method="post" onsubmit="return submitForm()">
    <div id="Logo">
        <div style="float:left">
            <div class="lg"><img width="165" src="img/logo.png" border="0"/></div>
            <br/></div>
        <div class="nav"></div>
        <div style="clear:both"></div>
    </div>
    <div id="Main">

        <jsp:include page="inc/banner.jsp"></jsp:include>
        <div id="Login">
            <div class="top">
                <div class="left"><img src="img/login_conn_left.gif" width="4" height="4"/></div>
                <div class="right"><img src="img/login_conn_right.gif" width="4" height="4"/></div>
            </div>
            <div class="login_bg">
                <div>
                </div>


                <div class="lg_title"><b class="txt">会员登录</b></div>
                <div class="lg_title2"><span id="MessageLabel"
                                             style="display:inline-block;width:100%;font-size:12px;text-align:center">
			<font color="red"><b></b></font>
			</span><br/></div>

                <div class="input_pwd">用户名:


                    <input id="username" name="member.loginname" class="colorblur" tabindex="1" accesskey="n"
                           type="text" value="" size="25" autocomplete="false"/>

                    <span id="RequiredFieldValidator1" style="color:Red;">*</span>
                    <span id="ctl01" style="color:Red;display:none;">*</span></div>

                <div class="input_pwd">密　码:
                    <input id="password" name="member.pwd" class="colorblur" tabindex="2" accesskey="p" type="password"
                           value="" size="25" autocomplete="off"/>
                    <span id="ctl02" style="color:Red;">*</span>
                </div>
                <div class="input_pwd">验证码:
                    <input id="ValidateCode" name="ValidateCode" class="colorblur" tabindex="2" accesskey="p"
                           type="text" value="" size="5" maxlength="4" autocomplete="off"/>
                    <img src="image.jsp" title="点击重新获取验证码" style="cursor:hand"
                         onclick="this.src='image.jsp?date='+new Date();"/>
                    <span id="ctl02" style="color:Red;">*</span>
                </div>

                <div class="input_post">
                    <input class="button" name="submit" accesskey="l" value="登 录" tabindex="4" type="submit"/>
                    <a href="findPwd.jsp">忘记密码?</a>

                </div>
                <div class="input_fpwd"><input id="RememberMe" type="checkbox" name="RememberMe"
                                               onclick="RememberMeClick()"/><label for="RememberMe">在此计算机上保留登录帐号</label>
                </div>

                <script>
                    if (GetCookie("FreeCMS_memberLoginName") != null && GetCookie("FreeCMS_memberLoginName") != "") {
                        document.getElementById("RememberMe").checked = true;
                    }
                    if (GetCookie("FreeCMS_memberLoginName") != null)document.getElementById("username").value = GetCookie("FreeCMS_memberLoginName");
                    function RememberMeClick() {
                        if (document.getElementById("RememberMe").checked == false) {
                            //删除cookie
                            DelCookie("FreeCMS_memberLoginName");
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
                            SetCookie("FreeCMS_memberLoginName", document.getElementById("username").value, 60 * 60 * 24 * 365);
                        }
                        return true;
                    }
                    $("#username").focus();
                </script>
                <div class="lg_title1"></div>
                <div class="txt3">
                    <jsp:include page="util/sysInfo.jsp"></jsp:include>
                </div>


                <div>

                </div>


            </div>
            <div class="bottom">
                <div class="left"><img src="img/login_conn_left_b.gif" width="4" height="4"/></div>
                <div class="right"><img src="img/login_conn_right_b.gif" width="4" height="4"/></div>
            </div>
        </div>
        <div style="clear:both"></div>
    </div>
    <jsp:include page="inc/foot.jsp"></jsp:include>
</body>
</form>
</html>
 
 
               
	            

