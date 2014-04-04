<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
</head>
<body>
<DIV class="column" style="width:99%">
    <div class="columntitle">
        建站向导:创建站点 &gt; 选择模板 &gt; <b>站点初始化</b> &gt; 完成
    </div>
    <form action="site_guideInit.do">
        <input type="hidden" name="site.id" value="${site.id }"/>
        <input type="hidden" name="site.indextemplet" value="${site.indextemplet }"/>
        您选择的站点模板有初始化数据，是否对此站点进行初始化?<br/>
        <input type="submit" class="button" value=" 是(推荐) "/>
        <input type="button" class="button" value=" 跳 过 "
               onclick="location.href='site_guideCompleted.do?site.id=${site.id }';"/>
    </form>
</DIV>

</body>
</html>
