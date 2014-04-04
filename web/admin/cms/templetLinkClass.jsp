<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@include file="checkSelectSite.jsp" %>
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

    <script type="text/javascript" src="js/templetLinkClass.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">

<input type="hidden" name="templet.id" id="templetId" value="${templet.id }">

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
            <DIV class=tabOff>
                <a href="templet_data.do?templet.id=${templet.id }">栏目数据</a>
            </DIV>
            <DIV class=tabOn>
                链接分类
            </DIV>
            <DIV class=clearer></DIV>
        </DIV>

        <DIV class=column100>
            <div class="columntitle">
                下拉链接分类
            </div>

            <table id="MyDataList" cellspacing="1" cellpadding="1"
                   Align="center" border="0" border="0"
                   style="width: 100%; word-break: break-all">
                <TR class="summary-title" style="HEIGHT: 25px" align="center">
                    <TD>
                        <INPUT onClick="checkAllGroup(this.checked,'type1group')" type="checkbox"/>
                    </TD>

                    <TD>

                        链接分类名称
                    </TD>
                    <TD>

                        页面标识
                    </TD>
                    <TD>

                        有效
                    </TD>
                    <TD>

                        顺序
                    </TD>
                </TR>

                <s:iterator value="templetLinkList" id="bean">
                    <s:if test='%{"1" == #bean.type}'>
                        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                            style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                            <TD align="center">
                                <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"
                                       id="type1group<s:property value="id"/>"/></TD>

                            <TD align="left" id="name<s:property value="id"/>">
                                <s:property value="name"/>
                            </TD>
                            <TD align="left" id="pagemark<s:property value="id"/>">
                                <s:property value="pagemark"/>
                            </TD>
                            <TD align="left" id="isok<s:property value="id"/>">
                                <s:property value="isokStr"/>
                            </TD>
                            <TD align="left" id="ordernum<s:property value="id"/>">
                                <s:property value="ordernum"/>
                            </TD>
                        </TR>
                    </s:if>
                </s:iterator>
            </table>
        </div>

        <DIV class=column100>
            <div class="columntitle">
                图片链接分类
            </div>

            <table id="MyDataList" cellspacing="1" cellpadding="1"
                   Align="center" border="0" border="0"
                   style="width: 100%; word-break: break-all">
                <TR class="summary-title" style="HEIGHT: 25px" align="center">
                    <TD>
                        <INPUT onClick="checkAllGroup(this.checked,'type2group')" type="checkbox"/>
                    </TD>

                    <TD>

                        链接分类名称
                    </TD>
                    <TD>

                        页面标识
                    </TD>
                    <TD>

                        有效
                    </TD>
                    <TD>

                        顺序
                    </TD>
                </TR>

                <s:iterator value="templetLinkList" id="bean">
                    <s:if test='%{"2" == #bean.type}'>
                        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                            style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                            <TD align="center">
                                <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"
                                       id="type2group<s:property value="id"/>"/></TD>

                            <TD align="left" id="name<s:property value="id"/>">
                                <s:property value="name"/>
                            </TD>
                            <TD align="left" id="pagemark<s:property value="id"/>">
                                <s:property value="pagemark"/>
                            </TD>
                            <TD align="left" id="isok<s:property value="id"/>">
                                <s:property value="isokStr"/>
                            </TD>
                            <TD align="left" id="ordernum<s:property value="id"/>">
                                <s:property value="ordernum"/>
                            </TD>
                        </TR>
                    </s:if>
                </s:iterator>
            </table>
        </div>
        <DIV class=column100>
            <div class="columntitle">
                文字链接分类
            </div>

            <table id="MyDataList" cellspacing="1" cellpadding="1"
                   Align="center" border="0" border="0"
                   style="width: 100%; word-break: break-all">
                <TR class="summary-title" style="HEIGHT: 25px" align="center">
                    <TD>
                        <INPUT onClick="checkAllGroup(this.checked,'type3group')" type="checkbox"/>
                    </TD>

                    <TD>

                        链接分类名称
                    </TD>
                    <TD>

                        页面标识
                    </TD>
                    <TD>

                        有效
                    </TD>
                    <TD>

                        顺序
                    </TD>
                </TR>

                <s:iterator value="templetLinkList" id="bean">
                    <s:if test='%{"3" == #bean.type}'>
                        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                            style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                            <TD align="center">
                                <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"
                                       id="type3group<s:property value="id"/>"/></TD>

                            <TD align="left" id="name<s:property value="id"/>">
                                <s:property value="name"/>
                            </TD>
                            <TD align="left" id="pagemark<s:property value="id"/>">
                                <s:property value="pagemark"/>
                            </TD>
                            <TD align="left" id="isok<s:property value="id"/>">
                                <s:property value="isokStr"/>
                            </TD>
                            <TD align="left" id="ordernum<s:property value="id"/>">
                                <s:property value="ordernum"/>
                            </TD>
                        </TR>
                    </s:if>
                </s:iterator>
            </table>
            <table width="95%" align="center">
                <tr>
                    <td align="right">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left">
                                    <input type="button" value="添 加" onclick="add()" class="button"/>&nbsp;
                                    <input type="button" value="编 辑" onclick="edit()" class="button"/>&nbsp;
                                    <input type="button" value="删 除" onclick="del()" class="button"/>&nbsp;
                                    <input type="button" value="从站点导入" onclick="importSite()" class="button"/>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </DIV>
    </TD>
</TR>

</TBODY>
</TABLE>
</DIV>

</BODY>
</HTML>

