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
            if ($.trim($("#recontent").val()) == "") {
                alert("请输入办理结果");
                $("#recontent").focus();
                return false;
            }
            return true;
        }
    </script>
</HEAD>
<BODY>
<FORM id=MyForm onsubmit="return checkform()"
      method=post name=MyForm action=applyopen_proDo.do>
<input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
<input type="hidden" name="applyopen.id" value="${applyopen.id }"/>

<DIV class=tab>
    <DIV class=tabOn>
        申请办理
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
<TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
<TBODY>


<TR>
    <TD align="left">
        <b>申请人类型</b>
    </TD>
    <TD align="left" colspan="3">
        ${applyopen.typeStr }
    </TD>
</TR>
<s:if test='%{"1"==applyopen.type}'>

    <TR>
        <TD align="left">
            <b>名称</b>
        </TD>
        <TD align="left">
                ${applyopen.lpname }
        </TD>
        <TD align="left">
            <b>组织机构代码</b>
        </TD>
        <TD align="left">
                ${applyopen.unitcode }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>法人代表</b>
        </TD>
        <TD align="left">
                ${applyopen.legalperson }
        </TD>
        <TD align="left">
            <b>联系人姓名</b>
        </TD>
        <TD align="left">
                ${applyopen.linkman }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>联系人电话</b>
        </TD>
        <TD align="left">
                ${applyopen.linkmantel }
        </TD>
        <TD align="left">
            <b>传真</b>
        </TD>
        <TD align="left">
                ${applyopen.lpfax }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>营业执照信息</b>
        </TD>
        <TD align="left" colspan="3">
                ${applyopen.buslicense }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>联系地址</b>
        </TD>
        <TD align="left" colspan="3">
                ${applyopen.lpaddress }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>邮政编码</b>
        </TD>
        <TD align="left" colspan="3">
                ${applyopen.lppostcode }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>电子信箱</b>
        </TD>
        <TD align="left" colspan="3">
                ${applyopen.lpemail }
        </TD>
    </TR>
</s:if>
<s:if test='%{"0"==applyopen.type}'>
    <TR>
        <TD align="left">
            <b>姓名</b>
        </TD>
        <TD align="left">
                ${applyopen.name }
        </TD>
        <TD align="left">
            <b>工作单位</b>
        </TD>
        <TD align="left">
                ${applyopen.unit }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>证件名称</b>
        </TD>
        <TD align="left">
                ${applyopen.cardtype }
        </TD>
        <TD align="left">
            <b>证件号码</b>
        </TD>
        <TD align="left">
                ${applyopen.cardid }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>联系地址</b>
        </TD>
        <TD align="left">
                ${applyopen.address }
        </TD>
        <TD align="left">
            <b>邮政编码</b>
        </TD>
        <TD align="left">
                ${applyopen.postcode }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>联系电话</b>
        </TD>
        <TD align="left">
                ${applyopen.tel }
        </TD>
        <TD align="left">
            <b>传真</b>
        </TD>
        <TD align="left">
                ${applyopen.fax }
        </TD>
    </TR>
    <TR>
        <TD align="left">
            <b>电子信箱</b>
        </TD>
        <TD align="left" colspan="3">
                ${applyopen.email }
        </TD>
    </TR>
</s:if>
<TR>
    <TD align="left">
        <b>所需信息的内容描述</b>
    </TD>
    <TD align="left" colspan="3">
        ${applyopen.detail }
    </TD>
</TR>
<TR>
    <TD align="left">
        <b>所需信息的用途</b>
    </TD>
    <TD align="left" colspan="3">
        ${applyopen.touse }
    </TD>
</TR>

<TR>
    <TD align="left">
        <b>所需信息的指定提供方式</b>
    </TD>
    <TD align="left">
        ${applyopen.pubtypeStr }
    </TD>
    <TD align="left">
        <b>获取信息的方式</b>
    </TD>
    <TD align="left">
        ${applyopen.gettypeStr }
    </TD>
</TR>
<TR>
    <TD align="left">
        <b>是否申请减免费用</b>
    </TD>
    <TD align="left">
        ${applyopen.applyfreeStr }
    </TD>
    <TD align="left">
        <b>可接受其他方式</b>
    </TD>
    <TD align="left">
        ${applyopen.othertypeStr }
    </TD>
</TR>
<TR>
    <TD align="left">
        <b>所需信息的编号</b>
    </TD>
    <TD align="left" colspan="3">
        ${applyopen.infonum }
    </TD>
</TR>
<TR>
    <TD align="left">
        <b>查询码</b>
    </TD>
    <TD align="left" colspan="3">
        ${applyopen.querycode }
    </TD>
</TR>

<TR>
    <TD align="left">
        <b>添加时间</b>
    </TD>
    <TD align="left">
        <s:date name="applyopen.addtime" format="yyyy-MM-dd"/>
    </TD>
    <TD align="left">
        <b>IP</b>
    </TD>
    <TD align="left">
        ${applyopen.ip }
    </TD>
</TR>
<TR>
    <TD align="left">
        <b>办理状态</b>
    </TD>
    <TD align="left" colspan="3">
        ${"1"==applyopen.state?"已办结":"办理中" }
    </TD>
</TR>
<TR>
    <TD align="left">
        <b>转办流程</b>
    </TD>
    <TD align="left" colspan="3">
        ${applyopen.proflow }
    </TD>
</TR>
<TR>
    <TD align="left">
        <b>办理结果</b>
    </TD>
    <TD align="left" colspan="3">

        <textarea onblur="this.className='colorblur';"
                  class=colorblur onfocus="this.className='colorfocus';"
                  type=text id=recontent name=applyopen.recontent
                  style="width:100%;height:100px">${applyopen.recontent }</textarea>
    </TD>
</TR>
<s:if test="%{applyopen.retime != null}">
    <TR>
        <TD align="left">
            <b>办理时间</b>
        </TD>
        <TD align="left" colspan="3">
            <s:date name="applyopen.retime" format="yyyy-MM-dd"/>
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

