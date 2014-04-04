<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@taglib prefix="fs" uri="/fs-tags" %>
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
    <script src="../../js/check.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/htmlChannel.js">
    </script>
</head>
<body>
<DIV class=tab>
    <DIV class=tabOn>
        栏目静态化
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <div id="man_zone">
        <form id="form1" action="html_channelDo.do" method="post">
            <input type="hidden" name="createType" id="createType" value="channels"/>
            <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
                <tr>
                    <td align="left" valign="top" class="treetd">
      
			<span><font size="2"><b>栏目静态化</b></font>
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
                <tr>
                    <td align="left" valign="top" id="buttonTable">
                        生成前<INPUT onblur="this.className='colorblur';" id=pagenum size="4"
                                  class=colorblur onfocus="this.className='colorfocus';"
                                  onkeyup=if(!isInt(value))execCommand('undo')
                                  onafterpaste=if(!isInt(value))execCommand('undo')
                                  maxLength=50 type=text name=pagenum value="">页(不填生成所有)
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" id="buttonTable">
                        <table border="0">
                            <tr>
                                <td>
                                    <fs:operButton buttonName="生成所选栏目页"/></td>
                                <td style='display:${siteAdmin?"block":"none"}'>
                                    <fs:operButton buttonName="生成此站点所有栏目页"/>
                                </td>
                            </tr>
                        </table>
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
    function createChannel() {
        oper();
        document.getElementById("form1").submit();
    }
    function createAll() {
        oper();
        document.getElementById("createType").value = "all";
        document.getElementById("form1").submit();
    }
    function oper() {
        $("#buttonTable").fadeOut("slow");
        $("#operInfo").fadeIn("slow");
    }
</script>
</body>
</html>
