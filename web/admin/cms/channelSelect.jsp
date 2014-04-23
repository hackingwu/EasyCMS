<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link rel="stylesheet" href="../../js/jquery.treeview.css"/>

<script src="../../js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="../../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td align="left" valign="top" class="treetd">

                    <ul id="mixedpar">
                        <s:if test='%{"1" != #request.noShowSite}'>
                            <a onclick="parSite('${site.id }')"><b>${site.name }</b></a>
                        </s:if>
                        <s:iterator value="channelList" var="bean" status="stuts">
                            <li id="<s:property value="id"/>" class="hasChildren">
				<span><font size="2">
                    <s:if test='%{#session.siteAdmin || "1" == #bean.haveChannelRole }'>
                        <s:if test='%{onclick!=null && onclick!="" }'>
                            <a onclick="${onclick }('<s:property value="id"/>','<s:property
                                    value="name"/>')"><b><s:property value="name"/></b></a>
                        </s:if>
                        <s:if test='%{onclick==null || onclick=="" }'>
                            <a onclick="showOne('<s:property value="id"/>','<s:property value="name"/>')"><b><s:property
                                    value="name"/></b></a>
                        </s:if>
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
        </table>
    </div>
</DIV>

<script type="text/javascript">
    function initTreesPar() {
        $("#mixedpar").treeview({
            <s:if test='%{onclick!=null && onclick!="" }'>
            url: "channel_son.do?auth=1&channel.id=${channel.id}&onclick=${onclick}",
            </s:if>
            <s:if test='%{onclick==null || onclick=="" }'>
            url: "channel_son.do?auth=1&channel.id=${channel.id}",
            </s:if>
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