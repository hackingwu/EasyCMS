<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="cn.freeteam.model.Operbutton" %>
<%@page import="cn.freeteam.service.OperbuttonService" %>
<%@page import="java.util.List" %>
<%@include file="../util/checkParentFrame.jsp" %>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server

    String id = request.getParameter("id");
    List list = null;
    if (id != null && id.trim().length() > 0) {
        //查询所有的操作按钮
        OperbuttonService operbuttonService = new OperbuttonService();
        list = operbuttonService.findByFunc(id);
%>
<html>
<head>
    <link rel="stylesheet" href="../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../img/style.css" type="text/css"/>
    <script src="../js/check.js" type="text/javascript"></script>
    <script src="js/operButton.js" type="text/javascript"></script>
</head>
<body>
<center>
    <div id="man_zone">
        <table width="99%" border="0" align="left" id="rows" cellpadding="3" cellspacing="1" style="font-size:12px">
            <tr>
                <td colspan="10">
                    <span id="state" style="display:none"><img src="../js/images/ajax-loader.gif">正在操作中...</span>

                </td>
            </tr>
            <tr>
                <td>
                    <b>操作按钮</b>
                </td>
                <td>
                    <b> 是否有效</b>

                </td>
                <td>
                    <b> 顺序</b>

                </td>
                <td>
                    <b>执行代码</b>
                </td>
                <td>
                    <b> 管理</b>
                </td>
            </tr>

            <tr>
                <td>

                    <input type="text" id="name" name="name" size="8" MAXLENGTH="50" class="colorblur"
                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
                </td>
                <td>
                    <input type="radio" id="isok1" name="isok" value="1" checked="checked"/>是
                    <input type="radio" id="isok0" name="isok" value="0"/>否
                </td>

                <td>

                    <input type="text" id="order" onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo') name="order" MAXLENGTH="4" size="1"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';">
                </td>
                <td>
                    <input type="text" size="40" id="code" name="code" MAXLENGTH="500" class="colorblur"
                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
                </td>
                <td>
                    <input type="button" value="添加" onclick="addOperbutton('<%=id %>')" class="button">
                </td>
            </tr>
            <%
                if (list != null && list.size() > 0) {
                    Operbutton operbutton;
                    for (int i = 0; i < list.size(); i++) {
                        operbutton = (Operbutton) list.get(i);
                        if (operbutton != null) {
            %>
            <tr id="tr<%=operbutton.getId() %>">
                <td>

                    <input type="text" value="<%=operbutton.getName() %>" size="8" id="name<%=operbutton.getId() %>"
                           name="name<%=operbutton.getId() %>" MAXLENGTH="50" class="colorblur"
                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
                </td>
                <td>
                    <input type="radio" id="isok<%=operbutton.getId() %>1" name="isok<%=operbutton.getId() %>" value="1"
                           checked="checked"/>是
                    <input type="radio" id="isok<%=operbutton.getId() %>0" name="isok<%=operbutton.getId() %>"
                           value="0" <%=(!"1".equals(operbutton.getIsok())) ? "checked" : "" %>/>否
                </td>
                <td>

                    <input type="text" size="1" onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo')
                           value="<%=operbutton.getOrdernum()!=null?operbutton.getOrdernum():"" %>"
                           id="order<%=operbutton.getId() %>" name="order<%=operbutton.getId() %>" MAXLENGTH="4"
                           size="1" class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';">
                </td>
                <td>
                    <input type="text" size="40" value="<%=operbutton.getCode()!=null?operbutton.getCode():"" %>"
                           id="code<%=operbutton.getId() %>" name="code<%=operbutton.getId() %>" MAXLENGTH="500"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';">
                </td>
                <td>
                    <input type="button" value="修改" onclick="updateOperbutton('<%=operbutton.getId() %>')"
                           class="button">
                    <input type="button" value="删除" onclick="delOperbutton('<%=operbutton.getId() %>')" class="button">
                </td>
            </tr>
            <%
                        }
                    }
                }
            %>
        </table>
    </div>
</center>
</body>
</html>
<%
    } else {
        out.println("没有获取到菜单");
    } %>
