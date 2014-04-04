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
<script type="text/javascript" src="js/commentList.js"></script>
<script type="text/javascript" src="../js/checkAll.js"></script>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">我的评论</span></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tr1 tac ">
            <td colspan="5" align="left">

                <form name="myForm" method="post" action="comment_list.do" id="myForm"
                      style="margin: 0px">
                    匿名:
                    <select name="comment.isanonymous">
                        <option value="">全部
                        <option value="1">是
                        <option value="0">否
                    </select>
                    对象:
                    <select name="comment.objtype">
                        <option value="">全部
                            <s:iterator value="objtypes" id="bean">
                        <option value="<s:property value="key"/>">
                                <s:property value="value"/>
                            </s:iterator>
                    </select>
                    对象ID:

                    <input name="comment.objid" size="10" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    内容:

                    <input name="comment.content" size="10" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    状态:
                    <select name="comment.state">
                        <option value="">全部
                        <option value="0">未审核
                        <option value="1">已审核
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
                <b><fs:order colName="匿名" col="isanonymous"/></b>
            </TD>
            <TD>
                <b><fs:order colName="评论对象" col="objtype"/></b>
            </TD>
            <TD>
                <b><fs:order colName="评论内容" col="content"/></b>
            </TD>
            <TD>
                <b><fs:order colName="时间" col="addime"/></b>
            </TD>
            <TD>
                <b><fs:order colName="状态" col="state"/></b>
            </TD>
        </tr>

        <s:iterator value="commentList" id="bean">
            <TR class="tr1 tac " id="tr<s:property value="id"/>">
                <TD>
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>
                <TD id="isanonymous<s:property value="id"/>">
                    <s:property value="isanonymousStr"/>
                </TD>
                <TD id="objtype<s:property value="id"/>">
                    <s:property value="objtypeStr"/>(<s:property value="objid"/>)
                </TD>
                <TD>
                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';" readonly="readonly"
                              type=text id="content<s:property value="id"/>" cols="60" rows="3"><s:property
                            value="content"/></textarea>
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