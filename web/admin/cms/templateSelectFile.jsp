<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>

<html>
<head>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>

    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>

    <script src="../../js/check.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
    <script type="text/javascript" src="js/templetSelectFile.js">
    </script>
</head>
<body>
<div id="man_zone">
    <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
        <tr>
            <td width="20%" align="left" class="treetd" valign="top">
                <font size="2">${template.name }</font>
                <input type="hidden" id="inputid" value="${inputid }"/>
                <br/>
                <ul id="mixed">
                    <li id="<%=URLEncoder.encode(request.getRealPath("/").replace("\\", "/")+"template/","utf-8")%>${template.id }"
                        class="hasChildren">
			<span><font size="2"><b><a href="#"
                                       onclick="showOne('<%=URLEncoder.encode(request.getRealPath("/").replace("\\", "/")+"template/","utf-8")%>
                                       ${template.id }')">
                根目录</a></b></font>
			</span>
                        ${rootHasSon =='1'?'<ul><li><span  >&nbsp;</span></li></ul>':''}
                    </li>
                </ul>
            </td>
            <td width="70%">

                <iframe width="100%" height="500" id="fileFrame" framespacing="0" border="false"
                        frameborder="0"></iframe>


            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    function initTrees() {
        $("#mixed").treeview({
            url: "template_folderSon.do",
            ajax: {
                data: {
                    "additional": function () {
                        return "yeah: " + new Date;
                    }
                },
                type: "post"
            }
        });
    }
    initTrees();
</script>
</body>
</html>
