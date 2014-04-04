<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css href="../img/style3.css">
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../js/check.js"></script>
    <script type="text/javascript" src="../js/checkAll.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/weebox0.4/weebox.css"/>
    <script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>

    <script type="text/javascript" src="js/user.js"></script>
</HEAD>
<BODY>
<form name="myForm" method="post" action="user_list.do"
      action="background_administrator.aspx" id="myForm"
      style="margin: 0px">
    <input type="hidden" name="pageFuncId" value="${param.pageFuncId }"/>

    <DIV class="column">
        <div class="columntitle">
            用户搜索
        </div>
        <TABLE width="100%" border=0 align=center cellpadding="2"
               cellspacing="0">
            <TBODY>
            <TR class=summary-title>
                <TD height="30" align=left style="padding-left: 10px;">
                    所属单位：

                    <input name="user.unitNames" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    用户登录名：

                    <input name="user.loginname" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    用户名称：

                    <input name="user.name" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    角色：

                    <input name="user.roleNames" type="text" maxlength="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/><br/>
                    每页显示条数：
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

                    <input type="button" name="Search" value="搜 索" id="Search" onclick="this.form.submit();"
                           class="button" style="MARGIN-BOTTOM: 0px"/>
                </TD>
            </TR>

            </TBODY>
        </TABLE>
    </DIV>
</form>
<DIV class="column">
    <div class="columntitle">
        用户列表
    </div>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>


            <TD>

                <fs:order colName="所属单位" col="unitNames"/>
            </TD>
            <TD>

                <fs:order colName="用户登录名" col="loginname"/>
            </TD>
            <TD>

                <fs:order colName="用户名称" col="name"/>
            </TD>
            <TD>

                <fs:order colName="角色" col="roleNames"/>
            </TD>
            <TD>

                <fs:order colName="创建日期" col="addTime"/>
            </TD>
            <TD>

                <fs:order colName="最后登录日期" col="lastestlogintime"/>
            </TD>
            <TD>

                <fs:order colName="登录次数" col="loginNum"/>
            </TD>
            <TD>

                <fs:order colName="有效" col="isok"/>
            </TD>
        </TR>

        <s:iterator value="userList" status="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
                <TD align="center">
                    <INPUT name="ids" type="checkbox" value="<s:property value="id"/>"
                           show="<s:property value="loginname"/>"/>
                    <input type="hidden" id="loginnamevalue<s:property value="id"/>"
                           value="<s:property value="loginname"/>"/>
                </TD>
                <TD align="left" id="unitNames<s:property value="id"/>">
                    <s:property value="unitNames"/>
                </TD>
                <TD align="left" id="loginname<s:property value="id"/>">
                    <s:property value="loginname"/>
                </TD>
                <TD align="left" id="name<s:property value="id"/>">
                    <s:property value="name"/>
                </TD>
                <TD align="left" id="role<s:property value="id"/>">
                    <s:property value="roleNames"/>
                </TD>
                <TD align="left">
                    <s:property value="addTimeStr"/>
                </TD>
                <TD align="left">
                    <s:property value="lastestlogintimeStr"/>
                </TD>
                <TD align="left">
                    <s:property value="loginNum"/>
                </TD>
                <TD align="center" id="state<s:property value="id"/>">
                    <s:property value="isokStr"/>
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

