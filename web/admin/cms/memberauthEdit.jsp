<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<input type="hidden" id="id" value="${memberauth.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="99%" align=center>
        <TBODY>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入会员权限编码
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>会员权限编码：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=code
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=memberauth.code value="${memberauth.code }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入会员权限名称
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>会员权限名称：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=name
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=memberauth.name value="${memberauth.name }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入排列顺序
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>序号：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=ordernum
                       class=colorblur onfocus="this.className='colorfocus';"
                       onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')
                       maxLength=50 type=text name=memberauth.ordernum value="${memberauth.ordernum }">
            </TD>
        </TR>

        </TBODY>
    </TABLE>
</DIV>
