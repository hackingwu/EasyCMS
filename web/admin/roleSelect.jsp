<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../util/checkParentFrame.jsp" %>
<script type="text/javascript">
    <!--
    function checkAllRole(obj) {
        var roles = document.getElementsByName("roleids");
        if (roles != null && roles.length > 0) {
            for (var i = 0; i < roles.length; i++) {
                roles[i].checked = obj.checked;
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
            <TD align="left" style="cursor:hand">
                <input type="checkbox" onclick="checkAllRole(this)"/>
            </TD>
            <TD align="left" style="cursor:hand">
                <b>角色名</b>
            </TD>
        </TR>
        <s:iterator value="roleList" status="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
                onMouseOut="this.className='tdbg';">
                <TD align="left" style="cursor:hand">
                    <input type="checkbox" name="roleids" id="roleids<s:property value="id"/>"
                           value="<s:property value="id"/>"
                           <s:if test="bean.haveRoleUser">checked</s:if> role="<s:property value="name"/>"/>
                </TD>
                <TD align="left" style="cursor:hand">
                    <s:property value="name"/>
                </TD>
            </TR>
        </s:iterator>
    </table>

</DIV>