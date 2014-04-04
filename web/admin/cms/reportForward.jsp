<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/reportForward.js"></script>

</HEAD>
<BODY>
<FORM id=MyForm
      method=post name=MyForm action=report_forwardDo.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
    <input type="hidden" name="report.id" value="${report.id }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            申报转交
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>


            <TR>
                <TD width="50%" align="right">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择要转交的个人
                            src="../../img/help.gif">
                        <NOBR>
										<SPAN id=ctl01_ctl00_lblLabel>
										转交给
										
										
										</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <LABEL id=ctl01_ctl00_label>
										<SPAN id=ctl01_ctl00_lblLabel>
										<s:iterator value="userList" id="bean" status="st">
                                            <s:if test='%{0==#st.index}'>
                                                <input type="hidden" name="report.username" id="username"
                                                       value="${bean.name }"/>
                                            </s:if>
                                        </s:iterator>
										<select id="userid" name="report.userid"
                                                onchange="$('#username').val(this.options[this.selectedIndex].text);">
                                            <s:iterator value="userList" id="bean">
                                            <option value="${bean.id }">${bean.name }
                                                </s:iterator>
                                        </select>
										</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
            </TR>

            <TR>
                <TD align="center" colspan="10">
                    <input type="submit" value="转 交" class="button"/>
                    <input type="button" value="返 回" class="button" onclick="history.back(-1);"/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

