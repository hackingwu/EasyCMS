<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String checkParentPath = request.getContextPath();
    String checkParentBasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + checkParentPath + "/";
%>
<%-- 正式使用后验证完整url --%>
<script>
    if (window.top.location.href.toLowerCase().indexOf("/admin/index.jsp") == -1) {
        window.top.location.href = "<%=checkParentBasePath%>login.jsp";
    }
</script>
