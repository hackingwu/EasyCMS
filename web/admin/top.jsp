<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <TITLE>EasyCMS-管理中心</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link href="../css/login.css">
    <style>
        a:hover{
            text-decoration: none;
            padding:20px 0 0 1px

        }
    </style>
    <script>
        function link(url) {
            parent.right.location.href = url;
        }
        function selectFunc(id) {
            var funcas = document.getElementsByName("funca");
            if (funcas != null && funcas.length > 0) {
                for (var i = 0; i < funcas.length; i++) {
                    if (funcas[i].id == id) {
                        funcas[i].className = "toptitleSelect";
                    } else {
                        funcas[i].className = "toptitleNoselect";
                    }
                }
            }
        }
    </script>
</HEAD>
<BODY>

<%--<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 class="navbar-inverse">--%>
    <%--<TBODY>--%>
    <%--<TR>--%>
        <%--<TD rowspan="2" align="center" style="HEIGHT: 57px; width:200px;">&nbsp;&nbsp;&nbsp;<img width="180"--%>
                                                                                                 <%--src="../img/logo.png"/>&nbsp;--%>
        <%--</TD>--%>
        <%--<TD colspan="2" style="PADDING-RIGHT: 10px; MARGIN-TOP: 0px; line-height:28px; height:28px; text-align:right;">--%>
            <%--<span class="text">&nbsp;您好:${loginAdmin.name }，欢迎使用 EasyCMS &nbsp;&nbsp;&nbsp;</span>--%>

        <%--</TD>--%>
    <%--</TR>--%>
    <%--<TR>--%>
        <%--<TD>--%>
            <%--<div>--%>
                <%--<s:iterator value="funcList" status="status" id="bean">--%>
                    <%--<a class="text" id="funca<s:property value="id"/>"--%>
                       <%--name="funca" ${funcid == bean.id ?"class='active'":"" }--%>
                       <%--onclick="selectFunc('funca<s:property value="id"/>')"--%>
                       <%--href="admin_left.do?funcid=<s:property value="id"/>" target="left">--%>
                        <%--<s:property value="name"/></a>|--%>
                <%--</s:iterator>--%>
            <%--</div>--%>
        <%--</TD>--%>
        <%--<TD align="right">--%>
            <%--<div>--%>
                <%--<a class="text" href="javascript:link('admin_right.do')">系统首页</a>|--%>
                <%--<a class="text" href="javascript:link('user_profile.jsp')">个人设置</a>|--%>
                <%--<a class="text" href="javascript:link('pwd.jsp')">更改密码</a>|--%>
                <%--<a class="text" href="../login_out.do" target="_top">退出</a></div>--%>
        <%--</TD>--%>
    <%--</TR>--%>
    <%--<TR>--%>
        <%--<TD colspan="3" class="topline"></TD>--%>
    <%--</TR>--%>
    <%--</TBODY>--%>
<%--</TABLE>--%>



<nav class="navbar navbar-default" role="navigation" >
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <span class="navbar-brand">
            <i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;<b>EasyCMS</b>
        </span>
    </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <s:iterator value="funcList" status="status" id="bean">
                <li>
                    <a  id="funca<s:property value="id"/>"
                        name="funca" ${funcid == bean.id ?"class='active'":"" }
                         onclick="selectFunc('funca<s:property value="id"/>')"
                        href="admin_left.do?funcid=<s:property value="id"/>" target="left">
                    <s:property value="name"/>
                </a></li>
                </s:iterator>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><i class="glyphicon glyphicon-user">&nbsp;${loginAdmin.name}</i></a></li>
                <li><a class="text" href="javascript:link('admin_right.do')">系统首页</a></li>
                <li><a class="text" href="javascript:link('user_profile.jsp')">个人设置</a></li>
                <li><a class="text" href="javascript:link('pwd.jsp')">更改密码</a></li>
                <li><a class="text" href="../User_logout.do" target="_top">退出</a></div></li>
            </ul>
        </div>
    </div>
</nav>

</BODY>
</HTML>
