<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>

<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css href="../img/style3.css">
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>

</HEAD>
<BODY>
<input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>

<DIV class=tab>
    <DIV class=tabOn>
        站内信详细
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
        <TBODY>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1
                        src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>发信人：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <s:if test='%{msg.membername!=null && ""!=msg.membername}'>
                    ${msg.membername }
                </s:if>
                <s:if test='%{msg.membername==null || ""==msg.membername}'>
                    <font color='red'>管理员</font> ${msg.username }
                </s:if>
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1
                        src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>收信人：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <s:if test='%{msg.tomembername!=null && ""!=msg.tomembername}'>
                    ${msg.tomembername}
                </s:if>
                <s:if test='%{msg.tomembername==null || ""==msg.tomembername}'>
                    <font color='red'>管理员</font> ${msg.tousername}
                </s:if>
            </TD>
        </TR>

        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1
                            src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>标题：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                ${msg.title }
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1
                            src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>内容：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                ${msg.content }
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1
                            src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>已读：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                ${"1"==msg.isread ?"是":"否"}
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1
                            src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>系统站内信：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                ${"1"==msg.issys ?"是":"否"}
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1
                            src="../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>发送时间：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                ${msg.addtimeStr }
            </TD>
        </TR>
        <TR>
            <TD height=30 colSpan=2 align=middle>
                <input type="button" onclick="history.back()" value="返 回" class="button"/>
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</DIV>

</BODY>
</HTML>

