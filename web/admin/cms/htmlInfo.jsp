<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="fs" uri="/fs-tags" %>
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
    <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/htmlInfo.js">
    </script>
</head>
<body>
<DIV class=tab>
    <DIV class=tabOn>
        信息静态化
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <div id="man_zone">
        <form id="form1" action="html_infoDo.do" method="post">
            <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
                <tr>
                    <td align="left" valign="top" class="treetd">
      
			<span><font size="2"><b>信息静态化</b></font>
			<a href="#" onclick="location.reload();"><img src="../../img/refresh.gif" title="点击刷新栏目"/></a>
			</span>


                        <ul id="mixedchannel">
                            <s:iterator value="channelList" var="bean" status="stuts">
                                <li id="<s:property value="id"/>" class="hasChildren">
				<span><font size="2">
                    <s:if test='%{#session.siteAdmin || "1" == #bean.haveChannelRole }'>
                        <input type="checkbox" name="channels" value="<s:property value="id"/>"><b><s:property
                            value="name"/></b>
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
                </tr>
                <tr style='display:${siteAdmin?"block":"none"}'>
                    <td align="left" valign="top">
                        是否所有栏目:<input type="radio" name="createType" value="channels" checked>否
                        <input type="radio" name="createType" value="all">是
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        开始时间:<input name="info.starttime" id="starttime" class="Wdate" type="text" size="24" value=""
                                    onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>

                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        结束时间:<input name="info.endtime" id="endtime" class="Wdate" type="text" size="24" value=""
                                    onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>

                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" id="buttonTable">
                        <fs:operButtons/>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" id="operInfo" style="display:none">
                        <img src="<%=basePath %>img/loading.gif"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</DIV>

<script type="text/javascript">
    function initTreesPar() {
        $("#mixedchannel").treeview({
            url: "channel_sonCheck.do?auth=1",
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
