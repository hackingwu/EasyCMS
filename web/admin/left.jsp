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
            color: #696969;
        }

        /*.dropdown {*/
        /*display: none;*/
        /*}*/

        li, ul {
            list-style-type: none;
            padding: 2px 0px 2px 0px;

        }

        a {
            text-decoration: none;
            color: #000000;
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
            overflow: hidden;

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
            <br>
                <span style="cursor:hand" title="点击选择管理站点"
                      onclick="parent.right.location.href='cms/site_site.do?type=siteSelectPage'">&nbsp;&nbsp;${manageSite.name}&nbsp;&nbsp; </span>
            <img onclick="window.open('<%=basePath %>site/${manageSite.sourcePath }/index.html');"
                 src="../img/browser.png" title="点击预览"> </span>
            <br><br>
            <hr>

        </s:if>
        <s:else>
            <span style="cursor:hand" title="点击选择管理站点"
                  onclick="parent.right.location.href='cms/site_site.do?type=siteSelectPage'">请选择管理站点</span>
        </s:else>
    </li>
    <li class="nav-divider">
    <li style="color: #808080">${funcName}</li>
    <s:iterator value="#session.funcs" id="leaf">
        <s:if test="%{#leaf.parId==funcid}">
            <s:if test='%{"1"!=#leaf.hasChildren}'>
                <ul>
                    <li style="position: relative;left:5px" class="hover">
                        <a target="right"
                                <s:if test="%{url!=''}">
                                    href="<s:property value="url"/><s:if
                                        test="%{url.indexOf('?')>-1}">&pageFuncId=<s:property
                                        value="id"/></s:if><s:else>?pageFuncId=<s:property
                                        value="id"/></s:else>"
                                </s:if> >
                            <img src="../img/left.png" width="10" height="10">&nbsp;&nbsp;<s:property value="name"/>
                        </a>
                    </li>
                </ul>
            </s:if>
        </s:if>
    </s:iterator>
    <s:if test='%{""!=#session.funcName}'>
        <br>
        <hr>
    </s:if>
    <s:iterator value="#session.funcs" id="bean">

        <s:if test="%{#bean.parId==funcid}">
            <li>

                <ul>
                    <s:if test='%{"1" == #bean.hasChildren}'>

                        <li class="dropdown-menu">

                            <a style="color: #808080">
                                    <%--<img src="../img/down.png" width="10" height="10">--%>
                                <s:property value="name"/>
                            </a>
                        </li>
                        <li class="dropdown">
                            <ul>
                                <s:iterator value="#session.funcs" id="sonbean">
                                    <s:if test="%{#sonbean.parId==#bean.id}">
                                        <li style="position: relative;left:5px" class="hover">
                                            <a target="right"
                                               <s:if test="%{url!=''}">href="<s:property value="url"/><s:if test="%{url.indexOf('?')>-1}">&pageFuncId=<s:property value="id"/></s:if><s:else>?pageFuncId=<s:property value="id"/></s:else>"
                                            </s:if> >
                                                <img src="../img/left.png" width="10"
                                                     height="10">&nbsp;&nbsp;<s:property value="name"/></a>
                                        </li>
                                    </s:if>
                                </s:iterator>
                                <br>
                                <hr>
                            </ul>
                        </li>
                    </s:if>
                </ul>
            </li>
        </s:if>
    </s:iterator>
</ul>


<script type="text/javascript" src="../js/menu.js"></script>
<script>
    $("li.hover").hover(
            function () {
                $(this).animate({left: "+=5"}, 400);
            }, function () {
                $(this).animate({left: "-=5"}, 400);
            }
    );
</script>
</body>
</html>
