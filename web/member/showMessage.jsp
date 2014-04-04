<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<div class="tipcnt mb10">
    <div class="title b">信息提示</div>
    <div class="tis">

        ${showMessage }
        <br/>
        <s:set name="forwardUrl" value="#request.forwardUrl"/>
        <s:if test='%{#request.forwardUrl!=""}'>
            <script>setTimeout("window.location.href ='${forwardUrl}';", 1000 *${forwardSeconds});</script>
            </p>
            <a href="${forwardUrl}">页面跳转中...</a>
        </s:if>
        <br/>
        <a href="javascript:history.go(-1);">返回上一页</a> | <a href="<%=basePath %>/member/right.jsp">返回会员中心</a>
    </div>
</div>
