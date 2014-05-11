<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <TITLE>EasyCMS-管理中心</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <script src="../js/jquery-1.5.1.js"></script>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <style>
        a:hover {
            text-decoration: none;
            padding: 20px 0 0 1px

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
<nav class="navbar navbar-default" role="navigation">
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
                <li style="position: relative;left:5px">
                    <a id="funca<s:property value="id"/>"
                       name="funca" ${funcid == bean.id ?"class='active'":"" }
                       onclick="selectFunc('funca<s:property value="id"/>')"
                       href="admin_left.do?funcid=<s:property value="id"/>" target="left">
                        <s:property value="name"/>
                    </a>
                </li>
            </s:iterator>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <li style="position: relative;left:5px"><a href="#"><i class="glyphicon glyphicon-user">
                &nbsp;${loginAdmin.name}</i></a></li>
            <li style="position: relative;left:5px"><a class="text" href="javascript:link('admin_right.do')">系统首页</a>
            </li>
            <li style="position: relative;left:5px"><a class="text" href="javascript:link('user_profile.jsp')">个人设置</a>
            </li>
            <li style="position: relative;left:5px"><a class="text" href="javascript:link('pwd.jsp')">更改密码</a></li>
            <li style="position: relative;left:5px"><a class="text" href="../User_logout.do" target="_top">退出</a>
    </div>
    </li>
    </ul>
    </div>
    </div>
</nav>
<script>
    $("li").hover(
            function () {
                $(this).animate({left: "+=5"}, 400);
            }, function () {
                $(this).animate({left: "-=5"}, 400);
            }
    );
</script>
</BODY>
</HTML>
