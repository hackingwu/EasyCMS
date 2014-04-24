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

    <script type="text/javascript" src="js/membergroupList.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>

<DIV class="column" style="width:99%">
    <div class="columntitle">
        经验会员组<font size="2">(用户级别随着其经验值的变化而自动升级或者降级)</font>
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <INPUT onClick="checkAllGroup(this.checked,'type0group')" type="checkbox"/>
            </TD>

            <TD>
                <fs:order colName="名称" col="name"/>
            </TD>
            <TD>
                <fs:order colName="排序号" col="orderNum"/>
            </TD>
            <TD>
                <fs:order colName="经验值大于" col="beginexperience"/>
            </TD>
            <TD>
                <fs:order colName="附件最大大小(MB)" col="maxattchsize"/>
            </TD>
            <TD>
                <fs:order colName="最大好友数" col="maxfriendnum"/>
            </TD>
            <TD>
                <fs:order colName="评论是否需要审核" col="commentneedcheck"/>
            </TD>
        </TR>

        <s:iterator value="membergroupList" id="bean">
            <s:if test='%{"0" == #bean.type}'>
                <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                    style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                    <TD align="center">
                        <INPUT name="ids" id="type0group<s:property value="id"/>" type="checkbox"
                               value="<s:property value="id"/>"/></TD>
                    <TD align="left" id="name<s:property value="id"/>">
                        <s:if test='%{#bean.img!=null }'>
                            <img id="img<s:property value="id"/>" src="<%=basePath %><s:property value="img"/>"
                                 width="30" height="30"/>
                        </s:if>
                        <s:if test='%{#bean.color!=null }'>
                        <font color="<s:property value="color"/>">
                            </s:if>
                            <s:property value="name"/>
                            <s:if test='%{#bean.color!=null }'>
                        </font>
                        </s:if>
                    </TD>
                    <TD align="left" id="orderNum<s:property value="id"/>">
                        <s:property value="orderNum"/>
                    </TD>
                    <TD align="left" id="beginexperience<s:property value="id"/>">
                        <s:property value="beginexperience"/>
                    </TD>
                    <TD align="left" id="maxattchsize<s:property value="id"/>">
                        <s:property value="maxattchsize"/>
                    </TD>
                    <TD align="left" id="maxfriendnum<s:property value="id"/>">
                        <s:property value="maxfriendnum"/>
                    </TD>
                    <TD align="left" id="commentneedcheck<s:property value="id"/>">
                        <s:property value="commentneedcheckStr"/>
                    </TD>
                </TR>
            </s:if>
        </s:iterator>
    </table>

</DIV>

<DIV class="column" style="width:99%">
    <div class="columntitle">
        特殊会员组<font size="2">(用户级别不受经验值的影响，始终保持不变)</font>
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <INPUT onClick="checkAllGroup(this.checked,'type1group')" type="checkbox"/>
            </TD>

            <TD>
                <fs:order colName="名称" col="name"/>
            </TD>
            <TD>
                <fs:order colName="排序号" col="orderNum"/>
            </TD>
            <TD>
                <fs:order colName="附件最大大小(MB)" col="maxattchsize"/>
            </TD>
            <TD>
                <fs:order colName="最大好友数" col="maxfriendnum"/>
            </TD>
            <TD>
                <fs:order colName="评论是否需要审核" col="commentneedcheck"/>
            </TD>
        </TR>

        <s:iterator value="membergroupList" id="bean">
            <s:if test='%{"1" == #bean.type}'>
                <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                    style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                    <TD align="center">
                        <INPUT name="ids" id="type1group<s:property value="id"/>" type="checkbox"
                               value="<s:property value="id"/>"/></TD>
                    <TD align="left" id="name<s:property value="id"/>">
                        <s:if test='%{#bean.img!=null }'>
                            <img id="img<s:property value="id"/>" src="<%=basePath %><s:property value="img"/>"
                                 width="30" height="30"/>
                        </s:if>
                        <s:if test='%{#bean.color!=null }'>
                        <font color="<s:property value="color"/>">
                            </s:if>
                            <s:property value="name"/>
                            <s:if test='%{#bean.color!=null }'>
                        </font>
                        </s:if>
                    </TD>
                    <TD align="left" id="orderNum<s:property value="id"/>">
                        <s:property value="orderNum"/>
                    </TD>
                    <TD align="left" id="maxattchsize<s:property value="id"/>">
                        <s:property value="maxattchsize"/>
                    </TD>
                    <TD align="left" id="maxfriendnum<s:property value="id"/>">
                        <s:property value="maxfriendnum"/>
                    </TD>
                    <TD align="left" id="commentneedcheck<s:property value="id"/>">
                        <s:property value="commentneedcheckStr"/>
                    </TD>
                </TR>
            </s:if>
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

