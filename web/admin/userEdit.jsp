<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css href="../img/style3.css">
    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js" defer="defer"></script>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../js/check.js"></script>
    <script type="text/javascript" src="../js/checkLoginName.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/weebox0.4/weebox.css"/>

    <script type="text/javascript">
        function WebForm_OnSubmit() {
            if ($.trim($("#loginname").val()) == "") {
                alert("请输入管理员登录名!");
                $("#loginname").focus();
                return false;
            }
            if ($("#pwd").val() == "") {
                alert("请输入管理员登录密码!");
                $("#pwd").focus();
                return false;
            }
            if ($("#repwd").val() == "") {
                alert("请输入确认登录密码!");
                $("#repwd").focus();
                return false;
            }
            if ($("#repwd").val() != $("#pwd").val()) {
                alert("确认登录密码与登录密码不一致，请重新输入!");
                $("#repwd").focus();
                return false;
            }
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
            MyForm.submit();
        }
        function roleSelect() {
            var para = "";
            $.weeboxs.open('role_select.do' + para, {title: '选择角色进行授权', contentType: 'ajax', height: 350, width: 300, onok: function () {
                document.getElementById("rolename").value = "";
                document.getElementById("roleid").value = "";
                var roles = document.getElementsByName("roleids");
                if (roles != null && roles.length > 0) {
                    for (var i = 0; i < roles.length; i++) {
                        if (roles[i].checked) {
                            document.getElementById("rolename").value = $("#roleids" + roles[i].value).attr("role") + ";";
                            document.getElementById("roleid").value = document.getElementById("roleid").value + roles[i].value + ";";
                        }
                    }
                }
                $.weeboxs.close();//增加事件方法后需手动关闭弹窗
            }
            });
        }
        function clearRole() {
            document.getElementById("rolename").value = "";
            document.getElementById("roleid").value = "";
        }
        function unitSelect() {
            var para = "?test=1";
            if (document.getElementById("unitid") != null) {
                para += "&selectUnitIds=" + document.getElementById("unitid").value;
            }
            $.weeboxs.open('unit_select.do' + para, {title: '选择所属部门', contentType: 'ajax', height: 350, width: 300, onok: function () {
                document.getElementById("unitname").value = "";
                document.getElementById("unitid").value = "";
                var units = document.getElementsByName("unitids");
                if (units != null && units.length > 0) {
                    for (var i = 0; i < units.length; i++) {
                        if (units[i].checked) {
                            document.getElementById("unitname").value = $("#unitids" + units[i].value).attr("unit") + ";";
                            document.getElementById("unitid").value = document.getElementById("unitid").value + units[i].value + ";";
                        }
                    }
                }
                $.weeboxs.close();//增加事件方法后需手动关闭弹窗
            }
            });
        }
        function clearUnit() {
            document.getElementById("unitname").value = "";
            document.getElementById("unitid").value = "";
        }
    </script>

</HEAD>
<BODY>
<%@include file="../util/checkParentFrame.jsp" %>
<FORM id=MyForm onsubmit="javascript:return WebForm_OnSubmit();"
      method=post name=MyForm action=user_add.do>
<input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>

<DIV class=tab>
    <DIV class=tabOn>
        添加用户
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
<TABLE cellSpacing=4 cellPadding=4 width="90%">
<TBODY>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=点击选择所属部门
                    src="../img/help.gif"/>
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>部门：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <textarea onblur="this.className='colorblur';" title="点击选择所属部门" style="cursor:hand"
                  class=colorblur onfocus="this.className='colorfocus';" readonly="readonly" onclick="unitSelect()"
                  maxLength=50 type=text id=unitname name=user.unitNames cols="40" rows="3"></textarea>
        <a href="javascript:clearUnit()" title="点击清除所有部门">清除</a>
        <input type="hidden" name="unitid" id="unitid"/>
    </TD>
</TR>
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
        <INPUT onblur="this.className='colorblur';" id=loginname
               class=colorblur onfocus="this.className='colorfocus';" oninput="checkLoginName(this)"
               maxLength=50 type=text name=user.loginname value="" onpropertychange="checkLoginName(this)">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl01_ctl00_imgHelp tabIndex=-1 alt=管理员登录系统使用的密码
                    src="../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>管理员登录密码：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=pwd type="password"
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=user.pwd value="">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl01_ctl00_imgHelp tabIndex=-1 alt=再输入一次管理员登录系统使用的密码
                    src="../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>确认登录密码：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=repwd type="password"
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text value="">
        <SPAN id=ctl03>*</SPAN>
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
               maxLength=50 type=text name=user.name value="">
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
        <input type="radio" name="user.sex" value="0">女
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
        <input name="user.birthday" id="birthday" class="Wdate" type="text" size="14" value=""
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
               maxLength=50 type=text name=user.tel value="">
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
               maxLength=50 type=text name=user.mobilephone value="">
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
               maxLength=50 type=text name=user.email value="">
    </TD>
</TR>

<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=点击选择角色进行授权
                    src="../img/help.gif"/>
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>角色：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <textarea onblur="this.className='colorblur';" title="点击选择角色进行授权" style="cursor:hand"
                  class=colorblur onfocus="this.className='colorfocus';" readonly="readonly" onclick="roleSelect()"
                  maxLength=50 type=text id=rolename name=user.roleNames cols="40" rows="3"></textarea>
        <a href="javascript:clearRole()" title="点击清除所有角色">清除</a>
        <input type="hidden" name="roleid" id="roleid"/>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择是否接收互动信件
                    src="../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>是否接收互动信件：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="radio" name="user.ismail" value="1">是
        <input type="radio" name="user.ismail" value="0" checked="checked">否
    </TD>
</TR>
<TR>
    <TD height=30 colSpan=2 align=middle>
        <fs:operButtons/>
    </TD>
</TR>
</TBODY>
</TABLE>
</DIV>

</FORM>
</BODY>
</HTML>

