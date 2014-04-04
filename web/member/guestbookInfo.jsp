<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">查看留言</span></div>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tr1 tac s3">
            <td align="left"><b>名称</b></td>
            <td align="left">${guestbook.name }</td>
        </tr>
        <tr class="tr1 tac s3">
            <td align="left"><b>性别</b></td>
            <td align="left">${guestbook.sexStr }</td>
        </tr>
        <TR class="tr1 tac s3">
            <TD align="left"><b>电子邮箱</b>
            </TD>
            <TD align="left">
                ${guestbook.email }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>QQ</b>
            </TD>
            <TD align="left">
                ${guestbook.qq }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left">
                <LABEL id=ctl02_ctl00_label><b>联系电话</b>
            </TD>
            <TD align="left">
                ${guestbook.tel }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>标题</b>
            </TD>
            <TD align="left">
                ${guestbook.title }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>内容</b>
            </TD>
            <TD align="left">
                ${guestbook.content }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>发表时间</b>
            </TD>
            <TD align="left"> ${guestbook.addtimeStr }
            </TD>
        </TR>


        <TR class="tr1 tac s3">
            <TD align="left"><b>IP</b>
            </TD>
            <TD align="left">
                ${guestbook.ip }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>审核状态</b>
            </TD>
            <TD align="left">
                ${guestbook.stateStr }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>回复内容</b>
            </TD>
            <TD align="left">
                ${guestbook.recontent }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>回复时间</b>
            </TD>
            <TD align="left">
                ${guestbook.retimeStr }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>回复人</b>
            </TD>
            <TD align="left">
                ${guestbook.reusername }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="center" colspan="10">
                <input type="button" value="返 回" onclick="history.back()" class="button"/>
            </TD>
        </TR>
    </table>
</div>