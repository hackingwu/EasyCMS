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
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script type="text/javascript" src="../../js/checkAll.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>

    <script type="text/javascript" src="js/creditruleList.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>

<form name="myForm" method="post" action="creditrule_list.do?pageFuncId=${param.pageFuncId }" id="myForm"
      style="margin: 0px">
    <DIV class="column" style="width:99%">
        <div class="columntitle">
            积分规则搜索
        </div>
        <TABLE width="100%" border=0 align=center cellpadding="2"
               cellspacing="0">
            <TBODY>
            <TR class=summary-title>
                <TD height="30" align=left style="padding-left: 10px;">
                    编码:
                    <input name="creditrule.code" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    名称:

                    <input name="creditrule.name" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    类型:
                    <select name="creditrule.rewardtype">
                        <option value="">全部</option>
                        <option value="1">奖励</option>
                        <option value="0">惩罚</option>
                    </select>
                    周期:
                    <select name="creditrule.cycletype">
                        <option value="">全部</option>
                        <option value="<%=Creditrule.CYCLETYPE_ONCE %>">一次性</option>
                        <option value="<%=Creditrule.CYCLETYPE_EVERYDAY %>">每天一次</option>
                        <option value="<%=Creditrule.CYCLETYPE_INTERVAL %>">按间隔时间</option>
                        <option value="<%=Creditrule.CYCLETYPE_UNLIMIT %>">不限制</option>
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
        积分规则列表
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>

            <TD>
                <fs:order colName="编码" col="code"/>
            </TD>
            <TD>
                <fs:order colName="名称" col="name"/>
            </TD>
            <TD>
                <fs:order colName="类型" col="rewardtype"/>
            </TD>
            <TD>
                <fs:order colName="周期" col="cycletype"/>
            </TD>
            <TD>
                <fs:order colName="间隔时间(分)" col="cycletime"/>
            </TD>
            <TD>
                <fs:order colName="奖励次数" col="rewardnum"/>
            </TD>
            <TD>
                <fs:order colName="积分" col="credit"/>
            </TD>
            <TD>
                <fs:order colName="经验" col="experience"/>
            </TD>
            <TD>
                <fs:order colName="排序号" col="orderNum"/>
            </TD>
        </TR>

        <s:iterator value="creditruleList" id="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                <TD align="center">
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>


                <TD align="left" id="code<s:property value="id"/>">
                    <s:property value="code"/>
                </TD>
                <TD align="left" id="name<s:property value="id"/>">
                    <s:property value="name"/>
                </TD>
                <TD align="left" id="rewardtype<s:property value="id"/>">
                    <s:property value="rewardtypeStr"/>
                </TD>
                <TD align="left" id="cycletype<s:property value="id"/>">
                    <s:property value="cycletypeStr"/>
                </TD>
                <TD align="left" id="cycletime<s:property value="id"/>">
                    <s:property value="cycletime"/>
                </TD>
                <TD align="left" id="rewardnum<s:property value="id"/>">
                    <s:property value="rewardnum"/>
                </TD>
                <TD align="left" id="credit<s:property value="id"/>">
                    <s:property value="credit"/>
                </TD>
                <TD align="left" id="experience<s:property value="id"/>">
                    <s:property value="experience"/>
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

