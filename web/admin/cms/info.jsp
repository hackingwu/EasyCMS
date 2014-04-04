<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@include file="checkSelectSite.jsp" %>

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
    <script type="text/javascript" src="js/info.js">
    </script>
</head>
<body>
<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>

<DIV class=tab>
    <DIV class=tabOn>
        信息管理
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td width="20%" align="left" class="treetd" valign="top">
                    <input type="hidden" id="siteId" name="site.id" value="${site.id }"></input>
                    <ul id="mixed">
                        <s:iterator value="channelList" var="bean" status="stuts">
                            <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <s:if test='%{#session.siteAdmin || "1" == #bean.haveChannelRole }'>
                            <b><a href="#"
                                  onclick="showOne('<s:property value="id"/>','<s:property value="name"/>')"><s:property
                                    value="name"/></a></b>
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

                    <iframe width="100%" height="500" id="infoFrame" framespacing="0" border="false"
                            frameborder="0"></iframe>


                </td>
            </tr>
        </table>
    </div>
</DIV>
<script type="text/javascript">
    $("#infoFrame").height($(document).height() - 80);
    function initTrees() {
        $("#mixed").treeview({
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
    initTrees();
</script>
</body>
</html>
