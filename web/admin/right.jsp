<%--
  Created by IntelliJ IDEA.
  User: hackingwu
  Date: 2014/4/16
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">

</head>
<body style="overflow-x: hidden">
<div class="jumbotron">
    <div class="container">
    <h1>EasyCMS</h1>
    <h2>让开发更迅速，简单</h2>
        <div>
    <a class="btn btn-primary btn-lg" target="_blank" href="https://github.com/hackingwu/EasyCMS">开始使用</a>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="http://weibo.com/u/1854763997" title="开发者微博" target="_blank"><img src="../img/weibo.png" style="height: 30px;" alt="开发者新浪微博"></a>
        </div>
    </div>
</div>



<ul class="nav nav-tabs">
    <li><a href="#sysLink" data-toggle="tab" onmouseover="$(this).tab('show')">系统链接</a></li>
    <li><a href="#usrLink" data-toggle="tab" onmouseover="$(this).tab('show')">用户链接</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
    <div class="tab-pane active" id="sysLink">
        <table>
            <tr>
                <s:iterator value="sysLink" id="bean" status="st">
                    <td style="padding-left:15px;padding-right:15px;padding-top:10px;">
                        <a href='<s:property value="url"/>' target="_blank">
                            <img src='../${img}' class='pic' alt='<s:property value="name"/>'
                                 title='<s:property value="name"/>' width='190' height='150'/>

                        </a>
                    </td>
                    <s:if test='%{(#st.index+1)%4==0}'>
            </tr>
            <tr>
                </s:if>
                </s:iterator>
            </tr>
        </table>


    </div>
    <div class="tab-pane" id="usrLink">
        <table >
            <tr>
                <s:iterator value="userLink" id="bean" status="st">
                <td style="padding-left:15px;padding-right:15px;padding-top:10px;">
                    <a href='<s:property value="url"/>' target="_blank">
                        <img src='../${img}' class='pic' alt='<s:property value="name"/>'
                             title='<s:property value="name"/>' width='190' height='150'/>

                    </a>
                </td>
                <s:if test='%{(#st.index+1)%4==0}'>
            </tr>
            <tr>
                </s:if>
                </s:iterator>
                <td style="padding-left:15px;padding-right:15px;padding-top:10px;">
                    <a href='adminlink_list.do?adminlink.type=1&pageFuncId=d301815a-1583-4eb9-b1a2-44f1b819cc9d'>
                        <img src='../img/addimg.jpg' class='pic' alt='点击添加个人链接' title='点击添加个人链接' width='190'
                             height='150'/>
                    </a>
                </td>
            </tr>
        </table>



    </div>

</div>

    <script src="../js/jquery-1.5.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>

</body>
</html>
