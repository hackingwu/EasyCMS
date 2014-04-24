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
      method=post name=MyForm action=resume_proDo.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
    <input type="hidden" name="resume.id" value="${resume.id }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            简历回复
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>


            <TR>
                <TD align="left">
                    <b>职位</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.job }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>姓名</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.name }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>照片</b>
                </TD>
                <TD align="left" colspan="3">
                    <s:if test='%{resume.img!=null && resume.img!=""}'>
                        <a href="<%=path %>${resume.img }" target="_blank" title="点击查看原图"><img
                                src="<%=path %>${resume.img }" width="80" height="100"/></a>
                    </s:if>
                </TD>
            </TR>

            <TR>
                <TD align="left">
                    <b>性别</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.sexStr }
                </TD>
            </TR>

            <TR>
                <TD align="left">
                    <b>出生日期</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.birthdayStr }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>Email</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.email }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>QQ</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.qq }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>电话</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.tel }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>联系地址</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.address }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>简介</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.content }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>附件</b>
                </TD>
                <TD align="left" colspan="3">
                    <s:if test='%{resume.attch!=null && resume.attch!=""}'>
                        <a href="<%=basePath %>${resume.attch }" target="_blank">附件下载</a>
                    </s:if>
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>添加时间</b>
                </TD>
                <TD align="left" colspan="3">
                    <s:date name="resume.addTime" format="yyyy-MM-dd"/>
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>IP</b>
                </TD>
                <TD align="left" colspan="3">
                    ${resume.ip }
                </TD>
            </TR>
            <s:if test="%{resume.membername != null}">
                <TR>
                    <TD align="left">
                        <b>会员</b>
                    </TD>
                    <TD align="left" colspan="3">
                            ${resume.membername}
                    </TD>
                </TR>
            </s:if>
            <TR>
                <TD align="left">
                    <b>回复内容</b>
                </TD>
                <TD align="left" colspan="3">

                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';"
                              type=text id=reContent name=resume.reContent
                              style="width:100%;height:100px">${resume.reContent }</textarea>
                </TD>
            </TR>
            <s:if test="%{resume.reTime != null}">
                <TR>
                    <TD align="left">
                        <b>回复时间</b>
                    </TD>
                    <TD align="left" colspan="3">
                        <s:date name="resume.reTime" format="yyyy-MM-dd"/>
                    </TD>
                </TR>
            </s:if>
            <s:if test="%{resume.reusername != null}">
                <TR>
                    <TD align="left">
                        <b>回复人</b>
                    </TD>
                    <TD align="left" colspan="3">
                            ${resume.reusername}
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

