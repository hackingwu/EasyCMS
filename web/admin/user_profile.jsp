<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css href="../img/style3.css">
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../js/check.js"></script>
    <script type="text/javascript" src="../js/checkAll.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/weebox0.4/weebox.css"/>
    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>

    <script type="text/javascript">
        function WebForm_OnSubmit() {
            if ($.trim($("#name").val()) == "") {
                alert("请输入真实姓名!");
                $("#name").focus();
                return false;
            }
            if ($.trim($("#email").val()) != ""
                    && !isEmail($("#email").val())) {
                alert("请输入正确的电子邮箱！");
                $("#email").focus();
                return false;
            }
            return true;
        }
        var msg = "${msg}";
        if (msg != "") {
            alert(msg);
        }
    </script>

</HEAD>
<BODY>
<%@include file="../util/checkParentFrame.jsp" %>
<FORM id=MyForm onsubmit="javascript:return WebForm_OnSubmit();"
      method=post name=MyForm action=user_profileDo.do>

    <DIV class=tab>
        <DIV class=tabOn>
            个人资料
        </DIV>
        <DIV class=tabOff>
            <A href="pwd.jsp">更改密码</A>
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
                <TD width="30%" align="left">
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
                <TD width="70%" align="left">
                    ${loginAdmin.loginname }
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=输入真实姓名
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>真实姓名：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <INPUT onblur="this.className='colorblur';" id=name
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=user.name value="${loginAdmin.name }">
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择性别
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>性别：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <input type="radio" name="user.sex" value="1" checked="checked">男
                    <input type="radio" name="user.sex" value="0" ${loginAdmin.sex eq "0"?"checked":"" }>女
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=输入出生日期
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>出生日期：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <input name="user.birthday" id="birthday" class="Wdate" type="text" size="14"
                           value="${loginAdmin.birthdayStr }"
                           onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})"/>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=输入联系电话
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>联系电话：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <INPUT onblur="this.className='colorblur';"
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=user.tel value="${loginAdmin.tel }">
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=输入手机
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>手机：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <INPUT onblur="this.className='colorblur';"
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=user.mobilephone value="${loginAdmin.mobilephone }">
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入正确的电子邮箱，密码找回时需要此邮箱地址！
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>电子邮箱：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <INPUT onblur="this.className='colorblur';" id="email"
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=user.email value="${loginAdmin.email }">
                </TD>
            </TR>


            <TR>
                <TD height=30 colSpan=2 align=middle>
                    <INPUT class=button
                           value="修 改" type=submit name=ctl11>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

