<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <TITLE>EasyCMS-管理中心</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <link rel="stylesheet" href="../img/style2.css" type="text/css"/>
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
<BODY style="margin-top:0px;">

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD rowspan="2" align="center" style="HEIGHT: 57px; width:200px;">&nbsp;&nbsp;&nbsp;<img width="180"
                                                                                                 src="../img/logo.png"/>&nbsp;
        </TD>
        <TD colspan="2" style="PADDING-RIGHT: 10px; MARGIN-TOP: 0px; line-height:28px; height:28px; text-align:right;">
            &nbsp;您好:${loginAdmin.name }，欢迎使用 EasyCMS &nbsp;&nbsp;&nbsp;

        </TD>
    </TR>
    <TR>
        <TD>
            <div id="navigation" class="toptitle">
                <s:iterator value="funcList" status="status" id="bean">
                    <a id="funca<s:property value="id"/>"
                       name="funca" ${funcid == bean.id ?"class='toptitleSelect'":"" }
                       onclick="selectFunc('funca<s:property value="id"/>')"
                       href="admin_left.do?funcid=<s:property value="id"/>" target="left">
                        <s:property value="name"/></a>|
                </s:iterator>
            </div>
        </TD>
        <TD align="right">
            <div class="toptitle_r"><a href="javascript:link('admin_right.do')">系统首页</a>|
                <a href="javascript:link('user_profile.jsp')">个人设置</a>|
                <a href="javascript:link('pwd.jsp')">更改密码</a>|
                <A href="../login_out.do" target="_top">退出</a></div>
        </TD>
    </TR>
    <TR>
        <TD colspan="3" class="topline"></TD>
    </TR>
    </TBODY>
</TABLE>
</BODY>
</HTML>
