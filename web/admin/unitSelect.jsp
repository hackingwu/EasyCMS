<%@ page language="java" import="cn.freeteam.model.Unit" pageEncoding="UTF-8" %>
<%@page import="cn.freeteam.util.UnitTree" %>
<%@page import="java.util.List" %>
<%@include file="../util/checkParentFrame.jsp" %>
<link rel="stylesheet" href="../js/jquery.treeview.css"/>

<script src="../js/check.js" type="text/javascript"></script>
<script src="../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.edit.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.async.js" type="text/javascript"></script>
<ul id="tree" class="treeview filetree">

    <%
        if (request.getAttribute("unitList") != null) {
            List<Unit> unitList = (List<Unit>) request.getAttribute("unitList");
            UnitTree unitTree = new UnitTree();
            out.println(unitTree.create(unitList, request.getAttribute("selectUnitIds").toString(), request));
        }
    %>
</ul>
	