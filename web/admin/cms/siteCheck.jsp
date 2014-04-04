<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="cn.freeteam.cms.model.Site" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
</head>
<body>
<div id="man_zone">
    <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
        <tr>
            <td width="30%" align="left" class="treetd">

                <ul id="mixedpar">

                    <s:if test="%{#session.loginAdmin.loginname == 'admin'}">
                        <s:iterator value="siteList" status="bean">
                            <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <input onclick="siteCheck(this)" ${haveSiteUser=='1'?'checked':'' } type="checkbox" name="sites"
                               value="<s:property value="id"/>" show="<s:property value="name"/>"/>
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
                            <s:if test="%{site.id != id}">
                                <li id="<s:property value="id"/>" class="hasChildren">
						<span><font size="2">
                            <input onclick="siteCheck(this)" type="checkbox"  ${haveSiteUser=='1'?'checked':'' }
                                   name="sites" value="<s:property value="id"/>" show="<s:property value="name"/>"/>
                            <b><s:property value="name"/></b></font>
						</span>
                                </li>
                            </s:if>
                        </s:iterator>
                    </s:if>
                </ul>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    function initTreesPar() {
        $("#mixedpar").treeview({
            url: "site_checkSon.do?onclick=${onclick}&sites=${sites}",
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
