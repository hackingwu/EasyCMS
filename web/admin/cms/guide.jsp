<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@include file="checkSelectSite.jsp" %>

<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../../img/style.css">
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/checkLoginName.js"></script>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
    <script src="../../js/check.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/checkLoginName.js"></script>
    <script type="text/javascript" src="js/siteGuide.js"></script>

</HEAD>
<BODY style="padding:0;margin:0">
<form name="myForm" method="post" action="site_guideSite.do?pageFuncId=${param.pageFuncId }" id="myForm"
      style="margin: 0px">
    <DIV class="column" style="width:99%">
        <div class="columntitle">
            建站向导:<b>创建站点</b> &gt; 选择模板 &gt; 完成
        </div>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择父站点 title=请选择父站点
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>父站点：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <input type="hidden" name="site.parId" id="parid"/>
                    <INPUT onblur="this.className='colorblur';" id=parname title="点击选择父站点"
                           class=colorblur onfocus="this.className='colorfocus';" style="cursor:hand"
                           maxLength=50 type=text value="" readonly onClick="selectPar()"/>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入站点名称
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>名称：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='colorblur';" id=name
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=site.name value="">
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入站点的源文件目录名，此站点的相关文件将放在此目录下
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>源文件目录名：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='colorblur';" id=sourcepath oninput="checkLoginName(this)"
                           onpropertychange="checkLoginName(this)"
                           class=colorblur
                           onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=site.sourcePath value="">
                    <!--${site!=null && site.id!=null && site.id !=""?"readonly":"" }-->
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入站点域名,设置的可以通过此域名直接访问此站点
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>域名：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='colorblur';" id=sitedomain
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=site.siteDomain value="">
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入站点的排序号
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>排序号：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='colorblur';" id=orderNum
                           class=colorblur onfocus="this.className='colorfocus';"
                           onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo')
                           maxLength=50 type=text name=site.orderNum value="">
                </TD>
            </TR>
            <TR>
                <TD align="center" colspan="10">
                    <input type="button" value="保 存" onclick="save(this.form)" class="button"/>
                </TD>
            </TR>

            </TBODY>
        </TABLE>
    </DIV>

</form>


</BODY>
</HTML>

