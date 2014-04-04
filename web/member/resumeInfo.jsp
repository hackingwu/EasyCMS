<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<link href="img/sl_core.css" rel="stylesheet" type="text/css"/>
<link href="img/index.css" rel="stylesheet" type="text/css"/>
<div class="tipcnt">
    <div class="title">
        <span class="f12 fr"></span>
        <span class="b">查看简历</span></div>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <TR class="tr1 tac s3">
            <TD align="left"><b>职位</b>
            </TD>
            <TD align="left">
                ${resume.job }
            </TD>
        </TR>
        <tr class="tr1 tac s3">
            <td align="left"><b>名称</b></td>
            <td align="left">${resume.name }</td>
        </tr>
        <tr class="tr1 tac s3">
            <td align="left"><b>照片</b></td>
            <td align="left">
                <s:if test='%{resume.img!=null && resume.img!=""}'>
                    <a href="<%=path %>${resume.img }" target="_blank" title="点击查看原图"><img
                            src="<%=path %>${resume.img }" width="80" height="100"/></a>
                </s:if>
            </td>
        </tr>
        <tr class="tr1 tac s3">
            <td align="left"><b>性别</b></td>
            <td align="left">${resume.sexStr }</td>
        </tr>
        <tr class="tr1 tac s3">
            <td align="left"><b>出生日期</b></td>
            <td align="left">${resume.birthdayStr }</td>
        </tr>
        <TR class="tr1 tac s3">
            <TD align="left"><b>电子邮箱</b>
            </TD>
            <TD align="left">
                ${resume.email }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>QQ</b>
            </TD>
            <TD align="left">
                ${resume.qq }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left">
                <LABEL id=ctl02_ctl00_label><b>联系电话</b>
            </TD>
            <TD align="left">
                ${resume.tel }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left">
                <LABEL id=ctl02_ctl00_label><b>联系地址</b>
            </TD>
            <TD align="left">
                ${resume.address }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>个人简介</b>
            </TD>
            <TD align="left">
                ${resume.content }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>附件</b>
            </TD>
            <TD align="left">

                <s:if test='%{resume.attch!=null && resume.attch!=""}'>
                    <a href="<%=basePath %>${resume.attch }" target="_blank">附件下载</a>
                </s:if>
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>添加时间</b>
            </TD>
            <TD align="left"><s:date name="resume.addtime" format="yyyy-MM-dd"/>
            </TD>
        </TR>


        <TR class="tr1 tac s3">
            <TD align="left"><b>IP</b>
            </TD>
            <TD align="left">
                ${resume.ip }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>回复状态</b>
            </TD>
            <TD align="left">
                ${resume.stateStr }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>回复内容</b>
            </TD>
            <TD align="left">
                ${resume.recontent }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>回复时间</b>
            </TD>
            <TD align="left">
                <s:date name="resume.retime" format="yyyy-MM-dd"/>
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="left"><b>回复人</b>
            </TD>
            <TD align="left">
                ${resume.reusername }
            </TD>
        </TR>
        <TR class="tr1 tac s3">
            <TD align="center" colspan="10">
                <input type="button" value="返 回" onclick="history.back()" class="button"/>
            </TD>
        </TR>
    </table>
</div>