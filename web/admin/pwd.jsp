<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css
          href="../img/style3.css">
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
</HEAD>
<BODY>
<script type="text/javascript">
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
    var msg = "${msg}";
    if (msg != "") {
        alert(msg);
    }
</script>
<FORM id=MyForm onsubmit="javascript:return WebForm_OnSubmit();"
      method=post name=MyForm action="user_pwd.do">
    <DIV class=tab>
        <DIV class=tabOff>
            <A href="user_profile.jsp">个人资料</A>
        </DIV>
        <DIV class=tabOn>
            更改密码
        </DIV>
        <DIV class=tabOff>
            <A href="adminlink_list.do?adminlink.type=1&pageFuncId=d301815a-1583-4eb9-b1a2-44f1b819cc9d">个人链接</A>
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>
            <TR>
                <TD width="30%">
                    <LABEL id=ctl01_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=管理员登录系统使用的用户名
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>管理员登录名：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%">
                    ${loginAdmin.loginName }
                </TD>
            </TR>
            <TR>
                <TD width="30%">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=输入当前帐号密码
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>当前密码：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD>
                    <INPUT onblur="this.className='colorblur';" id=CurrentPassword
                           class=colorblur onfocus="this.className='colorfocus';" value=""
                           maxLength=50 type=password name=CurrentPassword>
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%">
                    <LABEL id=ctl04_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl04_ctl00_imgHelp tabIndex=-1 alt=输入新密码
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl04_ctl00_lblLabel>新密码：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD>
                    <INPUT onblur="this.className='colorblur';" id=NewPassword
                           class=colorblur onfocus="this.className='colorfocus';" value=""
                           maxLength=50 type=password name=NewPassword>
                    <SPAN>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%">
                    <LABEL id=ctl06_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl06_ctl00_imgHelp tabIndex=-1 alt=重复输入新密码
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl06_ctl00_lblLabel>确认新密码：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD>
                    <INPUT onblur="this.className='colorblur';"
                           id=ConfirmNewPassword class=colorblur
                           onfocus="this.className='colorfocus';" value="" maxLength=50
                           type=password name=ConfirmNewPassword>
                    <SPAN id=ctl07>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD height=30 colSpan=2 align=middle>
                    <INPUT class=button
                           value="修 改" type=submit name=ctl08>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>
