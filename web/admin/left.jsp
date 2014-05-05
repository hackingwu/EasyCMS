<%--
  Created by IntelliJ IDEA.
  User: hackingwu
  Date: 2014/4/16
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fs" uri="/fs-tags" %>
<html>
<head>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <link href="../bootstrap/css/bootstrap.css">
    <style>
        a:hover {
            padding: 10px;
            color: #000000;
        }

        .dropdown {
            display: none;
        }

        .dropdown ul {

            padding-left: 10px;

        }

        li, ul {
            list-style-type: none;
            padding: 2px;
            color: #777777;
        }

        a {
            text-decoration: none;
            color: #777777
        }

        hr {

            margin: 1px 0;
            overflow: hidden;
            background-color: #e5e5e5;
            border: 0px;
            height: 1px;
        }

        body {
            text-shadow: 0 1px 0 #fff;
            background-color: #f7f5fa;
            align-content: space-between;

        }

    </style>

</head>
<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<ul class="nav nav-tabs nav-stacked">
    <li>
        <s:if test="%{#session.manageSite != null}">
                <span style="cursor:hand" title="点击选择管理站点"
                      onclick="parent.right.location.href='cms/site_site.do?type=siteSelectPage'">&nbsp;&nbsp;${manageSite.name}&nbsp;&nbsp; </span>
            <img onclick="window.open('<%=basePath %>site/${manageSite.sourcePath }/index.html');"
                 src="../img/www.gif" title="点击预览"> </span>
        </s:if>
        <s:else>
            <span style="cursor:hand" title="点击选择管理站点"
                  onclick="parent.right.location.href='cms/site_site.do?type=siteSelectPage'">请选择管理站点</span>
        </s:else>
    </li>
    <li class="nav-divider">
        <s:iterator value="#session.funcs" id="bean">

        <s:if test="%{#bean.parId==funcid}">
    <li>

        <ul>
            <s:if test='%{"1" == #bean.hasChildren}'>

                <li class="dropdown-menu">

                    <a>
                        <img src="../img/plus.jpg" width="10" height="10">&nbsp;<s:property value="name"/>
                    </a>
                    <hr>
                </li>
                <li class="dropdown">
                    <ul>
                        <s:iterator value="#session.funcs" id="sonbean">
                            <s:if test="%{#sonbean.parId==#bean.id}">
                                <li><a target="right"
                                       <s:if test="%{url!=''}">href="<s:property value="url"/><s:if test="%{url.indexOf('?')>-1}">&pageFuncId=<s:property value="id"/></s:if><s:else>?pageFuncId=<s:property value="id"/></s:else>"
                                </s:if> ><s:property value="name"/></a>
                                    <hr>
                                </li>
                            </s:if>
                        </s:iterator>
                    </ul>
                </li>
            </s:if>
            <s:else>
                <li>
                    <a target="right"
                            <s:if test="%{url!=''}">
                                href="<s:property value="url"/><s:if
                                    test="%{url.indexOf('?')>-1}">&pageFuncId=<s:property value="id"/></s:if><s:else>?pageFuncId=<s:property
                                    value="id"/></s:else>"
                            </s:if> >
                        &nbsp;&nbsp;&nbsp;<s:property value="name"/></a>
                    <hr>
                </li>
            </s:else>
        </ul>
    </li>
    </s:if>
    </s:iterator>
</ul>


<script type="text/javascript" src="../js/menu.js"></script>
</body>
</html>
