<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="cn.freeteam.cms.model.Link" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@include file="checkSelectSite.jsp" %>
<input type="hidden" id="id" value="${templetLink.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
        <TBODY>

        <input type="hidden" name="templetLink.templet" id="templetId_edit" value="${templet.id }"/>

        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入链接分类名称
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>链接分类名称：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=name_edit
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=templetLink.name value="${templetLink.name }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>
        <TR ${not empty templetLink.id ?"style='display:none'":""}>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择链接分类类型
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>链接分类类型：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <select name="templetLink.type" id="type_edit">
                    <option value="<%=Link.TYPE_DOWN %>" ${templetLink.type == "1" ?"selected":"" }>下拉</option>
                    <option value="<%=Link.TYPE_IMG %>" ${templetLink.type == "2" ?"selected":"" }>图片</option>
                    <option value="<%=Link.TYPE_TEXT %>" ${templetLink.type == "3" ?"selected":"" }>文字</option>
                </select>
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>

        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入唯一的页面标识
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>页面标识：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=pagemark_edit
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=templetLink.pagemark value="${templetLink.pagemark }">
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择有效性
                            src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>有效：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <input type="radio" name="templetLink.isok" value="1"
                       <s:if test="templetLink==null || templetLink.isok==1">checked="checked"</s:if>>是
                <input type="radio" id="isok0" name="templetLink.isok" value="0"
                       <s:if test="templetLink.isok==0">checked="checked"</s:if> >否
            </TD>
        </TR>
        <TR>
            <TD align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入排序号
                            src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>排序号：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <input type="text" id="ordernum" value="${templetLink.ordernum }" name="templetLink.ordernum"
                       onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')
                       class="colorblur" onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</DIV>
