<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<script type="text/javascript">
    <!--
    function checkAllAuth(obj) {
        var auths = document.getElementsByName("authids");
        if (auths != null && auths.length > 0) {
            for (var i = 0; i < auths.length; i++) {
                auths[i].checked = obj.checked;
            }
        }
    }
    //-->
</script>
<DIV class="column">

    <table cellspacing="1" cellpadding="1"
           border="0" border="0">

        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
            onMouseOut="this.className='tdbg';">
            <td>
                <input type="checkbox" onclick="checkAllAuth(this)"/>
            </td>
            <TD align="left">
                会员权限
            </TD>
        </TR>
        <s:iterator value="memberauthList" status="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
                onMouseOut="this.className='tdbg';">
                <td>
                    <input type="checkbox" name="authids" value="<s:property value="id"/>"
                           auth="<s:property value="name"/>" <s:if test="have">checked</s:if>/>
                </td>
                <TD align="left">
                    <s:property value="name"/>
                </TD>
            </TR>
        </s:iterator>
    </table>

</DIV>