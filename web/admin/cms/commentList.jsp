<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@include file="checkSelectSite.jsp" %>

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

    <script type="text/javascript" src="js/commentList.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>

<form name="myForm" method="post" action="comment_list.do?pageFuncId=${param.pageFuncId }" id="myForm"
      style="margin: 0px">
    <DIV class="column" style="width:99%">
        <div class="columntitle">
            评论搜索
        </div>
        <TABLE width="100%" border=0 align=center cellpadding="2"
               cellspacing="0">
            <TBODY>
            <TR class=summary-title>
                <TD height="30" align=left style="padding-left: 10px;">
                    会员:
                    <input name="comment.membername" size="10" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
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
                </TD>
            </TR>

            </TBODY>
        </TABLE>
    </DIV>
</form>
<DIV class="column" style="width:99%">
    <div class="columntitle">
        评论列表
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>

            <TD>
                <fs:order colName="评论会员" col="membername"/>
            </TD>
            <TD>
                <fs:order colName="匿名" col="isanonymous"/>
            </TD>
            <TD>
                <fs:order colName="评论对象" col="objtype"/>
            </TD>
            <TD>
                <fs:order colName="评论内容" col="content"/>
            </TD>
            <TD>
                <fs:order colName="时间" col="addime"/>
            </TD>
            <TD>
                <fs:order colName="状态" col="state"/>
            </TD>
        </TR>

        <s:iterator value="commentList" id="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                <TD align="center">
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"
                           show="<s:property value="loginname"/>"/></TD>


                <TD align="left" id="membername<s:property value="id"/>">
                    <s:property value="membername"/>
                </TD>
                <TD align="left" id="isanonymous<s:property value="id"/>">
                    <s:property value="isanonymousStr"/>
                </TD>
                <TD align="left" id="objtype<s:property value="id"/>">
                    <s:property value="objtypeStr"/>(<s:property value="objid"/>)
                </TD>
                <TD align="left">
                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';" readonly="readonly"
                              type=text id="content<s:property value="id"/>" cols="60" rows="3"><s:property
                            value="content"/></textarea>
                </TD>
                <TD align="left" id="addTime<s:property value="id"/>">
                    <s:property value="addTimeStr"/>
                </TD>
                <TD align="left" id="state<s:property value="id"/>">
                    <s:property value="stateStr"/>
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

