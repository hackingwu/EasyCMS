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
</head>
<body>
request.getContextPath():<%=request.getContextPath()%>
   <br/>
request.getServletPath()<%=request.getServletPath()%>
<br/>
<%=request.getSession().getServletContext().getRealPath("/")%>
<%=Locale.getDefault()%>

</body>
</html>
