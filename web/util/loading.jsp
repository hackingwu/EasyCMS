<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<center>
    <div id="loading"><img src="<%=basePath %>img/loading.gif"/></div>
</center>
<script>
    window.onload = function () {
        var pageLoad = document.getElementById('loading');
        pageLoad.parentNode.removeChild(pageLoad);
    }
</script>
