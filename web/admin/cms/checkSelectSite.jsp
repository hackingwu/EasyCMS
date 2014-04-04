<%@ page language="java" import="java.util.UUID" pageEncoding="UTF-8" %>
<%
    String checkSelectSitePath = request.getContextPath();
    String checkSelectSiteBasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + checkSelectSitePath + "/";
%>
<%-- 检查当前是否选择了站点，如果没有则提示用户并转向站点选择页面 --%>
<s:if test="%{#session.manageSite == null}">
    <script>
        alert("请先选择要管理的站点!");
        location.href = '<%=checkSelectSiteBasePath%>admin/cms/site_site.do?type=siteSelectPage';
    </script>
</s:if>