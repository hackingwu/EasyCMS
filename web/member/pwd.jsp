<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>

<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript" src="js/pwd.js"></script>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">密码设置</span></div>
    <FORM id=MyForm onsubmit="javascript:return WebForm_OnSubmit();"
          method=post name=MyForm action="member_pwd.do">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="tr1 tac s3">
                <td align="left" align="left"><b>登录名</b></td>
                <td align="left" align="left">${loginMember.loginname }</td>
            </tr>
            <TR class="tr1 tac s3">
                <td align="left"><b>当前密码</b>
                </TD>
                <td align="left">
                    <INPUT onblur="this.className='colorblur';" id=CurrentPassword
                           class=colorblur onfocus="this.className='colorfocus';" value=""
                           maxLength=50 type=password name=CurrentPassword>
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR class="tr1 tac s3">
                <td align="left"><b>新密码</b>
                </TD>
                <td align="left">
                    <INPUT onblur="this.className='colorblur';" id=NewPassword
                           class=colorblur onfocus="this.className='colorfocus';" value=""
                           maxLength=50 type=password name=NewPassword>
                    <SPAN>*</SPAN>
                </TD>
            </TR>
            <TR class="tr1 tac s3">
                <td align="left"><b>确认新密码</b>
                </TD>
                <td align="left">
                    <INPUT onblur="this.className='colorblur';"
                           id=ConfirmNewPassword class=colorblur
                           onfocus="this.className='colorfocus';" value="" maxLength=50
                           type=password name=ConfirmNewPassword>
                    <SPAN id=ctl07>*</SPAN>
                </TD>
            </TR>
            <TR class="tr1 tac s3">
                <td align="center" colspan="10">
                    <input type="submit" value="修 改" class="button"/>
                </TD>
            </TR>
        </table>
</div>