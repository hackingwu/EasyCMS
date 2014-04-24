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
                alert("请输入办理结果");
                $("#reContent").focus();
                return false;
            }
            return true;
        }
    </script>
</HEAD>
<BODY>
<FORM id=MyForm onsubmit="return checkform()"
      method=post name=MyForm action=report_proDo.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
    <input type="hidden" name="report.id" value="${report.id }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            申报办理
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>


            <TR>
                <TD align="left">
                    <b>项目名称</b>
                </TD>
                <TD align="left" colspan="3">
                    ${report.name }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>申报单位</b>
                </TD>
                <TD align="left" colspan="3">
                    ${report.unit }
                </TD>
            </TR>

            <TR>
                <TD align="left">
                    <b>申报文件名称</b>
                </TD>
                <TD align="left" colspan="3">
                    ${report.fileName }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>申报文件名称</b>
                </TD>
                <TD align="left" colspan="3">
                    ${report.fileName }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>申报文件文号</b>
                </TD>
                <TD align="left" colspan="3">
                    ${report.filenum }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>申报文件附件</b>
                </TD>
                <TD align="left" colspan="3">
                    <s:if test='%{report.attch!=null && report.attch!=""}'>
                        <a href="<%=basePath %>${report.attch }" target="_blank">附件下载</a>
                    </s:if>
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>签发人</b>
                </TD>
                <TD align="left" colspan="3">
                    ${report.issuer }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>查询码</b>
                </TD>
                <TD align="left" colspan="3">
                    ${report.queryCode }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>联系人</b>
                </TD>
                <TD align="left">
                    ${report.linkMan}
                </TD>
                <TD align="left">
                    <b>联系电话</b>
                </TD>
                <TD align="left">
                    ${report.tel }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>添加时间</b>
                </TD>
                <TD align="left">
                    <s:date name="report.addTime" format="yyyy-MM-dd"/>
                </TD>
                <TD align="left">
                    <b>IP</b>
                </TD>
                <TD align="left">
                    ${report.ip }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>办理状态</b>
                </TD>
                <TD align="left" colspan="3">
                    ${"1"==report.state?"已办结":"办理中" }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>转办流程</b>
                </TD>
                <TD align="left" colspan="3">
                    ${report.proFlow }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>办理结果</b>
                </TD>
                <TD align="left" colspan="3">

                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';"
                              type=text id=reContent name=report.reContent
                              style="width:100%;height:100px">${report.reContent }</textarea>
                </TD>
            </TR>
            <s:if test="%{report.reTime != null}">
                <TR>
                    <TD align="left">
                        <b>办理时间</b>
                    </TD>
                    <TD align="left" colspan="3">
                        <s:date name="report.reTime" format="yyyy-MM-dd"/>
                    </TD>
                </TR>
            </s:if>
            <TR>
                <TD align="center" colspan="10">
                    <input type="submit" value="办 结" class="button"/>
                    <input type="button" value="返 回" class="button" onclick="history.back(-1);"/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

