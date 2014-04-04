<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>

<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css href="../img/style3.css">
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/weebox0.4/weebox.css"/>
    <script type="text/javascript" src="../js/check.js"></script>

    <script type="text/javascript">
        function WebForm_OnSubmit() {
            if ($.trim($("#name").val()) == "") {
                alert("请输入角色名称!");
                $("#name").focus();
                return false;
            }

            document.getElementById("MyForm").submit();
        }
    </script>
</HEAD>
<BODY>
<FORM id=MyForm onsubmit="javascript:return WebForm_OnSubmit();"
      method=post name=MyForm action=role_add.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            添加角色
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>


            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入角色名称
                            src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>角色名称：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='colorblur';" id=name
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=role.name value="">
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>

            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择有效性
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>有效：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <input type="radio" name="role.isok" value="1" checked="checked">是
                    <input type="radio" name="role.isok" value="0">否
                </TD>
            </TR>
            <TR>
                <TD height=30 colSpan=2 align=middle>
                    <fs:operButtons/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

