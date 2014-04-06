<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>
<LINK rel=stylesheet type=text/css href="../img/style.css">
<LINK rel=stylesheet type=text/css
      href="../img/style3.css">
<script>
    if (window.parent.location.href.toLowerCase().indexOf("/admin/index.jsp") == -1) {
        window.parent.location.href = "<%=checkParentBasePath%>admin/Admin_right.do";
    }
</script>
<html>
<head>
    <link rel="stylesheet" href="../img/style.css"
          type="text/css"/>
    <style type="text/css">
        td, input, button, select, body {
            font-family: "lucida Grande", Verdana;
            font-size: 12px;
        }

        .welcomeinfo {
            font: bold 16px "lucida Grande", Verdana;
            height: 39px;
            margin: 0 0 0 118px;
        }

        .t_left1 {
            margin-left: 17px;
        }

        .nowrap {
            white-space: nowrap;
            text-decoration: none
        }

        .f_size, .f_sizetd {
            font-size: 12px;
        }

        .normal {
            font-weight: normal
        }

        img {
            border: none
        }

        a {
            text-decoration: underline;
            cursor: pointer;
        }

        .level {
            margin-bottom: 6px;
            margin-left: 1px;
            font: normal 12px "lucida Grande", Verdana;
            clear: both;
        }

        .level_no {
            margin-top: 8px;
            margin-bottom: 17px;
        }

        .leftpanel {
            margin: 0 0 14px 0;
            padding: 0;
            list-style: none;
        }

        .left {
            float: left
        }

        .right {
            float: right
        }

        .todaybody {
            overflow: auto;
            overflow-x: hidden
        }

        ul.tipbook {
            border-top: 1px solid #d8dee5;
            margin: 0 13px;
            padding: 18px 0 0 2px;
            list-style: none;
        }

        ul.tipbook li {
            height: 28px;
        }

        .tipstitle_title {
            font: normal 14px Verdana;
            margin-bottom: 5px;
            padding-left: 13px;
            padding-top: 8px;
        }

        .ico_input {
            border: none;
            padding: 0;
            margin: 0;
            width: 16px;
            height: 16px;
        }

        .ico_helpmin {
            background: url(../pic/icon/help.gif) no-repeat;
            margin: 0 6px 1px 0
        }

        .ico_bbsmin {
            background: url(../pic/icon/bbs.gif) no-repeat;
            margin: 0 6px 1px 0
        }

        .pic {
            border: 3px double #bfbfbf;
        }

    </style>
    <script type="text/javascript">
        function show(type) {
            if ("syslink" == type) {
                document.getElementById("syslink").style.display = "block";
                document.getElementById("userlink").style.display = "none";
                document.getElementById("sysdiv").className = "tabOn";
                document.getElementById("userdiv").className = "tabOff";
            } else {
                document.getElementById("syslink").style.display = "none";
                document.getElementById("userlink").style.display = "block";
                document.getElementById("sysdiv").className = "tabOff";
                document.getElementById("userdiv").className = "tabOn";
            }
        }
    </script>
</head>
<body class="todaybody">
<DIV class="column">
    <div class="columntitle">
        欢迎使用FreeCMS
    </div>
    <br/>

    <div style="text-align:left">
        <ul class="leftpanel" style="margin-bottom: 0; border: none;">
            <li style="padding-right: 200px; height: auto" id="TodayWelcome"
                class="welcomeinfo t_left1">
                <script>
                    var hour = (new Date()).getHours();
                    if (hour < 4) {
                        hello = "夜深了，";
                    }
                    else if (hour < 7) {
                        hello = "早安，";
                    }
                    else if (hour < 9) {
                        hello = "早上好，";
                    }
                    else if (hour < 12) {
                        hello = "上午好，";
                    }
                    else if (hour < 14) {
                        hello = "中午好，";
                    }
                    else if (hour < 17) {
                        hello = "下午好，";
                    }
                    else if (hour < 19) {
                        hello = "您好，";
                    }
                    else if (hour < 22) {
                        hello = "晚上好，";
                    }
                    else {
                        hello = "夜深了，";
                    }
                    document.write(hello);
                </script>
                ${loginAdmin.loginname }
                <span class="f_size normal addrtitle" id="spanGreeting">。</span><span
                    id="accountType"></span>

                <div class="oneheight"></div>
                <div class="level level_no" style="">
                    欢迎使用FreeCMS系统 <br/>
                    <jsp:include page="../util/sysInfo.jsp"></jsp:include>
                </div>
            </li>
        </ul>
    </div>
</DIV>
<DIV class=tab>
    <DIV class=tabOn id="sysdiv" onmouseover="show('syslink')">
        系统链接
    </DIV>
    <DIV class=tabOff id="userdiv" onmouseover="show('userlink')">
        个人链接
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <center>
        <table id="syslink">
            <tr>
                <s:iterator value="syslink" id="bean" status="st">
                <td style="padding-left:15px;padding-right:15px;padding-top:10px;">
                    <a href='<s:property value="url"/>' target="_blank">
                        <img src='<s:property value="img"/>' class='pic' alt='<s:property value="name"/>'
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
        <table id="userlink" style="display:none">
            <tr>
                <s:iterator value="userlink" id="bean" status="st">
                <td style="padding-left:15px;padding-right:15px;padding-top:10px;">
                    <a href='<s:property value="url"/>' target="_blank">
                        <img src='<s:property value="img"/>' class='pic' alt='<s:property value="name"/>'
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
    </center>
</div>
</body>
</html>
