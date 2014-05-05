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
        站点管理
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td width="30%" align="left" valign="top" class="treetd">
      
			<span><font size="2"><b>站点管理</b></font>
			<a href="#" onclick="location.reload();"><img src="../../img/refresh.gif" title="点击刷新站点"/></a>
			
			<s:if test="%{#session.loginAdmin.loginName == 'admin'}">
                <br/><input type="button" class="button" value="添加一级站点"
                            onclick="document.getElementById('siteFrame').src='site_edit.do'">
                </input>
            </s:if>
			
			</span>


                    <ul id="mixedpar">


                        <s:if test="%{#session.loginAdmin.loginname == 'admin'}">
                            <s:iterator value="siteList" status="bean">
                                <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <a href="site_edit.do?site.id=<s:property value="id"/>" target="siteFrame"><b><s:property
                                value="name"/></b></a></font>
					</span>
                                    <ul>
                                        <li><span>&nbsp;</span></li>
                                    </ul>
                                </li>
                            </s:iterator>
                        </s:if>
                        <s:if test="%{ #session.loginAdmin.loginname != 'admin'}">
                            <s:iterator value="siteList" status="bean">
                                <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <a href="site_edit.do?site.id=<s:property value="id"/>" target="siteFrame"><b><s:property
                                value="name"/></b></a></font>
					</span>
                                </li>
                            </s:iterator>
                        </s:if>
                    </ul>
                </td>
                <td width="70%">

                    <iframe width="100%" height="450" name="siteFrame" id="siteFrame" framespacing="0" border="false"
                            frameborder="0"></iframe>


                </td>
            </tr>
        </table>
    </div>
</DIV>

<script type="text/javascript">
    $("#siteFrame").height($(document).height() - 80);
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
</script>
</body>
</html>
