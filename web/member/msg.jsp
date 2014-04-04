<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/msg.js"></script>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">发送站内信</span></div>
    <FORM id=MyForm onsubmit="javascript:return checkform();"
          method=post name=MyForm action="msg_sendDo.do">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="tr1 tac s3">
                <td align="left" align="left"><b>收信人</b></td>
                <td align="left" align="left"><INPUT onblur="this.className='colorblur';" id=tomembernames
                                                     class=colorblur onfocus="this.className='colorfocus';" value=""
                                                     maxLength=500 type=text name=tomembernames>(多个之间用分号隔开)
                    <SPAN id=ctl03>*</SPAN></td>
            </tr>
            <TR class="tr1 tac s3">
                <td align="left"><b>标题</b>
                </TD>
                <td align="left">
                    <INPUT onblur="this.className='colorblur';" id=title
                           class=colorblur onfocus="this.className='colorfocus';" value=""
                           maxLength=50 type=text name=msg.title>
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR class="tr1 tac s3">
                <td align="left"><b>内容</b>
                </TD>
                <td align="left">
                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';"
                              maxLength=500 type=text id=content name=msg.content cols="50" rows="3"></textarea>
                    (500字以内)
                    <SPAN>*</SPAN>
                </TD>
            </TR>
            <TR class="tr1 tac s3">
                <td align="center" colspan="10">
                    <input type="submit" value="发 送" class="button"/>
                </TD>
            </TR>
        </table>
</div>