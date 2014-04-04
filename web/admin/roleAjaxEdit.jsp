<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../util/checkParentFrame.jsp" %>
<input type="hidden" id="id" value="${role.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
        <TBODY>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入角色名称
                        src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>角色名称：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=name
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=role.name value="${role.name }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>

        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择有效性
                            src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>有效：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <input type="radio" name="role.isok" value="1" <s:if test="role.isok==1">checked="checked"</s:if>>是
                <input type="radio" id="isok0" name="role.isok" value="0"
                       <s:if test="role.isok==0">checked="checked"</s:if> >否
            </TD>
        </TR>

        </TBODY>
    </TABLE>
</DIV>
