<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib prefix="s" uri="/struts-tags" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css href="../img/style3.css">
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script>
        function save() {
            MyForm.submit();
        }
    </script>
</HEAD>
<BODY>
<%@include file="../util/checkParentFrame.jsp" %>
<FORM id=MyForm
      method=post name=MyForm action=config_configDo.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            系统配置
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="90%">
            <TBODY>
            <TR>
                <TD align="left">
                    <b>配置编码</b>
                </TD>
                <TD align="left">
                    <b>配置名称</b>
                </TD>
                <TD align="left">
                    <b>配置值</b>
                </TD>
            </TR>
            <s:iterator value="configList" status="bean">
                <TR>
                    <TD align="left">
                        <s:property value="code"/>
                    </TD>
                    <TD align="left">
                        <LABEL id=ctl02_ctl00_label>
                            <NOBR>
                                <SPAN id=ctl02_ctl00_lblLabel><s:property value="name"/></SPAN>
                            </NOBR>
                        </LABEL>
                    </TD>
                    <TD align="left">
                        <textarea onblur="this.className='colorblur';"
                                  class=colorblur onfocus="this.className='colorfocus';"
                                  maxLength=500 type=text id='<s:property value="code"/>'
                                  name='<s:property value="code"/>'
                                  cols="40" rows="3"><s:property value="configValue"/></textarea>
                    </TD>
                </TR>
            </s:iterator>
            <TR>
                <TD height=30 colSpan=3 align=middle>
                    <fs:operButtons/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

