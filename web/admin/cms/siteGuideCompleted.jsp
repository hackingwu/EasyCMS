<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <LINK rel=stylesheet type=text/css href="../../img/style3.css"></LINK>
    <script>
        parent.left.location.href = "../admin_left.do?siteid=${site.id}";
        function preview(siteid) {
            parent.location.reload();
            window.open("site_preview.do?site.id=" + siteid);
        }
    </script>
</head>
<body>
<DIV class="column" style="width:99%">
    <div class="columntitle">
        建站向导:创建站点 &gt; 选择模板 &gt; <b>完成</b>
    </div>
    恭喜，您已完成站点的创建，您可以对此站点进行以下操作:<br/>
    <input type="button" class="button" value="站点设置"
           onclick="location.href='site_config.do?pageFuncId=6c561fe7-2013-4ce5-bf9a-42874b07a99e';"/>
    <input type="button" class="button" value="栏目管理" onclick="location.href='channel_channel.do';"/>
    <input type="button" class="button" value="预览站点" onclick="preview('${site.id}');"/>

</DIV>

</body>
</html>
