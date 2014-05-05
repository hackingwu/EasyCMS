<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>

<html>
<head>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>

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
    <script type="text/javascript" src="js/templetFileManage.js">
    </script>
</head>
<body>
<DIV class=tab>
    <DIV class=tabOn>
        模板文件
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td width="20%" align="left" class="treetd" valign="top">
                    <font size="2">当前管理模板:${templet.name }</font>
                    <br/>
                    <input type="button" value="刷 新" onclick="location.reload();" class="button"/>&nbsp;
                    <input type="button" value="返回模板列表"
                           onclick="location.href='templet_list.do?pageFuncId=${param.pageFuncId }';" class="button"/>
                    <br/>
                    <ul id="mixed">
                        <li id="<%=URLEncoder.encode(request.getRealPath("/").replace("\\", "/")+"templet/","utf-8")%>${templet.id }"
                            class="hasChildren">
			<span><font size="2"><b><a href="#"
                                       onclick="showOne('<%=URLEncoder.encode(request.getRealPath("/").replace("\\", "/")+"templet/","utf-8")%>
                                       ${templet.id }')">根目录</a></b></font>
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
</DIV>
<script type="text/javascript">
    $("#fileFrame").height($(document).height() - 80);
    function initTrees() {
        $("#mixed").treeview({
            url: "templet_folderSon.do",
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
