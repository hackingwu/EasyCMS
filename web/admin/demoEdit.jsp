<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="../util/checkParentFrame.jsp" %>
<input type="hidden" id="id" value="${demo.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="99%" align=center>
        <TBODY>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入演示
                        src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>演示：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=textdemo
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=demo.textdemo value="${demo.textdemo }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择单选按钮
                        src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>单选按钮：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <input type="radio" value="1" id="radiodemo1" name="radiodemo" ${"0"!=demo.radiodemo?"checked":"" }>是
                <input type="radio" value="0" id="radiodemo0" name="radiodemo"${"0"==demo.radiodemo?"checked":"" }>否
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择复选框
                        src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>复选框：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <input type="checkbox" value="1" id="checkboxdemo1" name="checkboxdemo"
                       <s:if test="%{demo.checkboxdemo.indexOf('1')>-1}">checked</s:if>>是
                <input type="checkbox" value="0" id="checkboxdemo0" name="checkboxdemo"
                       <s:if test="%{demo.checkboxdemo.indexOf('1')>-1}">checked</s:if>>否
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择下拉列表
                        src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>下拉列表：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <select id="selectdemo" name="demo.selectdemo">
                    <option value="1">1
                    <option value="2" ${"2"==demo.selectdemo?"selected":"" }>2
                </select>
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入文本区域
                        src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>文本区域：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <textarea onblur="this.className='colorblur';"
                          class=colorblur onfocus="this.className='colorfocus';"
                          maxLength=50 type=text id=textareademo name=demo.textareademo cols="40"
                          rows="3">${demo.textareademo }</textarea>
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>

        </TBODY>
    </TABLE>
</DIV>
