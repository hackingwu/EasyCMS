<%@ page language="java" pageEncoding="UTF-8" %>

<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@taglib prefix="fs" uri="/fs-tags" %>
<html>
<head>

    <link rel="stylesheet" href="../js/jquery.treeview.css"/>

    <script src="../js/check.js" type="text/javascript"></script>
    <script src="../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../js/jquery.treeview.async.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../img/menu.css"/>
    <script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="../js/menu.js"></script>
    <style type="text/css">

        .lefttab {
            margin: 0;
            padding: 0;
            line-height: 33px;
            height: 33px;
            width: 100%;
            text-align: center;
            font-weight: bold;
        }

        .lefttab A:link, .lefttab A:visited, .lefttab A:hover, .lefttab A:active {
            font-weight: bold;
        }

        .lefttab {
            background-image: url(../img/bg_left.gif);
        }

        a:link, a:visited, a: hover, a:active {
            text-decoration: none;
            color: #6A5ACD;
            background-color: transparent;
        }

    </style>
</head>
<body>
<div class="lefttab">
    <div style='padding-top:6px;'>
        <s:if test="%{#session.manageSite != null}">
            <span style="cursor:hand" title="点击选择管理站点"
                  onclick="parent.right.location.href='cms/site_site.do?type=siteSelectPage'"><fs:string len="8"
                                                                                                         str="${manageSite.name }"></fs:string> </span>
            <img style="cursor:hand" onclick="window.open('<%=basePath %>site/${manageSite.sourcepath }/index.html');"
                 title="点击预览站点" src="../img/www.gif">
        </s:if>
        <s:if test="%{#session.manageSite == null}">
            <span style="cursor:hand" title="点击选择管理站点"
                  onclick="parent.right.location.href='cms/site_site.do?type=siteSelectPage'">请选择管理站点</span>
        </s:if>
    </div>
</div>
<div class="columncontent" style="text-align:left">
    <ul class="container">

        <s:iterator value="#session.funcs" id="bean">
            <s:if test="%{#bean.parid==funcid}">
                <li class="menu">
                    <ul>
                        <li class="button">
                            <a
                                    <s:if test="%{url!=''}">href="<s:property value="url"/><s:if test="%{url.indexOf('?')>-1}">&pageFuncId=<s:property value="id"/></s:if><s:else>?pageFuncId=<s:property value="id"/></s:else>"
                            </s:if> class="blue"><b><s:property value="name"/></b> <span></span></a>
                        </li>

                        <s:if test='%{"1" == #bean.hasChildren}'>
                            <li class="dropdown">
                                <ul>
                                    <s:iterator value="#session.funcs" id="sonbean">
                                        <s:if test="%{#sonbean.parid==#bean.id}">
                                            <li><a target="right"
                                                   <s:if test="%{url!=''}">href="<s:property value="url"/><s:if test="%{url.indexOf('?')>-1}">&pageFuncId=<s:property value="id"/></s:if><s:else>?pageFuncId=<s:property value="id"/></s:else>"
                                            </s:if> ><s:property value="name"/></a></li>
                                        </s:if>
                                    </s:iterator>
                                </ul>
                            </li>
                        </s:if>
                    </ul>
                </li>
            </s:if>
        </s:iterator>
    </ul>


</div>


</body>
</html>