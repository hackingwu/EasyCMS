<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/loading.jsp" %>

<HTML>
<HEAD>
    <title>用户应用设置</title>
    <LINK rel=stylesheet type=text/css href="../../img/style.css">
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
    <script src="js/channelAuth.js" type="text/javascript"></script>
    <script src="../js/auth.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>

</HEAD>
<BODY>
<FORM id=MyForm onsubmit="return FormSubmit()"
      method=post name=MyForm action=channel_auth.do>
    <input type="hidden" id="userId" value="${user.id}"/>
    <input type="hidden" id="wasUser" name="wasUser" value="${wasUser}"/>
    <input type="hidden" name="operUser" value="${operUser}"/>

    <DIV class=tab>
        <DIV class=tabOff onclick="wsAuth('<%=basePath %>')">
            用户授权
        </DIV>
        <DIV class=tabOff onclick="siteAuth('<%=basePath %>')">
            站点授权
        </DIV>
        <DIV class=tabOn>
            栏目授权
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <br/>

        <DIV class=column>

            <div id="man_zone">
                <table width="99%">

                    <tr>
                        <td align="left" class="treetd">
                            当前站点：<select id="site" onchange="siteChange()" name="site.id">
                            <s:iterator value="siteList" status="bean">
                            <option value="<s:property value="id"/>" ${site.id == id?"selected":"" }>
                                    <s:property value="name"/>
                                </s:iterator>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="treetd">
                            <ul id="mixedpar">

                                <s:if test="%{#session.loginAdmin.loginname == 'admin'}">
                                    <s:iterator value="channelList" status="bean">
                                        <li id="<s:property value="id"/>" class="hasChildren">
								<span><font size="2">
                                    <input onclick="check('<s:property value="id"/>','<s:property
                                            value="name"/>',this)" ${haveChannelUser=='1'?'checked':'' } type="checkbox"
                                           name="sites" value="<s:property value="id"/>"
                                           show="<s:property value="name"/>"/>
                                    <b><s:property value="name"/></b></font>
								</span>
                                            <ul>
                                                <li><span>&nbsp;</span></li>
                                            </ul>
                                        </li>
                                    </s:iterator>
                                </s:if>

                                <s:if test="%{#session.loginAdmin.loginname != 'admin'}">
                                    <s:iterator value="channelList" status="bean">
                                        <li id="<s:property value="id"/>" class="hasChildren">
								<span><font size="2">
                                    <input onclick="check('<s:property value="id"/>','<s:property value="name"/>',this)"
                                           type="checkbox"  ${haveChannelUser=='1'?'checked':'' } name="sites"
                                           value="<s:property value="id"/>" show="<s:property value="name"/>"/>
                                    <b><s:property value="name"/></b></font>
								</span>
                                        </li>
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
                        url: "channel_authSon.do?user.id=${user.id}",
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
        </DIV>

        <DIV class=column>
            <TABLE cellSpacing=4 cellPadding=4 width="98%" align=center>
                <TBODY>
                <TR>
                    <TD align="left">
                        <b>操作记录</b><br/>

                        <DIV id="console"
                             style="HEIGHT:50px;OVERFLOW-Y:auto;SCROLLBAR-FACE-COLOR:#ffffff;FONT-SIZE:12px;PADDING-BOTTOM:0px;SCROLLBAR-HIGHLIGHT-COLOR:#ffffff;OVERFLOW:auto;WIDTH:100%;SCROLLBAR-SHADOW-COLOR:#919192;SCROLLBAR-3DLIGHT-COLOR:#ffffff;SCROLLBAR-ARROW-COLOR:#919192;PADDING-TOP:0px;SCROLLBAR-TRACK-COLOR:#ffffff;FONT-FAMILY:宋体;SCROLLBAR-DARKSHADOW-COLOR:#ffffff;LETTER-SPACING:1pt;">

                        </DIV>
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
        </DIV>
    </DIV>
</FORM>
</BODY>
</HTML>

