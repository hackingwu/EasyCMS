<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="../../util/checkParentFrame.jsp" %>
<input type="hidden" id="filePaths" value="${filePaths }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
        <TBODY>

        <TR>
            <TD align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入文件夹名称
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>文件夹名称：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <INPUT onblur="this.className='colorblur';" id=fileName
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=fileName value="${fileName }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>

        </TBODY>
    </TABLE>
</DIV>
