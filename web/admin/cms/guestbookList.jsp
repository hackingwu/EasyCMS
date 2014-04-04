<%@ page language="java" pageEncoding="UTF-8" %>
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

    <script type="text/javascript" src="js/guestbookList.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>

<form name="myForm" method="post" action="guestbook_list.do?pageFuncId=${param.pageFuncId }" id="myForm"
      style="margin: 0px">
    <DIV class="column" style="width:99%">
        <div class="columntitle">
            留言搜索
        </div>
        <TABLE width="100%" border=0 align=center cellpadding="2"
               cellspacing="0">
            <TBODY>
            <TR class=summary-title>
                <TD height="30" align=left style="padding-left: 10px;">
                    标题:

                    <input name="guestbook.title" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    名称:

                    <input name="guestbook.name" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    会员名:

                    <input name="guestbook.membername" type="text" maxlength="100"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    回复人:

                    <input name="guestbook.reusername" type="text" maxlength="50"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    审核状态:
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
                </TD>
            </TR>

            </TBODY>
        </TABLE>
    </DIV>
</form>
<DIV class="column" style="width:99%">
    <div class="columntitle">
        留言列表
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>

            <TD>
                <fs:order colName="标题" col="title"/>
            </TD>
            <TD>
                <fs:order colName="名称" col="name"/>
            </TD>
            <TD>

                <fs:order colName="会员名" col="membername"/>
            </TD>
            <TD>

                <fs:order colName="回复人" col="reusername"/>
            </TD>
            <TD>

                <fs:order colName="留言时间" col="addtime"/>
            </TD>
            <TD>

                <fs:order colName="状态" col="state"/>
            </TD>
        </TR>

        <s:iterator value="guestbookList" id="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                <TD align="center">
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>

                <TD align="left" id="title<s:property value="id"/>">
                    <s:property value="title"/>
                </TD>
                <TD align="left" id="name<s:property value="id"/>">
                    <s:property value="name"/>
                </TD>
                <TD align="left" id="membername<s:property value="id"/>">
                    <s:property value="membername"/>
                </TD>
                <TD align="left" id="reusername<s:property value="id"/>">
                    <s:property value="reusername"/>
                </TD>
                <TD align="left" id="addtime<s:property value="id"/>">
                    <s:date name="addtime" format="yyyy-MM-dd"/>
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

