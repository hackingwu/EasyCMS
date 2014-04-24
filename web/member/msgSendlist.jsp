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
<script type="text/javascript" src="js/msg.js"></script>
<script type="text/javascript" src="../js/checkAll.js"></script>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">发件箱</span></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tr1 tac ">
            <td colspan="10" align="left">

                <form name="myForm" method="post" action="msg_sendlist.do" id="myForm"
                      style="margin: 0px">
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
                </form>


            </td>
        </tr>
        <tr class="tr1 tac ">
            <TD>
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>

            <TD>
                <b><fs:order colName="收信人" col="tomembername"/></b>
            </TD>
            <TD>
                <b><fs:order colName="标题" col="title"/></b>
            </TD>
            <TD>
                <b><fs:order colName="已读" col="isread"/></b>
            </TD>
            <TD>
                <b><fs:order colName="系统站内信" col="issys"/></b>
            </TD>
            <TD>
                <b><fs:order colName="时间" col="addime"/></b>
            </TD>
        </tr>

        <s:iterator value="msgList" id="bean">
            <TR class="tr1 tac " id="tr<s:property value="id"/>">
                <TD>
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>

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
        <tr class="tr1 tac ">
            <td colspan="10" align="left"><input type="button" value="删 除" onclick="del()" class="button"/></td>
        </tr>
        <tr class="tr1 tac ">
            <td colspan="10">${pageStr }</td>
        </tr>
    </table>
</div>