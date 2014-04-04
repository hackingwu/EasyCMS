<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<div class="tipcnt mb10">
    <div class="title b">欢迎进入FreeCMS会员中心</div>
    <div class="tis">
        <script>
            var hour = (new Date()).getHours();
            if (hour < 4) {
                hello = "夜深了，";
            }
            else if (hour < 7) {
                hello = "早安，";
            }
            else if (hour < 9) {
                hello = "早上好，";
            }
            else if (hour < 12) {
                hello = "上午好，";
            }
            else if (hour < 14) {
                hello = "中午好，";
            }
            else if (hour < 17) {
                hello = "下午好，";
            }
            else if (hour < 19) {
                hello = "您好，";
            }
            else if (hour < 22) {
                hello = "晚上好，";
            }
            else {
                hello = "夜深了，";
            }
            document.write(hello);
        </script>
        ${loginMember.loginname }

        <div class="tipcnt">
            <div class="title">
                <span class="f12 fr"></span>
                <span class="b">您的账户信息</span></div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="tr1 tac s3">
                    <td width="100" align="left"><b>登录名</b></td>
                    <td width="*" align="left">${loginMember.loginname }</td>
                </tr>
                <tr class="tr1 tac s3">
                    <td width="100" align="left"><b>真实姓名</b></td>
                    <td width="*" align="left">${loginMember.name }</td>
                </tr>
                <tr class="tr1 tac s3">
                    <td width="100" align="left"><b>等级</b></td>
                    <td width="*" align="left"><font color="${loginMember.groupcolor }">${loginMember.groupname }</font>
                    </td>
                </tr>
                <tr class="tr1 tac s3">
                    <td width="100" align="left"><b>经验</b></td>
                    <td width="*" align="left">${loginMember.experience }</td>
                </tr>
                <tr class="tr1 tac s3">
                    <td width="100" align="left"><b>积分</b></td>
                    <td width="*" align="left">${loginMember.credit }</td>
                </tr>
                <tr class="tr1 tac s3">
                    <td width="100" align="left"><b>上次登录时间</b></td>
                    <td width="*" align="left">${loginMember.lastlogintimeStr }</td>
                </tr>
            </table>
        </div>
    </div>
</div>