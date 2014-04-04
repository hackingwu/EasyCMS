<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="cn.freeteam.cms.model.Answer" %>
<%@page import="cn.freeteam.cms.service.AnswerService" %>
<%@page import="java.util.List" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server

    String id = request.getParameter("id");
    List list = null;
    if (id != null && id.trim().length() > 0) {
        //查询所有
        AnswerService answerService = new AnswerService();
        list = answerService.findByQuestion(id, "", false);
%>
<html>
<head>
    <link rel="stylesheet" href="../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../img/style.css" type="text/css"/>
    <script src="../js/check.js" type="text/javascript"></script>
    <script src="js/answer.js" type="text/javascript"></script>
</head>
<body>
<center>
    <div id="man_zone">
        <table width="99%" border="0" align="left" id="rows" cellpadding="3" cellspacing="1" style="font-size:12px">
            <tr>
                <td colspan="10">
                    <span id="state" style="display:none"><img src="../../js/images/ajax-loader.gif">正在操作中...</span>

                </td>
            </tr>
            <tr>
                <td>
                    <b>选项</b>
                </td>
                <td>
                    <b> 是否有效</b>

                </td>
                <td>
                    <b> 默认选中</b>

                </td>
                <td>
                    <b> 顺序</b>

                </td>
                <td>
                    <b>选择次数</b>
                </td>
                <td>
                    <b> 管理</b>
                </td>
            </tr>

            <tr>
                <td>

                    <input type="text" id="name" name="name" size="30" MAXLENGTH="50" class="colorblur"
                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
                </td>
                <td>
                    <input type="radio" id="isok1" name="isok" value="1" checked="checked"/>是
                    <input type="radio" id="isok0" name="isok" value="0"/>否
                </td>
                <td>
                    <input type="radio" id="isselect1" name="isselect" value="1"/>是
                    <input type="radio" id="isselect0" name="isselect" value="0" checked="checked"/>否
                </td>
                <td>

                    <input type="text" id="order" onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo') name="order" MAXLENGTH="4" size="1"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';">
                </td>
                <td>

                </td>
                <td>
                    <input type="button" value="添加" onclick="addAnswer('<%=id %>')" class="button">
                </td>
            </tr>
            <%
                if (list != null && list.size() > 0) {
                    Answer answer;
                    for (int i = 0; i < list.size(); i++) {
                        answer = (Answer) list.get(i);
                        if (answer != null) {
            %>
            <tr id="tr<%=answer.getId() %>">
                <td>

                    <input type="text" value="<%=answer.getName() %>" size="30" id="name<%=answer.getId() %>"
                           name="name<%=answer.getId() %>" MAXLENGTH="50" class="colorblur"
                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
                </td>
                <td>
                    <input type="radio" id="isok<%=answer.getId() %>1" name="isok<%=answer.getId() %>" value="1"
                           checked="checked"/>是
                    <input type="radio" id="isok<%=answer.getId() %>0" name="isok<%=answer.getId() %>"
                           value="0" <%=(!"1".equals(answer.getIsok())) ? "checked" : "" %>/>否
                </td>
                <td>
                    <input type="radio" id="isselect<%=answer.getId() %>1" name="isselect<%=answer.getId() %>" value="1"
                           checked="checked"/>是
                    <input type="radio" id="isselect<%=answer.getId() %>0" name="isselect<%=answer.getId() %>"
                           value="0" <%=(!"1".equals(answer.getIsselect())) ? "checked" : "" %>/>否
                </td>
                <td>

                    <input type="text" size="1" onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo')
                           value="<%=answer.getOrdernum()!=null?answer.getOrdernum():"" %>"
                           id="order<%=answer.getId() %>" name="order<%=answer.getId() %>" MAXLENGTH="4" size="1"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';">
                </td>
                <td>
                    <%=answer.getSelectnum() != null ? answer.getSelectnum() : "" %>
                </td>
                <td>
                    <input type="button" value="修改" onclick="updateAnswer('<%=answer.getId() %>')" class="button">
                    <input type="button" value="删除" onclick="delAnswer('<%=answer.getId() %>')" class="button">
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
