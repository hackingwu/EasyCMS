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
    <script type="text/javascript" src="js/site.js">
    </script>
</head>
<body>
<DIV class=tab>
    <DIV class=tabOn>
        首页静态化
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <div id="man_zone">
        <form action="html_indexDo.do" method="post">
            <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
                <tr>
                    <td align="left" valign="top" class="treetd">
      
			<span><font size="2"><b>选择站点</b></font>
			<a href="#" onclick="location.reload();"><img src="../../img/refresh.gif" title="点击刷新站点"/></a>
			</span>


                        <ul id="mixedpar">


                            <s:if test="%{#session.loginAdmin.loginname == 'admin'}">
                                <s:iterator value="siteList" status="bean">
                                    <li id="<s:property value="id"/>" class="hasChildren">
					<span>
					<input type="checkbox" checked name="sites" value="<s:property value="id"/>"
                           show="<s:property value="name"/>"/>
					<font size="2">
                        <b><s:property value="name"/></b></font>
					</span>
                                        <ul>
                                            <li><span>&nbsp;</span></li>
                                        </ul>
                                    </li>
                                </s:iterator>
                            </s:if>
                            <s:if test="%{#session.loginAdmin.loginname != 'admin'}">
                                <s:iterator value="siteList" status="bean">
                                    <li id="<s:property value="id"/>" class="hasChildren">
					<span>
					<input type="checkbox" checked name="sites" value="<s:property value="id"/>"
                           show="<s:property value="name"/>"/>
					<font size="2">
                        <b><s:property value="name"/></b></font>
					</span>
                                    </li>
                                </s:iterator>
                            </s:if>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <input type="button" value="生成所选站点首页" onclick="this.form.submit()" class="button"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</DIV>

<script type="text/javascript">
    function initTreesPar() {
        $("#mixedpar").treeview({
            url: "site_checkSon.do",
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
    //选择或取消选择一个站点
    function siteCheck(obj) {
    }
</script>
</body>
</html>
