<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="cn.freeteam.cms.model.Creditrule" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>

<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../../img/style.css">
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
</HEAD>
<BODY style="padding:0;margin:0">
<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>

<form name="myForm" method="post" action="creditlog_list.do?pageFuncId=${param.pageFuncId }" id="myForm"
      style="margin: 0px">
    <DIV class="column" style="width:99%">
        <div class="columntitle">
            积分记录搜索
        </div>
        <TABLE width="100%" border=0 align=center cellpadding="2"
               cellspacing="0">
            <TBODY>
            <TR class=summary-title>
                <TD height="30" align=left style="padding-left: 10px;">
                    会员:
                    <input name="creditlog.membername" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    积分规则:

                    <select name="creditlog.creditruleid">
                        <option value="">全部
                            <s:iterator value="creditruleList" id="bean">
                        <option value="<s:property value="id"/>">
                                <s:property value="name"/>
                            </s:iterator>
                    </select>
                    类型:
                    <select name="creditlog.type">
                        <option value="">全部</option>
                        <option value="1">奖励</option>
                        <option value="0">惩罚</option>
                    </select>
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
        积分记录列表
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">

            <TD>
                <fs:order colName="会员" col="membername"/>
            </TD>
            <TD>
                <fs:order colName="积分规则" col="creditruleid"/>
            </TD>
            <TD>
                <fs:order colName="类型" col="type"/>
            </TD>
            <TD>
                <fs:order colName="积分" col="credit"/>
            </TD>
            <TD>
                <fs:order colName="经验" col="experience"/>
            </TD>
            <TD>
                <fs:order colName="时间" col="credittime"/>
            </TD>
        </TR>

        <s:iterator value="creditlogList" id="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">


                <TD align="left" id="membername<s:property value="id"/>">
                    <s:property value="membername"/>
                </TD>
                <TD align="left" id="creditruleid<s:property value="id"/>">
                    <s:property value="creditrule"/>
                </TD>
                <TD align="left" id="type<s:property value="id"/>">
                    <s:property value="typeStr"/>
                </TD>
                <TD align="left" id="credit<s:property value="id"/>">
                    <s:property value="credit"/>
                </TD>
                <TD align="left" id="experience<s:property value="id"/>">
                    <s:property value="experience"/>
                </TD>
                <TD align="left" id="credittime<s:property value="id"/>">
                    <s:property value="credittimeStr"/>
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

