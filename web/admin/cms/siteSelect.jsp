<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td width="30%" align="left" valign="top" class="treetd">

                    <ul id="mixedpar">


                        <s:if test="%{#session.loginAdmin.loginname == 'admin'}">
                            <s:iterator value="siteList" status="bean">
                                <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <a onclick="showDetail('<s:property value="id"/>','<s:property
                                value="name"/>','')"><b><s:property value="name"/></b></a></font>
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
                        <a showDetail('<s:property value="id"/>','<s:property value="name"/>','')><b><s:property
                            value="name"/></b></a></font>
					</span>
                                </li>
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