<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../../img/style.css">
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
    <script>
        function siteadminCheck(obj) {
            if (obj.checked) {
                $("#manageSiteChecked").attr("checked", "true");
                $("#channelTreeTd").fadeOut("slow");
            } else {
                $("#channelTreeTd").fadeIn("slow");
            }
        }
    </script>
</HEAD>
<BODY style="padding:0;margin:0">
<form action="site_authPageDo.do?site.id=${site.id }&role.id=${role.id }" method="post">
    <DIV class="column" style="width:99%">
        <div class="columntitle" style="padding-left:0px" title="选中则可以管理此站点">
            <b>${site.name } 管理站点权限</b><input type="checkbox" id="manageSiteChecked"
                                              name="manageSiteChecked" ${roleSite!=null?"checked":"" } value="1"/>
        </div>

        <table id="MyDataList" cellspacing="1" cellpadding="1"
               Align="center" border="0" border="0"
               style="width: 100%; word-break: break-all">
            <TR>
                <TD align="left">
                    <input type="checkbox" onclick="siteadminCheck(this)"
                           name="roleSite.siteadmin" ${"1" == roleSite.siteadmin?"checked":"" } value="1"/>
                    站点总管理员(选中将可管理所有栏目)
                </TD>
            </TR>
            <TR id="channelTreeTd" style="display:${"1" == roleSite.siteadmin?"none":"block" }">
                <TD align="left">

                    <ul id="mixed">
                        <li id="root" class="hasChildren">
								<span><font size="2"><input type="checkbox" onclick="checkAll(this.checked)"
                                                            title="全选/取消全选"><b>栏目权限</b></font>
								</span>
                            ${channelTreeContent }
                        </li>
                    </ul>
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <input type="submit" value="授 权" class="button"/>
                </TD>
            </TR>
        </table>

    </DIV>


    <script type="text/javascript">
        function initTrees() {
            $("#mixed").treeview({
                collapsed: false
            });
        }
        initTrees();
        function checkAll(checked) {
            if (checked) {
                $("#manageSiteChecked").attr("checked", "true");
            }
            var objs = document.getElementsByName("channelTree");
            if (objs != null && objs.length > 0) {
                for (var i = 0; i < objs.length; i++) {
                    objs[i].checked = checked;
                }
            }
        }
        function channelTreeClick(obj) {
            if (obj.checked) {
                $("#manageSiteChecked").attr("checked", "true");
            }
        }
    </script>
</form>
</BODY>
</HTML>

