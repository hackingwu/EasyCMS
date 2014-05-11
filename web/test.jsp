<%--<%@ page import="java.util.Locale" %>--%>
<%--&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: flywu_000--%>
<%--Date: 2014/4/12--%>
<%--Time: 18:34--%>
<%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--<title></title>--%>
<%--<script src="js/jquery-1.5.1.min.js"></script>--%>
<%--<script src="js/weebox0.4/bgiframe.js"></script>--%>
<%--<script src="js/weebox0.4/weebox.js"></script>--%>
<%--<link href="js/weebox0.4/weebox.css">--%>
<%--<script type="text/javascript">--%>
<%--function test(){--%>
<%--//alert("test");--%>
<%--$.weeboxs.open('这是直接显示的内容', {title: 'Hello World'});--%>
<%--}--%>
<%--</script>--%>
<%--</head>--%>
<%--<body>--%>
<%--request.getContextPath():<%=request.getContextPath()%>--%>
<%--<br/>--%>
<%--request.getServletPath()<%=request.getServletPath()%>--%>
<%--<br/>--%>
<%--<%=request.getSession().getServletContext().getRealPath("/")%>--%>
<%--<%=Locale.getDefault()%>--%>
<%--<button type="button" onclick="test()">test</button>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <script type="text/javascript" src="js/jquery-1.5.1.js"></script>
</head>
<body>

<ul>
    <li style="position: relative;left:10px">Milk</li>
    <li style="position: relative;left:10px">Bread</li>
    <li style="position: relative;left:10px" class="fade">Chips</li>
    <li style="position: relative;left:10px" class="fade">Socks</li>
</ul>
<%=request.getRemoteAddr()%>
<script>
    $("li").hover(
            function () {
                $(this).animate({left: "+=5"}, 500);
            }, function () {
                $(this).animate({left: "-=5"}, 500);
            }
    );


</script>

</body>
</html>
