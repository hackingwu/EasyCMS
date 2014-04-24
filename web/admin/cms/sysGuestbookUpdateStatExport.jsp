<%@ page language="java" pageEncoding="UTF-8" %>
<%
    response.setCharacterEncoding("GBK");
    response.setContentType("application/download");
    response.setHeader("Content-Disposition", "attachment;fileName=sysGuestbookUpdate.xls");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<HTML>
<BODY style="padding:0;margin:0">

<DIV class="column" style="width:99%">
    <div class="columntitle">
        <b>留言频率列表(留言总量:${sum })</b>
    </div>
    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <b>日期</b>
            </TD>
            <TD>
                <b>留言量</b>
            </TD>
        </TR>

        <s:iterator value="guestbookList" id="obj" status="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">

                <TD align="left">
                    <s:property value="datename"/>
                </TD>
                <TD align="left" id="countnum<s:property value="id"/>">
                    <s:property value="countnum"/>
                </TD>
            </TR>
        </s:iterator>
    </table>

</DIV>

</BODY>
</HTML>

