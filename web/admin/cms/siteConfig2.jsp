<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hackingwu
  Date: 14-3-24
  Time: 下午4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@include file="checkSelectSite.jsp" %>
<html>
<head>
    <title></title>
</head>
<body>

<form action="site_configDo.do" enctype="multipart/form-data">
    ID:<input type="text" name="site.id" value="${site.id}"/>
    parId: <input type="text" name="site.parid" value="${site.parid}"/>
    名称:<input type="text" name="site.name" value="${site.name}"/>
    <br/>
    源文件目录名:<input type="text" name="site.sourcepath" value="${site.sourcepath}"/>
    <br/>
    域名:<input type="text" name="site.sitedomain" value="${site.sitedomain}"/>
    <br/>
    排序号:<input type="text" name="site.orderNum" value="${site.orderNum}"/>
    <br/>
    有效:<input type="radio" name="site.state" value="1"
              <s:if test="site==null||site.state==null||site.state==1">checked="checked" </s:if>/>是
    <input type="radio" name="site.state" value="0" <s:if test="site.stata==0"></s:if>/>否
    <br/>
    外部链接:<input type="text" name="site.url" value="${site.url}"/>
    <br/>
    <input type="hidden" id="oldLogo" name="oldLogo" value="${site.logo}"/>
    <s:if test="%{site.logo!=null&&site.logo!=''&&site.logo!='null'}">
        <a href="<%=basePath%>${site.logo}?date=<%=UUID.randomUUID()%>" target="_blank"/>
        <img src="<%=basePath%>${site.logo}?date=<%=UUID.randomUUID()%>" width="180" height="42" title="点击查看大图"/>
    </s:if>

    LOGO:<input type="file" name="logo"/>


    <br/>
    版权:<input type="text" name="site.copyright" value="${site.copyright}"/>
    <br/>
    备案号:<input type="text" name="site.recordcode" value="${site.recordcode}"/>
    <br/>
    <!--htmlquartz-->
    <input type="hidden" name="htmlquartz.id" value="${htmlquartz.id}"/>
    <select name="htmlquartz.type">
        <option value="">无</option>
        <option value="0" ${"0"==htmlquartz.type?"selected":""}>定时生成首页</option>
        <option value="1" ${"1"==htmlquartz.type?"selected":""}>间隔重复生成首页</option>
    </select>
    <!--
             <s:if test="%{'0'==htmlquartz.type}">
                    <select name="htmlquartz.exetimehour">
                            <s:iterator value="hours" id = "obj">
                                    <option value="${obj}" ${obj==htmlquartz.exetimehour?"selected":""}>${obj}</option>
                            </s:iterator>
                    </select>时
                    <select name="htmlquartz.exetimemin">
                        <s:iterator value="mins" id="obj">
                            <option value="${obj}" ${obj==htmlquartz.exetimemin?"selected":""}>${obj}</option>
                        </s:iterator>
                    </select>分
             </s:if>
             -->
    <input type="submit"/>
    <a href="../../site_preview.do?site.id=${site.id}" target="_blank"><input type="button" value="预览"/></a>

</form>
</body>
</html>
