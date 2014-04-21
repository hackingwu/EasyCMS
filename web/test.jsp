<%@ page import="java.util.Locale" %>
<%--
  Created by IntelliJ IDEA.
  User: flywu_000
  Date: 2014/4/12
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
    <script src="js/jquery-1.5.1.min.js"></script>
    <script src="js/weebox0.4/bgiframe.js"></script>
    <script src="js/weebox0.4/weebox.js"></script>
    <link href="js/weebox0.4/weebox.css">
    <script type="text/javascript">
        function test(){
            //alert("test");
            $.weeboxs.open('这是直接显示的内容', {title: 'Hello World'});
        }
    </script>
</head>
<body>
request.getContextPath():<%=request.getContextPath()%>
   <br/>
request.getServletPath()<%=request.getServletPath()%>
<br/>
<%=request.getSession().getServletContext().getRealPath("/")%>
<%=Locale.getDefault()%>
<button type="button" onclick="test()">test</button>

</body>
</html>
