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

    <script type="text/javascript" src="js/linkList.js"></script>
    <script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="../../js/ckfinderUtil.jsp"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<input type="hidden" id="type" value="${link.type }"/>
<input type="hidden" id="ckfinderCurrentFolder" value="${currentFolder }"/>
<input type="hidden" id="ckfinderBasePath" value="<%=checkParentPath %>"/>

<form name="myForm" method="post" action="link_list.do?pageFuncId=${param.pageFuncId }&link.type=${link.type }"
      id="myForm"
      style="margin: 0px">
    <DIV class="column" style="width:99%">
        <div class="columntitle">
            ${link.type=="1"?"下拉":"" }${link.type=="2"?"图片":"" }${link.type=="3"?"文字":"" }链接搜索
        </div>
        <TABLE width="100%" border=0 align=center cellpadding="2"
               cellspacing="0">
            <TBODY>
            <TR class=summary-title>
                <TD height="30" align=left style="padding-left: 10px;">
                    <input type="hidden" name="link.site" id="siteId" value="${site.id }"/>
                    链接名称：

                    <input name="link.name" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    页面标识：

                    <input name="link.pagemark" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    每页显示条数：
                    <select name="pageSize"
                            id="pageSize">
                        <option selected="selected" value="10">
                            10
                        </option>
                        <option value="30">
                            30
                        </option>
                        <option value="50">
                            50
                        </option>
                        <option value="100">
                            100
                        </option>
                        <option value="200">
                            200
                        </option>
                        <option value="300">
                            300
                        </option>

                    </select>

                    <input type="button" name="Search" value="搜 索" id="Search" onclick="searchFormSubmit(this.form);"
                           class="button" style="MARGIN-BOTTOM: 0px"/>
                </TD>
            </TR>

            </TBODY>
        </TABLE>
    </DIV>
</form>
<DIV class="column" style="width:99%">
    <div class="columntitle">
        链接列表
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>

            <TD>

                <fs:order colName="链接分类" col="parid"/>
            </TD>
            <TD>

                <fs:order colName="链接名称" col="name"/>
            </TD>
            <TD style="display:${link.type=='2'?'block':'none' }">

                <fs:order colName="链接图片" col="img"/>
            </TD>
            <TD>

                <fs:order colName="页面标识" col="pagemark"/>
            </TD>
            <TD>

                <fs:order colName="有效" col="isok"/>
            </TD>
            <TD>

                <fs:order colName="顺序" col="orderNum"/>
            </TD>
        </TR>

        <s:iterator value="linkList" status="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                <TD align="center">
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>

                <TD align="left" id="class<s:property value="id"/>">
                    <s:property value="className"/>
                </TD>
                <TD align="left" id="name<s:property value="id"/>">
                    <a href="<s:property value="url"/>" title="点击查看链接" target="_blank"><s:property value="name"/></a>
                </TD>
                <TD align="left" id="imgtd<s:property value="id"/>" style="display:${link.type=='2'?'block':'none' }">
                    <a href="<s:property value="img"/>" title="点击查看原图" target="_blank">
                        <img width="50" height="35" src="<s:property value="img"/>"/>
                    </a>
                </TD>
                <TD align="left" id="pagemark<s:property value="id"/>">
                    <s:property value="pagemark"/>
                </TD>
                <TD align="left" id="isok<s:property value="id"/>">
                    <s:property value="isokStr"/>
                </TD>
                <TD align="left" id="orderNum<s:property value="id"/>">
                    <s:property value="orderNum"/>
                </TD>
            </TR>
        </s:iterator>
        <TR class="tdbg"
            style="HEIGHT: 25px">
            <TD align="center" colspan="10">
                ${pageStr }
            </TD>
        </TR>
    </table>

</DIV>

<table width="95%" align="center">
    <tr>
        <td align="right">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left">
                        <fs:operButtons/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</BODY>
</HTML>

