<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">查看站内信</span></div>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tr1 tac s3">
            <td align="left" align="left"><b>发信人</b></td>
            <td align="left" align="left">
                <s:if test='%{msg.membername!=null && ""!=msg.membername}'>
                    ${msg.membername }
                </s:if>
                <s:if test='%{msg.membername==null || ""==msg.membername}'>
                    <font color='red'>管理员</font> ${msg.username }
                </s:if>
            </td>
        </tr>
        <tr class="tr1 tac s3">
            <td align="left" align="left"><b>收信人</b></td>
            <td align="left" align="left">
                <s:if test='%{msg.tomembername!=null && ""!=msg.tomembername}'>
                    ${msg.tomembername}
                </s:if>
                <s:if test='%{msg.tomembername==null || ""==msg.tomembername}'>
                    <font color='red'>管理员</font> ${msg.tousername}
                </s:if>
            </td>
        </tr>
        <TR class="tr1 tac s3">
            <td align="left"><b>标题</b>
            </TD>
            <td align="left">
                ${msg.title }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <td align="left"><b>内容</b>
            </TD>
            <td align="left">
                ${msg.content }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <td align="left"><b>已读</b>
            </TD>
            <td align="left">
                ${"1"==msg.isread ?"是":"否"}
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <td align="left"><b>系统站内信</b>
            </TD>
            <td align="left">
                ${"1"==msg.issys ?"是":"否"}
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <td align="left"><b>发送时间</b>
            </TD>
            <td align="left">
                ${msg.addtimeStr }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="center" colspan="10">
                <input type="button" value="返 回" onclick="history.back()" class="button"/>
            </TD>
        </TR>
    </table>
</div>