<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>

<html>
<head>
    <link rel="stylesheet" href="../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../img/style.css" type="text/css"/>
    <LINK rel=stylesheet type=text/css href="../img/style3.css"/>

    <link rel="stylesheet" href="../js/jquery.treeview.css"/>

    <script src="../js/check.js" type="text/javascript"></script>
    <script src="../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../js/jquery.treeview.async.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/weebox0.4/weebox.css"/>
    <script type="text/javascript" src="js/func.js">
    </script>
</head>
<body>

<DIV class=tab>
    <DIV class=tabOn>
        菜单管理
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
    <div id="man_zone">
        <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
            <tr>
                <td width="30%" align="left" class="treetd">

                    <ul id="mixed">
                        <li id="root" class="hasChildren">
			<span><font size="2"><b><a href="#" onclick="showOne()">系统菜单</a></b></font>
			<a href="func.jsp?pageFuncId=${param.pageFuncId }"><img src="../img/refresh.gif" title="点击刷新菜单"/></a>
			</span>
                            <ul>
                                <li><span>&nbsp;</span></li>
                            </ul>
                        </li>
                    </ul>
                </td>
                <td width="70%">

                    <div id="one"><fs:operButton buttonName="添加一级菜单"/>
                    </div>
                    <div id="detail" style="display:none">
                        <input type="hidden" id="id" value="">
                        <input type="hidden" name="parid" value="" id="parid">
                        <table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D7DFE1"
                               style="font-size:12px">
                            <tr>
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" style="padding-left:7px">
                                    菜单名称:
                                </td>
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" style="padding-left:7px">
                                    <input type="text" id="menuName" name="menuName" MAXLENGTH="50" class="colorblur"
                                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
                                </td>
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" style="padding-left:7px">
                                    菜单地址:
                                </td>
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" style="padding-left:7px">
                                    <input type="text" id="menuUrl" MAXLENGTH="500" class="colorblur"
                                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
                                </td>
                            </tr>
                            <tr>
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" style="padding-left:7px">
                                    菜单顺序:
                                </td>
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" style="padding-left:7px">
                                    <input type="text" id="menuOrder" onkeyup=if(!isInt(value))execCommand('undo')
                                           onafterpaste=if(!isInt(value))execCommand('undo') class="colorblur"
                                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
                                </td>
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" style="padding-left:7px">
                                    是否有效:
                                </td>
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" style="padding-left:7px">
                                    <input type="radio" name="menuShow" value="1" checked id="show1">是
                                    <input type="radio" name="menuShow" value="0" id="show0">否
                                </td>
                            </tr>
                        </table>
                        <table style="border: 0px solid #FFFFFF">
                            <tr>
                                <td border="0">
                                    <fs:operButton buttonName="保存"/></td>
                                <td id="delButton">
                                    <fs:operButton buttonName="删除"/></td>
                                <td id="downButton">
                                    <fs:operButton buttonName="添加下级菜单"/></td>
                                <td id="operButton">
                                    <fs:operButton buttonName="管理操作按钮"/>
                                </td>
                                <td id="parButton"><fs:operButton buttonName="改变所属菜单"/>
                                </td>
                            </tr>
                        </table>
                    </div>

                </td>
            </tr>
        </table>
    </div>
    <br/>
    <font size="2"><b>操作记录</b></font><br/>

    <DIV id="console"
         style="border: 1px solid #B4C9C6;HEIGHT:150px;PADDING-RIGHT:10px;OVERFLOW-Y:auto;PADDING-LEFT:10px;SCROLLBAR-FACE-COLOR:#ffffff;FONT-SIZE:12px;PADDING-BOTTOM:0px;SCROLLBAR-HIGHLIGHT-COLOR:#ffffff;OVERFLOW:auto;WIDTH:99%;SCROLLBAR-SHADOW-COLOR:#919192;SCROLLBAR-3DLIGHT-COLOR:#ffffff;SCROLLBAR-ARROW-COLOR:#919192;PADDING-TOP:0px;SCROLLBAR-TRACK-COLOR:#ffffff;FONT-FAMILY:宋体;SCROLLBAR-DARKSHADOW-COLOR:#ffffff;LETTER-SPACING:1pt;">
    </DIV>
    <script type="text/javascript">
        function initTrees() {
            $("#mixed").treeview({
                url: "func_son.do",
                ajax: {
                    data: {
                        "additional": function () {
                            return "yeah: " + new Date;
                        }
                    },
                    type: "post"
                }
            });
        }
        initTrees();
    </script>
</DIV>
</body>
</html>
