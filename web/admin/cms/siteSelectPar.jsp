<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>

<link rel="stylesheet" href="../../js/jquery.treeview.css"/>

<script src="../../js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="../../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td width="30%" align="left" valign="top" class="treetd">
                    <a href="#" onclick="parSite('root')"><b>站点管理</b></a>
                    <ul id="mixedpar">

                        <s:if test="%{#session.loginAdmin.loginname == 'admin'}">
                            <s:iterator value="siteList" status="bean" id="currSite">
                                <s:if test="%{#currSite.id != #request.site.id}">
                                    <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <a href="#" onclick="parSite('<s:property value="id"/>')"><b><s:property value="name"/></b></a></font>
					</span>
                                        <ul>
                                            <li><span>&nbsp;</span></li>
                                        </ul>
                                    </li>

                                </s:if>
                            </s:iterator>
                        </s:if>
                        <s:if test="%{ #session.loginAdmin.loginname != 'admin'}">
                            <s:iterator value="siteList" status="bean" id="currSite">
                                <s:if test="%{#currSite.id != #request.site.id}">
                                    <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <a href="#" onclick="parSite('<s:property value="id"/>')"><b><s:property value="name"/></b></a></font>
					</span>
                                        <ul>
                                            <li><span>&nbsp;</span></li>
                                        </ul>
                                    </li>

                                </s:if>
                            </s:iterator>
                        </s:if>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
</DIV>

<script type="text/javascript">
    function initTreesPar() {
        $("#mixedpar").treeview({
            url: "site_son.do?site.id=${site.id}",
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