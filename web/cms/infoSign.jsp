<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" href="<%=basePath %>img/style.css" type="text/css"/>
<script src="<%=basePath %>js/cookie.js"></script>
<s:if test='%{"false" != #request.cansign }'>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">

            <TD><b>用户名</b>
                <INPUT onblur="this.className='inputblur';" id=loginname
                       class=inputblur onfocus="this.className='inputfocus';"
                       maxLength=50 size="10" type=text name=loginname value=""/></TD>
            <TD><b>密码</b>
                <INPUT onblur="this.className='inputblur';" id=pwd
                       class=inputblur onfocus="this.className='inputfocus';"
                       maxLength=50 size="10" type=password name=pwd value=""/></TD>
            <TD><input type="button" onclick="infosign()" value="签 收" class="button"/></TD>
        </TR>
    </table>

    <script>
        function infosign() {
            if ($("#loginname").val() == "") {
                alert("请输入用户名");
                $("#loginname").focus();
                return false;
            }
            if ($("#pwd").val() == "") {
                alert("请输入密码");
                $("#pwd").focus();
                return false;
            }
            $.post("info_signDo.do", "info.id=${info.id}&user.loginname=" + $("#loginname").val() + "&user.pwd=" + $("#pwd").val(), infoSignComplete, "text");
        }
        function infoSignComplete(data) {
            if (data.indexOf("操作成功") > -1) {
                alert("操作成功");
                var id = data.replace("操作成功", "");
                $("#issign" + id).html("是");
                var date = new Date();
                $("#signtime" + id).html(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
                $("#ip" + id).html("<%=request.getRemoteAddr()%>");
            } else {
                alert(data);
            }
        }
        if (GetCookie("FreeCMS_infosignLoginName") != null) {
            $("#loginname").val(GetCookie("FreeCMS_infosignLoginName"));
        }
        if (GetCookie("FreeCMS_infosignPwd") != null) {
            $("#pwd").val(GetCookie("FreeCMS_infosignPwd"));
        }
    </script>
</s:if>
<table id="MyDataList" cellspacing="1" cellpadding="1"
       Align="center" border="0" border="0"
       style="width: 100%; word-break: break-all">
    <TR class="summary-title" style="HEIGHT: 25px" align="center">

        <TD><b>签收用户</b></TD>
        <TD><b>是否签收</b></TD>
        <TD><b>签收时间</b></TD>
        <TD><b>签收IP</b></TD>
    </TR>


    <s:iterator value="infosignList" id="bean">
        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" i
            style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">

            <TD style="WIDTH: 120px" align="left">
                <s:property value="name"/>
            </TD>
            <TD style="WIDTH: 120px" align="left" id="issign<s:property value="userId"/>">
                    ${not empty bean.signtime?"是":"否" }
            </TD>
            <TD style="WIDTH: 120px" align="left" id="signtime<s:property value="userId"/>">
                <s:date name="signtime" format="yyyy-MM-dd"/>
            </TD>
            <TD style="WIDTH: 120px" align="left" id="ip<s:property value="userId"/>">
                <s:property value="ip"/>
            </TD>
        </TR>
    </s:iterator>
</table>