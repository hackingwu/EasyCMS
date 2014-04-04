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
    function Check(obj) {
        var delRolesStr = document.getElementById("delRoles").value;
        if (obj.checked) {
            document.getElementById("delRoles").value = delRolesStr.replace(obj.value + "," + obj.role + ";", "");
        } else {
            if (delRolesStr.indexOf(obj.value) < 0) {
                document.getElementById("delRoles").value = delRolesStr + obj.value + "," + obj.role + ";";
            }
        }
    }
    //-->
</script>
<input type="hidden" id="delRoles"/>

<DIV class="column">

    <table cellspacing="1" cellpadding="1"
           border="0" border="0">

        <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
            onMouseOut="this.className='tdbg';">
            <td>
                <input type="checkbox" onclick="checkAllRole(this)"/>
            </td>
            <TD align="left">
                角色名称
            </TD>
        </TR>
        <s:iterator value="roleList" status="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
                onMouseOut="this.className='tdbg';">
                <td>
                    <input type="checkbox" onclick="Check(this)" name="roleids" value="<s:property value="id"/>"
                           role="<s:property value="name"/>" <s:if test="haveRoleUser">checked</s:if>/>
                </td>
                <TD align="left">
                    <s:property value="name"/>
                </TD>
            </TR>
        </s:iterator>
    </table>

</DIV>