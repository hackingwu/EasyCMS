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
<script type="text/javascript" src="js/storeList.js"></script>
<script type="text/javascript" src="../js/checkAll.js"></script>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">我的收藏</span></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tr1 tac ">
            <td colspan="6" align="left">

                <form name="myForm" method="post" action="store_list.do" id="myForm"
                      style="margin: 0px">
                    对象标题

                    <input name="store.objtitle" size="10" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    对象类型:
                    <select name="store.objtype">
                        <option value="">全部
                            <s:iterator value="objtypes" id="bean">
                        <option value="<s:property value="key"/>">
                                <s:property value="value"/>
                            </s:iterator>
                    </select>
                    站点

                    <input name="store.siteName" size="10" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    栏目

                    <input name="store.channelName" size="10" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
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
                <b><fs:order colName="标题" col="objtitle"/></b>
            </TD>
            <TD>
                <b><fs:order colName="类型" col="objtype"/></b>
            </TD>
            <TD>
                <b><fs:order colName="站点" col="siteName"/></b>
            </TD>
            <TD>
                <b><fs:order colName="栏目" col="channelName"/></b>
            </TD>
            <TD>
                <b><fs:order colName="时间" col="storeime"/></b>
            </TD>
        </tr>

        <s:iterator value="storeList" id="bean">
            <TR class="tr1 tac " id="tr<s:property value="id"/>">
                <TD>
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>

                <TD>
                    <s:if test='%{"info" == #bean.objtype}'>
                    <a href="<%=path %>/info_visit.do?info.id=<s:property value="objid"/>" target="_blank">
                        </s:if>
                        <s:property value="objtitle"/></a>
                </TD>
                <TD id="objtype<s:property value="id"/>">
                    <s:property value="objtypeStr"/>
                </TD>
                <TD id="siteName<s:property value="id"/>">
                    <s:property value="siteName"/>
                </TD>
                <TD id="channelName<s:property value="id"/>">
                    <s:property value="channelName"/>
                </TD>
                <TD id="storetime<s:property value="id"/>">
                    <s:property value="storetimeStr"/>
                </TD>
            </TR>
        </s:iterator>
        <tr class="tr1 tac ">
            <td colspan="6" align="left"><input type="button" value="删 除" onclick="del()" class="button"/></td>
        </tr>
        <tr class="tr1 tac ">
            <td colspan="6">${pageStr }</td>
        </tr>
    </table>
</div>