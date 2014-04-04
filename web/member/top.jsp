<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<BODY style="margin-top:0px;">
<a href="#" onclick="parent.location.href=parent.location.href">
    <img title="返回会员中心" src="img/logoMember.png" border="0" alt="FreeCMS"></a>
</body>