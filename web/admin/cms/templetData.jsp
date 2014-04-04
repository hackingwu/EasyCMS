<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../../img/style.css">
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script type="text/javascript" src="../../js/checkAll.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>

    <script type="text/javascript" src="js/templetChannel.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">

<DIV class="column" style="width:99%">
    <div class="columntitle">
        模板初始化数据 (${templet.name })
    </div>
    <TABLE width="100%" border=0 cellpadding="0"
           cellspacing="0">
        <TBODY>
        <TR>
            <TD>


                <DIV class=tab100>
                    <DIV class=tabOn>
                        栏目数据
                    </DIV>
                    <DIV class=tabOff>
                        <A href="templetLink_clazz.do?templet.id=${templet.id }">链接分类</A>
                    </DIV>
                    <DIV class=clearer></DIV>
                </DIV>

                <DIV class=column100>
                    <div id="man_zone">
                        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
                            <tr>
                                <td width="30%" align="left" valign="top" class="treetd">
      
			<span><font size="2"><b>栏目管理</b></font>
			<a href="#" onclick="location.reload();"><img src="../../img/refresh.gif" title="点击刷新栏目"/></a><br/>
			<input type="hidden" name="templet.id" id="templetId" value="${templet.id }"/>
			<input type="button" value="从站点导入" onclick="importSite()" class="button"/><br/>
			<input type="button" value="添加一级栏目" onclick="addOne()" class="button"/>
			</span>


                                    <ul id="mixedchannel">

                                        <s:iterator value="templetChanneList" var="bean" status="stuts">
                                            <li id="<s:property value="id"/>" class="hasChildren">
					<span><font size="2">
                        <a href="templetChannel_edit.do?templetChannel.id=<s:property value="id"/>" title="点击编辑栏目"
                           target="channelFrame"><b><s:property value="name"/></b></a>
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

                                    <iframe width="100%" height="500" name="channelFrame" id="channelFrame"
                                            framespacing="0" border="false" frameborder="0"></iframe>


                                </td>
                            </tr>
                        </table>
                    </div>
                    <script type="text/javascript">
                        $("#channelFrame").height($(document).height() - 80);
                        function initTreesPar() {
                            $("#mixedchannel").treeview({
                                url: "templetChannel_son.do",
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
            </TD>
        </TR>

        </TBODY>
    </TABLE>
</DIV>


</BODY>
</HTML>

