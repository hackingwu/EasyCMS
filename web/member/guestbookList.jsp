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
<script type="text/javascript" src="js/guestbookList.js"></script>
<script type="text/javascript" src="../js/checkAll.js"></script>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">我的留言</span></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tr1 tac ">
            <td colspan="5" align="left">

                <form name="myForm" method="post" action="guestbook_list.do" id="myForm"
                      style="margin: 0px">
                    标题

                    <input name="guestbook.title" size="10" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    状态:
                    <select name="guestbook.state">
                        <option value="">全部
                        <option value="0">未审核
                        <option value="1">已审核
                        <option value="2">审核不通过
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
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>

            <TD>
                <b><fs:order colName="标题" col="title"/></b>
            </TD>
            <TD>
                <b><fs:order colName="时间" col="addime"/></b>
            </TD>
            <TD>
                <b><fs:order colName="状态" col="state"/></b>
            </TD>
        </tr>

        <s:iterator value="guestbookList" id="bean">
            <TR class="tr1 tac " id="tr<s:property value="id"/>">
                <TD>
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>

                <TD>
                    <a href="guestbook_info.do?guestbook.id=<s:property value="id"/>"><s:property value="title"/></a>
                </TD>
                <TD id="addtime<s:property value="id"/>">
                    <s:property value="addtimeStr"/>
                </TD>
                <TD id="state<s:property value="id"/>">
                    <s:property value="stateStr"/>
                </TD>
            </TR>
        </s:iterator>
        <tr class="tr1 tac ">
            <td colspan="5" align="left"><input type="button" value="删 除" onclick="del()" class="button"/></td>
        </tr>
        <tr class="tr1 tac ">
            <td colspan="5">${pageStr }</td>
        </tr>
    </table>
</div>