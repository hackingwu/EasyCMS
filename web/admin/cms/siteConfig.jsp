<%@ page language="java" pageEncoding="UTF-8" %>
<%--<%@   taglib uri="http://ckfinder.com" prefix="ckfinder" %>--%>
<%--<%@   taglib uri="http://ckeditor.com" prefix="ckeditor" %>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@page import="java.util.UUID" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<!--
<%@include file="../../util/checkParentFrame.jsp" %>
-->
<%@include file="checkSelectSite.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>

    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>

    <script src="../../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../../js/check.js" type="text/javascript"></script>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
    <script type="text/javascript" src="../../js/checkLoginName.js"></script>
    <script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="../../js/ckfinderUtil.jsp"></script>
    <script type="text/javascript" src="js/siteConfig.js"></script>
    <script type="text/javascript">
        //选择图片
        function selectImg() {

            var finder = new CKFinder();
            finder.basePath = '../../';
            finder.selectActionFunction = selectImgDo;
            finder.popup();
        }
        //选择图片处理
        function selectImgDo(fileUrl) {
            var fileUrl = "/EasyCMS" + fileUrl;

            $("#imgSpan").html("<a href='" + fileUrl + "' target='_blank'>" +
                    "<img src='" + fileUrl + "'  height='100' title='点击查看大图'/>" +
                    "</a>");
            $("#imgDelBtn").fadeIn("slow");
            $("#img").val(fileUrl);
        }
        //删除图片
        function delImg() {
            $("#imgSpan").empty();
            $("#imgDelBtn").fadeOut("slow");
            $("#img").val("");
        }
    </script>
</head>
<body>

<form action="site_configDo.do" method="post" id="configForm" enctype="multipart/form-data">
<input type="hidden" name="site.id" id="siteId" value="<s:property value = 'site.id'/> "/>
<input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
<input type="hidden" name=site.parId value="${site.parId }"/>

<DIV class=tab>
    <DIV class=tabOn>
        站点设置
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
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入站点名称
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>名称：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input onblur="this.className='colorblur';" id=name
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=site.name value="${site.name }">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>

<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt="请输入站点的源文件目录名，此站点的相关文件将放在此目录下"
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>源文件目录名：</SPAN>
            </NOBR>
        </LABEL>

    </TD>
    <TD width="70%" align="left">

        <input onblur="this.className='colorblur';" id=sourcepath oninput="checkLoginName(this)"
               onpropertychange="checkLoginName(this)"
               class=colorblur
               onfocus="this.className='colorfocus';" ${site!=null && site.id!=null&&site.id!=""?"readonly":""}
               maxLength=50 type=text name=site.sourcePath value="${site.sourcePath }">

        <s:if test="site!=null &&site.id!=null&&site.id!=''">
            <label>站点已确定,源文件目录名无法修改</label>
        </s:if>

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
        <input onblur="this.className='colorblur';" id=sitedomain
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=site.siteDomain value="${site.siteDomain }">
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
        <input onblur="this.className='colorblur';" id=orderNum oninput="checkLoginName(this)"
               onpropertychange="checkLoginName(this)"
               class=colorblur onfocus="this.className='colorfocus';" onkeyup=if(!isInt(value))execCommand('undo')
               onafterpaste=if(!isInt(value))execCommand('undo')
               maxLength=50 type=text name=site.orderNum value="${site.orderNum }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择有效性
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>有效：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="radio" id="isok1" name=site.state value="1"
               <s:if test="site==null || site.state==null || site.state==1">checked="checked"</s:if>>是
        <input type="radio" id="isok0" name=site.state value="0"
               <s:if test="site.state==0">checked="checked"</s:if> >否
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入站点的外部链接，设置后点击此站点将直接进入此外部链接
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>外部链接：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input onblur="this.className='colorblur';" id=url
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=site.url value="${site.url}"/>
    </TD>
</TR>

<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传站点LOGO
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>LOGO：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <%--<input type="hidden" id="oldLogo" name="oldLogo" value="${site.logo }"/>--%>
        <%--<s:if test='%{site.logo!=null && site.logo != "" && site.logo != "null"}'>--%>
							<%--<span id="oldLogoSpan">--%>
							<%--<a href="<%=basePath %>${site.logo }?date=<%=UUID.randomUUID() %>" target="_blank">--%>
                                <%--<img src="<%=basePath %>${site.logo }?date=<%=UUID.randomUUID() %>" width="180"--%>
                                     <%--height="42" title="点击查看大图"/>--%>
                            <%--</a>--%>
							<%--<a href="javascript:delLogo()">删除</a>--%>
							<%--</span>--%>
            <%--<br/>--%>
        <%--</s:if>--%>
        <%--<input type="file" onblur="this.className='inputblur';"--%>
               <%--class=inputblur onfocus="this.className='inputfocus';" name="logo" id="logo">--%>
            <input type="hidden" id="img" name="site.logo"/>

							<span id="imgSpan">
                                <s:if test='%{site.logo!=null && site.logo != "" && site.logo != "null"}'>
                                    <a href="<%=basePath %>${site.logo }?date=<%=UUID.randomUUID() %>" target="_blank">
                                        <img src="${site.logo }?date=<%=UUID.randomUUID() %>" height="42" title="点击查看大图"/>
                                    </a>
                                </s:if>
                            </span>
            <a style="display:none" id="imgDelBtn" href="javascript:delImg()">删除</a>

            <br/>

            <input type="button" class="button" value="选择Logo" onclick="selectImg()"/><span>＊建议宽度256px，高度81px</span>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入站点的版权
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>版权：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input onblur="this.className='colorblur';" id=copyright
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=site.copyright value="${site.copyright }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入站点的备案号
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>备案号：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input onblur="this.className='colorblur';" id=recordcode
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=site.recordCode value="${site.recordCode }">

    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择站点的页面模板
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>页面模板：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="hidden" name=site.indexTemplate value="${site.indexTemplate }" id="indextemplet">
        <input onblur="this.className='colorblur';" id=indextempletName onclick="selectTemplet('${site.id }')"
               class=colorblur onfocus="this.className='colorfocus';" readonly style="cursor:hand"
               maxLength=50 type=text name=site.indexTemplateName value="${site.indexTemplateName }">
        <a href="#" onclick="syncRes()" title="点击后将把模板资源文件(resources文件夹)复制并覆盖到此站点">同步资源文件</a>
    </TD>
