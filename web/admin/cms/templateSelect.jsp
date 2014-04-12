<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<script src="js/siteGuideTemplet.js" type="text/javascript"/>
<DIV class="column">

    <table cellspacing="1" cellpadding="1"
           border="0" border="0">

        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
            onMouseOut="this.className='tdbg';">
            <TD align="left" style="cursor:hand">
                <b>模板名称</b>
            </TD>
        </TR>
        <s:iterator value="templateList" status="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
                onMouseOut="this.className='tdbg';">
                <TD align="left" style="cursor:hand"
                    onclick="selectTempletDo('<s:property value="id"/>','<s:property value="name"/>')">
                    <s:property value="name"/>
                </TD>
            </TR>
        </s:iterator>
    </table>

</DIV>