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

    <script type="text/javascript" src="js/msg.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>

<form name="myForm" method="post" action="msg_list.do?pageFuncId=${param.pageFuncId }" id="myForm"
      style="margin: 0px">
    <DIV class="column" style="width:99%">
        <div class="columntitle">
            站内信搜索
        </div>
        <TABLE width="100%" border=0 align=center cellpadding="2"
               cellspacing="0">
            <TBODY>
            <TR class=summary-title>
                <TD height="30" align=left style="padding-left: 10px;">
                    发信人

                    <input name="msg.membername" size="10" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    收信人

                    <input name="msg.tomembername" size="10" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    标题

                    <input name="msg.title" size="10" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    内容

                    <input name="msg.content" size="10" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    已读:
                    <select name="msg.isread">
                        <option value="">全部
                        <option value="0">否
                        <option value="1">是
                    </select>
                    系统站内信:
                    <select name="msg.issys">
                        <option value="">全部
                        <option value="0">否
                        <option value="1">是
                    </select>
                    每页显示条数:
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

                    <input type="submit" name="Search" value="搜 索"
                           class="button" style="MARGIN-BOTTOM: 0px"/>
                </TD>
            </TR>

            </TBODY>
        </TABLE>
    </DIV>
</form>
<DIV class="column" style="width:99%">
    <div class="columntitle">
        站内信列表
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>

            <TD>
                <fs:order colName="发信人" col="membername"/>
            </TD>

            <TD>
                <fs:order colName="收信人" col="tomembername"/>
            </TD>
            <TD>
                <fs:order colName="标题" col="title"/>
            </TD>
            <TD>
                <fs:order colName="已读" col="isread"/>
            </TD>
            <TD>
                <fs:order colName="系统站内信" col="issys"/>
            </TD>
            <TD>
                <fs:order colName="时间" col="addime"/>
            </TD>
        </TR>

        <s:iterator value="msgList" id="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                <TD align="center">
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>


                <TD>
                    <s:if test='%{#bean.membername!=null && ""!=#bean.membername}'>
                        <s:property value="membername"/>
                    </s:if>
                    <s:if test='%{#bean.membername==null || ""==#bean.membername}'>
                        <font color='red'>管理员</font> <s:property value="username"/>
                    </s:if>
                </TD>
                <TD>
                    <s:if test='%{#bean.tomembername!=null && ""!=#bean.tomembername}'>
                        <s:property value="tomembername"/>
                    </s:if>
                    <s:if test='%{#bean.tomembername==null || ""==#bean.tomembername}'>
                        <font color='red'>管理员</font> <s:property value="tousername"/>
                    </s:if>
                </TD>
                <TD>
                    <a href="msg_info.do?msg.id=<s:property value="id"/>"><s:property value="title"/></a>
                </TD>
                <TD>
                        ${"1" == bean.isread ?"是":"否" }
                </TD>
                <TD>
                        ${"1" == bean.issys ?"是":"否" }
                </TD>
                <TD id="addTime<s:property value="id"/>">
                    <s:property value="addTimeStr"/>
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

