<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="cn.freeteam.cms.model.Creditrule" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>

<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css href="../img/style3.css">
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../js/check.js"></script>
    <script type="text/javascript" src="../js/checkAll.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/weebox0.4/weebox.css"/>
    <script type="text/javascript" src="ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="../js/ckfinderUtil.jsp"></script>

    <script type="text/javascript" src="js/adminlinkList.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>
<input type="hidden" id="type" value="${adminlink.type }"/>
<input type="hidden" id="ckfinderCurrentFolder" value="${currentFolder }"/>
<input type="hidden" id="ckfinderBasePath" value="<%=checkParentPath %>"/>

<s:if test='%{"1"==adminlink.type}'>
<DIV class=tab>
    <DIV class=tabOff>
        <A href="user_profile.jsp">个人资料</A>
    </DIV>
    <DIV class=tabOff>
        <A href="pwd.jsp">更改密码</A>
    </DIV>
    <DIV class=tabOn>
        个人链接
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class="column">
    </s:if>
    <s:if test='%{"0"==adminlink.type}'>
    <DIV class="column" style="width:99%">
        <div class="columntitle">
                ${"0" == adminlink.type ?"系统":"个人" }链接列表
        </div>
        </s:if>

        <table id="MyDataList" cellspacing="1" cellpadding="1"
               Align="center" border="0" border="0"
               style="width: 100%; word-break: break-all">
            <TR class="summary-title" style="HEIGHT: 25px" align="center">
                <TD>
                    <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
                </TD>

                <TD>
                    <fs:order colName="链接名称" col="name"/>
                </TD>
                <TD>

                    <fs:order colName="链接图片" col="img"/>
                </TD>
                <TD>

                    <fs:order colName="有效" col="isok"/>
                </TD>
                <TD>

                    <fs:order colName="顺序" col="ordernum"/>
                </TD>
                <TD>
                </TD>
            </TR>

            <s:iterator value="adminlinkList" id="bean">
                <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                    style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                    <TD align="center">
                        <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>


                    <TD align="left" id="name<s:property value="id"/>">
                        <a href="<s:property value="url"/>" title="点击查看链接" target="_blank"><s:property
                                value="name"/></a>
                    </TD>
                    <TD align="left" id="imgtd<s:property value="id"/>">
                        <a href="<s:property value="img"/>" title="点击查看原图" target="_blank">
                            <img width="50" height="35" src="<s:property value="img"/>"/>
                        </a>
                    </TD>
                    <TD align="left" id="isok<s:property value="id"/>">
                        <s:property value="isokStr"/>
                    </TD>
                    <TD align="left" id="ordernum<s:property value="id"/>">
                        <s:property value="ordernum"/>
                    </TD>
                </TR>
            </s:iterator>
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