</TR>
<%--<TR>--%>
    <%--<TD width="30%" align="left">--%>
        <%--<LABEL id=ctl01_ctl00_label><IMG--%>
                <%--style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"--%>
                <%--id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请设置静态化调度--%>
                <%--src="../../img/help.gif">--%>
            <%--<NOBR>--%>
                <%--<SPAN id=ctl01_ctl00_lblLabel>静态化调度：</SPAN>--%>
            <%--</NOBR>--%>
        <%--</LABEL>--%>
    <%--</TD>--%>
    <%--<TD width="70%" align="left">--%>

        <%--<input type="hidden" name="htmlquartz.id" value="${htmlquartz.id }"/>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<select id="htmlquartzType" name="htmlquartz.type" onchange="htmlquartzTypeChange(this)">--%>
                        <%--<option value="">无</option>--%>
                        <%--<option value="0" ${"0" == htmlquartz.type ?"selected":"" }>定时生成首页</option>--%>
                        <%--<option value="1" ${"1" == htmlquartz.type ?"selected":"" }>间隔重复生成首页</option>--%>
                    <%--</select>--%>
                <%--</td>--%>
                <%--<td id="exetimeTd" style="display:${"0" == htmlquartz.type ?"block":"none" }">--%>
                    <%--<select id="exetimehour" name="htmlquartz.exetimehour">--%>
                        <%--<s:iterator value="hours" id="obj">--%>
                            <%--<option value="${obj }"  ${obj == htmlquartz.exetimehour ?"selected":"" }>${obj }</option>--%>
                        <%--</s:iterator>--%>
                    <%--</select>时--%>
                    <%--<select id="exetimemin" name="htmlquartz.exetimemin">--%>
                        <%--<s:iterator value="mins" id="obj">--%>
                            <%--<option value="${obj }"  ${obj == htmlquartz.exetimemin ?"selected":"" }>${obj }</option>--%>
                        <%--</s:iterator>--%>
                    <%--</select>分--%>
                <%--</td>--%>
                <%--<td id="intervalTd" style="display:${"1" == htmlquartz.type ?"block":"none" }">--%>
                    <%--<table>--%>
                        <%--<tr>--%>
                            <%--<td>--%>
                                <%--间隔单位:--%>
                                <%--<select id="intervalType" name="htmlquartz.intervaltype"--%>
                                        <%--onchange="intervalTypeChange(this)">--%>
                                    <%--<option value="0" ${"0" == htmlquartz.intervaltype ?"selected":"" }>小时</option>--%>
                                    <%--<option value="1" ${"1" == htmlquartz.intervaltype ?"selected":"" }>分钟</option>--%>
                                <%--</select>--%>
                            <%--</td>--%>
                            <%--<td id="intervalhourTd" style="display:${"1" != htmlquartz.intervaltype ?"block":"none" }">--%>
                                <%--<select id="intervalhour" name="htmlquartz.intervalhour">--%>
                                    <%--<s:iterator value="hours" id="obj">--%>
                                        <%--<option value="${obj }" ${obj == htmlquartz.intervalhour ?"selected":"" }>${obj }</option>--%>
                                    <%--</s:iterator>--%>
                                <%--</select>时--%>
                            <%--</td>--%>
                            <%--<td id="intervalminTd" style="display:${"1" == htmlquartz.intervaltype ?"block":"none" }">--%>
                                <%--<select id="intervalmin" name="htmlquartz.intervalmin">--%>
                                    <%--<s:iterator value="mins" id="obj">--%>
                                        <%--<option value="${obj }" ${obj == htmlquartz.intervalmin ?"selected":"" }>${obj }</option>--%>
                                    <%--</s:iterator>--%>
                                <%--</select>分--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                    <%--</table>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</TD>--%>
<%--</TR>--%>
<TR>
    <TD align="center" colspan="10">

        <fs:operButtons/>

    </TD>
</TR>

</TBODY>
</TABLE>
</DIV>
</form>
</body>
</html>
