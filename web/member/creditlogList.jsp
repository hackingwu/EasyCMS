<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<!doctype html>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js" defer="defer"></script>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">积分记录</span></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tr1 tac ">
            <td colspan="5" align="left">

                <form name="myForm" method="post" action="creditlog_list.do" id="myForm"
                      style="margin: 0px">
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
                </form>


            </td>
        </tr>
        <tr class="tr1 tac ">
            <TD>
                <b><fs:order colName="积分规则" col="creditruleid"/></b>
            </TD>
            <TD>
                <b><fs:order colName="类型" col="type"/></b>
            </TD>
            <TD>
                <b><fs:order colName="积分" col="credit"/></b>
            </TD>
            <TD>
                <b><fs:order colName="经验" col="experience"/></b>
            </TD>
            <TD>
                <b><fs:order colName="时间" col="credittime"/></b>
            </TD>
        </tr>

        <s:iterator value="creditlogList" id="bean">
            <TR class="tr1 tac ">
                <TD>
                    <s:property value="creditrule"/>
                </TD>
                <TD>
                    <s:property value="typeStr"/>
                </TD>
                <TD>
                    <s:property value="credit"/>
                </TD>
                <TD>
                    <s:property value="experience"/>
                </TD>
                <TD>
                    <s:property value="credittimeStr"/>
                </TD>
            </TR>
        </s:iterator>
        <tr class="tr1 tac ">
            <td colspan="5">${pageStr }</td>
        </tr>
    </table>
</div>