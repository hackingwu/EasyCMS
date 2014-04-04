<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="<%=basePath %>img/style.css">
    <LINK rel=stylesheet type=text/css href="<%=basePath %>img/style3.css">
</HEAD>
<BODY>

<DIV class="column">
    <div class="columntitle">
        信息提示
    </div>
    <div style="text-align:left">
        ${showMessage }
        <br/>
        <s:set name="forwardUrl" value="#request.forwardUrl"/>
        <s:if test='%{#request.forwardUrl!=""}'>
            <script>setTimeout("window.location.href ='${forwardUrl}';", 1000 *${forwardSeconds});</script>
            </p>
            <a href="${forwardUrl}">页面跳转中...</a>
        </s:if>
        <br/>
        <a href="javascript:history.go(-1);">返回上一页</a> | <a href="<%=basePath %>admin/admin_right.do">返回首页</a>
    </div>

</DIV>

</BODY>
</HTML>

