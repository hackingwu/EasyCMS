<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<body>

<table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
    <tr>
        <td width="30%" align="left" valign="top" class="treetd">


            <ul id="mixedpar">


                <s:if test="%{#session.loginAdmin.loginname == 'admin'}">
                    <s:iterator value="siteList" status="bean">
                        <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <a href="cms/site_authPage.do?site.id=<s:property value="id"/>&role.id=${role.id }"
                           target="siteFrame"><b><s:property value="name"/></b></a></font>${haveSiteRole}
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
                        <a href="cms/site_authPage.do?site.id=<s:property value="id"/>&role.id=${role.id }"
                           target="siteFrame"><b><s:property value="name"/></b></a></font>${haveSiteRole}
					</span>
                        </li>
                    </s:iterator>
                </s:if>
            </ul>
        </td>
        <td width="70%">

            <iframe width="100%" height="380" name="siteFrame" id="siteFrame" framespacing="0" border="false"
                    frameborder="0"></iframe>


        </td>
    </tr>
</table>

<script type="text/javascript">
    function initTreesPar() {
        $("#mixedpar").treeview({
            url: "cms/site_authSon.do?role.id=${role.id}",
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
    function showDetail(id, name, siteid) {
        $("#siteFrame").attr("src", "cms/site_authPage.do?site.id=" + id + "&role.id=${role.id}");
    }
</script>
</body>
</html>
