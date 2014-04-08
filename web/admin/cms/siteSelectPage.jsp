<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">

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
    </script>
    </head >
    <body>
    <DIV class = tab>
            <DIV class = tabOn>
            选择站点
            </DIV>

            <DIV class = clearer></DIV>
    </DIV>
    <DIV class = column>
            <div id = "man_zone" style = "text-align:left">
                <ul id = "mixedpar">
                    <s:if test="%{#session.loginAdmin.loginname == 'admin'}">
                        <s:iterator value="siteList" status="bean">
                            <li id = "<s:property value="id"/>" class= "hasChildren" >
                                <span>
                                    <font size = "2" >
                                        <a href="#" onclick = "showDetail('<s:property value="id"/>','<s:property value="name"/>','')" > < b ><s:property value="name"/> < /b>
                                        </a>
                                    </font>
                                </span>
                                <ul>
                                    <li><span>&nbsp;</spn></li>
                                </ul>
                            </li>

                        </s:iterator>
                    </s:if>
                    <s:if test="%{ #session.loginAdmin.loginname != 'admin'}">
                        <s:iterator value="siteList" status="bean">
                            <li id = "<s:property value="id"/>" class = "hasChildren">
                                <span>
                                   <font size="2">
                                        <a href="#" onclick = "showDetail('<s:property value="id"/>','<s:property value="name"/>','')" > < b ><s:property value="name"/> < /b>
                                        </a>
                                   </font>
                                </spn>
                            </li>
                        </s:iterator>>
                    </s:if>
                </ul>
            </div>
    </DIV>

    <script
    type = "text/javascript" >
            function initTreesPar() {
                $("#mixedpar").treeview({
                    url: "site_son.do",
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
    initTreesPar();
    function showDetail(id, name, siteid) {
        parent.left.location.href = "../admin_left.do?siteid=" + id;
    }
    </script>
    </body>
</html>
