<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td align="left" valign="top" class="treetd">

                    <ul id="mixedpar">
                        <a onclick="parTemplet('${templet.id }')"><b>${templet.name }</b></a>
                        <s:iterator value="templetChannelList" var="bean" status="stuts">
                            <li id="<s:property value="id"/>" class="hasChildren">
				<span><font size="2">
                    <a onclick="showOne('<s:property value="id"/>','<s:property value="name"/>')"><b><s:property
                            value="name"/></b></a>
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
            url: "templetChannel_son.do?templetChannel.id=${templetChannel.id}",
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