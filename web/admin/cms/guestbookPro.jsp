<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<HTML>
<HEAD>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script>
        function checkform() {
            if ($.trim($("#reContent").val()) == "") {
                alert("请输入回复内容");
                $("#reContent").focus();
                return false;
            } else if ($.trim($("#reContent").val()).length > 500) {
                alert("回复内容不能超过500个字符");
                $("#reContent").focus();
                return false;
            }
            return true;
        }
    </script>
</HEAD>
<BODY>
<FORM id=MyForm onsubmit="return checkform()"
      method=post name=MyForm action=guestbook_proDo.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
    <input type="hidden" name="guestbook.id" value="${guestbook.id }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            留言回复
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>


            <TR>
                <TD align="left">
                    <b>标题</b>
                </TD>
                <TD align="left" colspan="3">
                    ${guestbook.title }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>姓名</b>
                </TD>
                <TD align="left" colspan="3">
                    ${guestbook.name }
                </TD>
            </TR>

            <TR>
                <TD align="left">
                    <b>性别</b>
                </TD>
                <TD align="left" colspan="3">
                    ${guestbook.sexStr }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>Email</b>
                </TD>
                <TD align="left" colspan="3">
                    ${guestbook.email }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>QQ</b>
                </TD>
                <TD align="left" colspan="3">
                    ${guestbook.qq }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>电话</b>
                </TD>
                <TD align="left" colspan="3">
                    ${guestbook.tel }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>内容</b>
                </TD>
                <TD align="left" colspan="3">
                    ${guestbook.content }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>添加时间</b>
                </TD>
                <TD align="left" colspan="3">
                    <s:date name="guestbook.addTime" format="yyyy-MM-dd"/>
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>IP</b>
                </TD>
                <TD align="left" colspan="3">
                    ${guestbook.ip }
                </TD>
            </TR>
            <s:if test="%{guestbook.membername != null}">
                <TR>
                    <TD align="left">
                        <b>会员</b>
                    </TD>
                    <TD align="left" colspan="3">
                            ${guestbook.membername}
                    </TD>
                </TR>
            </s:if>
            <TR>
                <TD align="left">
                    <b>审核状态</b>
                </TD>
                <TD align="left" colspan="3">
                    <input type="radio" name="guestbook.state"
                           value="0" ${guestbook.state!="1" && guestbook.state!="2" ?"checked":"" }>未审核
                    <input type="radio" name="guestbook.state" value="1" ${guestbook.state=="1"?"checked":"" }>已审核
                    <input type="radio" name="guestbook.state" value="2" ${guestbook.state=="2"?"checked":"" }>审核不通过
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>回复内容</b>
                </TD>
                <TD align="left" colspan="3">

                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';"
                              type=text id=reContent name=guestbook.reContent
                              style="width:100%;height:100px">${guestbook.reContent }</textarea>
                </TD>
            </TR>
            <s:if test="%{guestbook.reTime != null}">
                <TR>
                    <TD align="left">
                        <b>回复时间</b>
                    </TD>
                    <TD align="left" colspan="3">
                        <s:date name="guestbook.reTime" format="yyyy-MM-dd"/>
                    </TD>
                </TR>
            </s:if>
            <s:if test="%{guestbook.reusername != null}">
                <TR>
                    <TD align="left">
                        <b>回复人</b>
                    </TD>
                    <TD align="left" colspan="3">
                            ${guestbook.reusername}
                    </TD>
                </TR>
            </s:if>
            <TR>
                <TD align="center" colspan="10">
                    <input type="submit" value="回 复" class="button"/>
                    <input type="button" value="返 回" class="button" onclick="history.back(-1);"/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

