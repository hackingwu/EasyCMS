<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<HTML>
<HEAD>

</HEAD>
<BODY>
<FORM id=MyForm onsubmit="javascript:return WebForm_OnSubmit();"
      method=post name=MyForm action=user_add.do>
    <TABLE cellSpacing=4 cellPadding=4 width="100%" align=left>
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
                          class=colorblur onfocus="this.className='colorfocus';" readonly="readonly"
                          onclick="unitSelect()"
                          maxLength=50 type=text id=unitname name=user.unitNames cols="40"
                          rows="3">${user.unitNames }</textarea>
                <a href="javascript:clearUnit()" title="点击清除所有部门">清除</a>
                <input type="hidden" name="unitid" id="unitid" value="${user.unitIds }"/>
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
                       class=colorblur onfocus="this.className='colorfocus';" readonly="readonly"
                       maxLength=50 type=text name=user.loginname value="${user.loginname }">
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
                       maxLength=50 type=text name=user.name value="${user.name }">
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
                <input type="radio" id="usersex0" name="user.sex" value="0"
                       <s:if test='%{user.sex == "0"}'>checked="checked"</s:if>>女
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
                <input name="user.birthday" id="birthday" value="${user.birthdayStr }" class="Wdate" type="text"
                       size="14" value=""
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
                <INPUT onblur="this.className='colorblur';" id="tel"
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=user.tel value="${user.tel }">
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
                <INPUT onblur="this.className='colorblur';" id="mobilephone"
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=user.mobilephone value="${user.mobilephone }">
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入正确的电子邮箱！
                            src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>电子邮箱：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <INPUT onblur="this.className='colorblur';" id="email"
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=user.email value="${user.email }">
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
                <input type="radio" id="mail1" name="user.ismail" value="1"
                       <s:if test='%{user.ismail == "1"}'>checked="checked"</s:if>>是
                <input type="radio" id="mail0" name="user.ismail" value="0"
                       <s:if test='%{user.ismail != "1"}'>checked="checked"</s:if>>否
            </TD>
        </TR>
        </TBODY>
    </TABLE>

</FORM>
</BODY>
</HTML>

