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
<script type="text/javascript" src="js/resumeList.js"></script>
<script type="text/javascript" src="../js/checkAll.js"></script>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">我的简历</span></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tr1 tac ">
            <td colspan="5" align="left">

                <form name="myForm" method="post" action="resume_list.do" id="myForm"
                      style="margin: 0px">
                    职位

                    <input name="resume.job" size="10" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    状态:
                    <select name="resume.state">
                        <option value="">全部
                        <option value="0">未回复
                        <option value="1">已回复
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
                <b><fs:order colName="职位" col="job"/></b>
            </TD>
            <TD>
                <b><fs:order colName="时间" col="addime"/></b>
            </TD>
            <TD>
                <b><fs:order colName="状态" col="state"/></b>
            </TD>
        </tr>

        <s:iterator value="resumeList" id="bean">
            <TR class="tr1 tac " id="tr<s:property value="id"/>">
                <TD>
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>

                <TD>
                    <a href="resume_info.do?resume.id=<s:property value="id"/>"><s:property value="job"/></a>
                </TD>
                <TD id="addTime<s:property value="id"/>">
                    <s:date name="addTime" format="yyyy-MM-dd"/>
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