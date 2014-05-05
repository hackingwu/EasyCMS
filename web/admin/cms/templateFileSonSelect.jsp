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

    <script type="text/javascript" src="js/templetFileSonSelect.js"></script>
</HEAD>
<BODY style="padding:0;margin:0">
<DIV class="column" style="width:99%">
    <div class="columntitle">
        文件列表(${currFolder })
        <input type="hidden" id="root" value="${root }"/>
        <input type="hidden" id="test" value="test"/>
    </div>


    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">

            <TD>
                文件名
            </TD>
        </TR>

        <%
            if (request.getAttribute("sonFiles") != null) {
                String realPath = request.getRealPath("/");
                List<File> sonFiles = (List<File>) request.getAttribute("sonFiles");
                if (sonFiles != null && sonFiles.size() > 0) {
                    String currFolder = "";
                    if (request.getAttribute("currFolder") != null) {
                        currFolder = request.getAttribute("currFolder").toString().replace("\\", "/").replaceFirst("/", "");
                    }
                    for (int i = 0; i < sonFiles.size(); i++) {
                        if (sonFiles.get(i).getName().endsWith(".html")) {
        %>
        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
            id="tr<%=URLEncoder.encode(sonFiles.get(i).getPath(),"utf-8") %>"
            style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
            <TD align="left" id="name<s:property value="id"/>">
                <a title="点击选择此文件" href="#"
                   onclick="selectFile('<%=currFolder %>/<%=sonFiles.get(i).getName() %>')"><%=sonFiles.get(i).getName() %>
                </a>
            </TD>
        </TR>
        <%
                        }
                    }
                }
            }
        %>
    </table>

</DIV>

</BODY>
</HTML>

