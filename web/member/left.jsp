<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<table width="200" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td valign="top">
            <div class="tipcnt mr10 mb10">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr class="tr1">
                        <td>
                            <s:if test='%{#session.loginMember.img!=null && #session.loginMember.img!=""}'>
                                <img src="<%=basePath %>${loginMember.img }" width="50" height="50"/>
                            </s:if>
                            <s:if test='%{#session.loginMember.img==null || #session.loginMember.img==""}'>
                                <img src="../img/noimg.jpg" width="50" height="50"/>
                            </s:if>
                        </td>
                        <td>欢迎：${loginMember.loginname }<br/>
                            <a href="profile.jsp" class="link_down mr10" target="right"><span>设置</span></a>
                            <a href="../member_out.do" class="s8">退出</a>
                        </td>
                    </tr>
                </table>


            </div>


            <div class="tipcnt mr10">
                <div class="title b">会员服务导航</div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr class="tr1">
                        <td><a href="profile.jsp" target="right"><b>个人资料</b></a></td>
                    </tr>
                    <tr class="tr1">
                        <td><a href="pwd.jsp" target="right"><b>密码设置</b></a></td>
                    </tr>
                    <tr class="tr1">
                        <td><a href="creditlog_list.do" target="right"><b>积分记录</b></a></td>
                    </tr>
                    <tr class="tr1">
                        <td><a href="comment_list.do" target="right"><b>我的评论</b></a></td>
                    </tr>
                    <tr class="tr1">
                        <td><a href="guestbook_list.do" target="right"><b>我的留言</b></a></td>
                    </tr>
                    <tr class="tr1">
                        <td><a href="store_list.do" target="right"><b>我的收藏</b></a></td>
                    </tr>
                    <tr class="tr1">
                        <td><a href="resume_list.do" target="right"><b>我的简历</b></a></td>
                    </tr>
                    <tr class="tr1">
                        <td><b>站点信</b></td>
                    </tr>
                    <tr class="tr1">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="msg_send.do" target="right">写信</a></td>
                    </tr>
                    <tr class="tr1">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="msg_tolist.do" target="right">收件箱</a></td>
                    </tr>
                    <tr class="tr1">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="msg_sendlist.do" target="right">发件箱</a></td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>