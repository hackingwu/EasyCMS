<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
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
        <form action="info_makeHtml.do">
            <input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>
            <input type="hidden" name="info.id" value="${info.id }"/>
            操作成功，请选择需要静态化的内容。<br/>
            <input type="checkbox" name="htmlChannel" value="1" checked/>所属栏目页面静态化<br/>
            <s:if test='%{oldchannelid !=null && oldchannelid!="" && info.channel != oldchannelid}'>
                <input type="hidden" name="oldChannelId" value="${oldchannelid }"/>
                <input type="checkbox" name="htmlChannelOld" value="1" checked/>原所属栏目页面静态化<br/>
            </s:if>
            <input type="checkbox" name="htmlChannelPar" value="1" checked/>所属栏目的所有父栏目页面静态化<br/>
            <input type="checkbox" name="htmlIndex" value="1" checked/>站点首页静态化<br/>

            <input type="submit" value="立即静态化" class="button"/>&nbsp;
            <s:if test='%{"channel"==type}'>
                <input type="button" value="不，我要继续添加信息"
                       onclick="location.href='info_edit.do?channel.id=${info.channel }&pageFuncId=${pageFuncId }'"
                       class="button"/>
            </s:if>
            <s:if test='%{"channel"!=type}'>
                <input type="button" value="不，我要继续添加信息" onclick="location.href='info_edit.do?pageFuncId=${pageFuncId }'"
                       class="button"/>
            </s:if>
        </form>
    </div>

</DIV>

</BODY>
</HTML>

