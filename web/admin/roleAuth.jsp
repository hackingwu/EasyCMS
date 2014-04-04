<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../util/checkParentFrame.jsp" %>
<link rel="stylesheet" href="../js/jquery.treeview.css"/>

<script src="../js/check.js" type="text/javascript"></script>
<script src="../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.edit.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.async.js" type="text/javascript"></script>
<input type="hidden" id="id" value="${role.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center height="280px">
        <TBODY>
        <TR>
            <TD align="left">
                <DIV style="HEIGHT:250px;OVERFLOW-Y:auto;SCROLLBAR-FACE-COLOR:#ffffff;FONT-SIZE:12px;PADDING-BOTTOM:0px;SCROLLBAR-HIGHLIGHT-COLOR:#ffffff;OVERFLOW:auto;WIDTH:100%;SCROLLBAR-SHADOW-COLOR:#919192;SCROLLBAR-3DLIGHT-COLOR:#ffffff;SCROLLBAR-ARROW-COLOR:#919192;PADDING-TOP:0px;SCROLLBAR-TRACK-COLOR:#ffffff;FONT-FAMILY:宋体;SCROLLBAR-DARKSHADOW-COLOR:#ffffff;LETTER-SPACING:1pt;">

                    <ul id="mixed">
                        <li id="root" class="hasChildren">
			<span><font size="2"><b>系统菜单</b></font>
			</span>
                            <ul>
                                <li><span>&nbsp;</span></li>
                            </ul>
                        </li>
                    </ul>
                </DIV>
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</DIV>
<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
        <TBODY>
        <TR>
            <TD align="left">
                <b>操作记录</b><br/>

                <DIV id="console"
                     style="HEIGHT:50px;OVERFLOW-Y:auto;SCROLLBAR-FACE-COLOR:#ffffff;FONT-SIZE:12px;PADDING-BOTTOM:0px;SCROLLBAR-HIGHLIGHT-COLOR:#ffffff;OVERFLOW:auto;WIDTH:100%;SCROLLBAR-SHADOW-COLOR:#919192;SCROLLBAR-3DLIGHT-COLOR:#ffffff;SCROLLBAR-ARROW-COLOR:#919192;PADDING-TOP:0px;SCROLLBAR-TRACK-COLOR:#ffffff;FONT-FAMILY:宋体;SCROLLBAR-DARKSHADOW-COLOR:#ffffff;LETTER-SPACING:1pt;">

                </DIV>
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</DIV>

<script type="text/javascript">
    function initTrees() {
        $("#mixed").treeview({
            url: "func_sonAuth.do?role.id=${role.id }",
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