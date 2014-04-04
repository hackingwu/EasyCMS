<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<input type="hidden" id="id" value="${sensitive.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="99%" align=center>
        <TBODY>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入敏感词
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>敏感词：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=sensitiveword
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=sensitive.sensitiveword value="${sensitive.sensitiveword }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入替换为
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>替换为：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=replaceto
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=sensitive.replaceto value="${sensitive.replaceto }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>

        </TBODY>
    </TABLE>
</DIV>
