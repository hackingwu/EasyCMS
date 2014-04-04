<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../util/checkParentFrame.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../img/style.css" type="text/css"/>


</head>
<body>
<div id="man_zone">
    <table width="99%" border="0" align="left" cellpadding="3" cellspacing="1">
        <tr>
            <td width="30%" align="left">

                <ul id="mixedpar">
                    <li id="root" class="hasChildren">
			<span><font size="2"><b><a href="#" onclick="parButtonDo('','单位管理')">单位管理</a></b></font>
			</span>
                        <ul>
                            <li><span>&nbsp;</span></li>
                        </ul>
                    </li>
                </ul>
            </td>

        </tr>
    </table>
</div>

<script type="text/javascript">
    function initTrees() {
        $("#mixedpar").treeview({
            url: "unit_son.do?pageContentNoFilter=1&noid=${param.id}&onclick=parButtonDo",
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
</body>
</html>
