<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="java.io.File" %>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../../img/style.css">
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script type="text/javascript" src="../../js/checkAll.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>

    <script type="text/javascript" src="js/templetFileSon.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<DIV class="column" style="width:99%">
    <div class="columntitle">
        文件列表(${currFolder })
        <input type="hidden" id="root" value="${root }"/>
    </div>

    <table width="95%" align="center">
        <tr>
            <td align="right">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left">

                            <input type="button" value="上传文件" onclick="uploadFile();" class="button"/>&nbsp;
                            <input type="button" value="添 加" onclick="add();" class="button"/>&nbsp;
                            <input type="button" value="编 辑" onclick="edit();" class="button"/>&nbsp;
                            <input type="button" value="删 除" onclick="del();" class="button"/>&nbsp;
                            <input type="button" value="创建文件夹" onclick="createFolder();" class="button"/>&nbsp;
                            <input ${currFolder =='根目录'?'style="display:none"':'' } type="button" value="重命名此文件夹"
                                                                                    onclick="renameFolder();"
                                                                                    class="button"/>&nbsp;
                            <input ${currFolder =='根目录'?'style="display:none"':'' } type="button" value="删除此文件夹"
                                                                                    onclick="delFolder();"
                                                                                    class="button"/>&nbsp;
                            <input type="button" value="刷新文件列表" onclick="flushFolder();" class="button"/>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD width="20">
                <INPUT onClick="checkAll(this.checked)" type="checkbox"/>
            </TD>

            <TD>

                文件名
            </TD>
        </TR>

        <%
            if (request.getAttribute("sonFiles") != null) {
                String realPath = request.getRealPath("/");
                List<File> sonFiles = (List<File>) request.getAttribute("sonFiles");
                if (sonFiles != null && sonFiles.size() > 0) {
                    for (int i = 0; i < sonFiles.size(); i++) {
        %>
        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
            id="tr<%=URLEncoder.encode(sonFiles.get(i).getPath(),"utf-8") %>"
            style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
            <TD align="center" width="20">
                <INPUT name="ids" type="checkbox" value="<%=URLEncoder.encode(sonFiles.get(i).getPath(),"utf-8") %>"/>
            </TD>

            <TD align="left" id="name<s:property value="id"/>">
                <a title="点击查看/下载"
                   href="<%=checkParentPath %>/<%=sonFiles.get(i).getPath().replace(realPath,"").replace("\\","/") %>"
                   target="_blank"><%=sonFiles.get(i).getName() %>
                </a>
            </TD>
        </TR>
        <%
                    }
                }
            }
        %>
    </table>

</DIV>

</BODY>
</HTML>

