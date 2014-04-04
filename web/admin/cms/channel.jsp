<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="checkSelectSite.jsp" %>

<html>
<head>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>

    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>

    <script src="../../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
    <script type="text/javascript" src="js/channel.js">
    </script>
</head>
<body>
<DIV class=tab>
    <DIV class=tabOn>
        栏目管理
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td width="30%" align="left" valign="top" class="treetd">
      
			<span><font size="2"><b>栏目管理</b></font>
			<a href="#" onclick="location.reload();"><img src="../../img/refresh.gif" title="点击刷新栏目"/></a><br/>
			<input type="hidden" name="site.id" id="siteId" value="${site.id }"/>
			<s:if test="%{#session.siteAdmin}">
                <input type="button" value="添加一级栏目" onclick="addOne()" class="button"/>
            </s:if>
			</span>


                    <ul id="mixedchannel">

                        <s:iterator value="channelList" var="bean" status="stuts">
                            <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <s:if test='%{#session.siteAdmin || "1" == #bean.haveChannelRole }'>
                            <a href="channel_edit.do?channel.id=<s:property value="id"/>" title="点击编辑栏目"
                               target="channelFrame"><b><s:property value="name"/></b></a>
                        </s:if>
                        <s:if test='%{!#session.siteAdmin && "1"!=#bean.haveChannelRole}'>
                            <s:property value="name"></s:property>
                        </s:if>
                    </font>
					</span>
                                <s:if test='%{"1"==#bean.hasChildren}'>
                                    <ul>
                                        <li><span>&nbsp;</span></li>
                                    </ul>
                                </s:if>
                            </li>
                        </s:iterator>
                    </ul>
                </td>
                <td width="70%">

                    <iframe width="100%" height="500" name="channelFrame" id="channelFrame" framespacing="0"
                            border="false" frameborder="0"></iframe>

                </td>
            </tr>
        </table>
    </div>
</DIV>

<script type="text/javascript">
    $("#channelFrame").height($(document).height() - 80);
    function initTreesPar() {
        $("#mixedchannel").treeview({
            url: "channel_son.do?auth=1",
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
