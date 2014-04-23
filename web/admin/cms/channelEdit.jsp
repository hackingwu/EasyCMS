<%@ page language="java" pageEncoding="UTF-8" %>
<%--<%@   taglib uri="http://ckfinder.com" prefix="ckfinder" %>--%>
<%--<%@   taglib uri="http://ckeditor.com" prefix="ckeditor" %>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<link rel="stylesheet" href="../../img/common.css" type="text/css"/>
<link rel="stylesheet" href="../../img/style.css" type="text/css"/>
<link rel="stylesheet" href="../../img/style3.css" type="text/css"/>

<link rel="stylesheet" href="../../js/jquery.treeview.css"/>

<script src="../../js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="../../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
<script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
<script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
<link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
<script type="text/javascript" src="../../js/checkLoginName.js"></script>
<script type="text/javascript" src="../../js/check.js"></script>
<script type="text/javascript" src="js/channelEdit.js">
</script>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.UUID" %>

<%
    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setRepository(new File(""));
    ServletFileUpload upload = new ServletFileUpload(factory);

    //upload.setHeaderEncoding("gbk");
    upload.setSizeMax(1000 * 1024);//2 * 500KB
%>
<form action="channel_editDo.do" method="post" enctype="multipart/form-data">

<input type="hidden" name="site.id" value="${site.id}">
<input type="hidden" name="channel.site" value="${site.id }">
<input type="hidden" name="channel.parId" value="${channel.parId }">
<input type="hidden" name="channel.id" id="channelId" value="${channel.id }">

<DIV class=column>
<TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
<TBODY>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label>
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>站点名称：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" readonly
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=site.name value="${site.name }">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<s:if test="%{channel.id!=null}">
    <TR>
        <TD width="30%" align="left">
            <LABEL id=ctl01_ctl00_label><IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl01_ctl00_imgHelp tabIndex=-1 title=栏目的唯一标识
                    src="../../img/help.gif">
                <NOBR>
                    <SPAN id=ctl01_ctl00_lblLabel>栏目ID：</SPAN>
                </NOBR>
            </LABEL>
        </TD>
        <TD width="70%" align="left">
            <INPUT onblur="this.className='colorblur';" readonly
                   class=colorblur onfocus="this.className='colorfocus';"
                   maxLength=50 type=text value="${channel.id }" size="50">
        </TD>
    </TR>
</s:if>
<s:if test="%{channel.indexnum!=null && channel.indexnum > 0}">
    <TR>
        <TD width="30%" align="left">
            <LABEL id=ctl01_ctl00_label><IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl01_ctl00_imgHelp tabIndex=-1 title=栏目的唯一索引号
                    src="../../img/help.gif">
                <NOBR>
                    <SPAN id=ctl01_ctl00_lblLabel>索引号：</SPAN>
                </NOBR>
            </LABEL>
        </TD>
        <TD width="70%" align="left">
            <INPUT onblur="this.className='colorblur';" readonly
                   class=colorblur onfocus="this.className='colorfocus';"
                   maxLength=50 type=text value="${channel.indexNum }">
        </TD>
    </TR>
</s:if>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入栏目名称
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>栏目名称：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=name
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=channel.name value="${channel.name }">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入栏目的页面标识，用于唯一区分此栏目在页面中的位置。
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>页面标识：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=pagemark oninput="checkLoginName(this)"
               class=colorblur onfocus="this.className='colorfocus';" onpropertychange="checkLoginName(this)"
               maxLength=50 type=text name=channel.pageMark value="${channel.pageMark }">
    </TD>
</TR>

<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 title=请选择有效性
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>有效：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="radio" id="isok1" name="channel.state" value="1"
               <s:if test="channel==null || channel.state==null || channel.state==1">checked="checked"</s:if>>是
        <input type="radio" id="isok0" name="channel.state" value="0"
               <s:if test="channel.state==0">checked="checked"</s:if> >否
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 title=如果状态为是，则会在栏目导航中显示
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>导航：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="radio" id="isok1" name="channel.navigation" value="1"
               <s:if test="channel==null || channel.navigation==null || channel.navigation==1">checked="checked"</s:if>>是
        <input type="radio" id="isok0" name="channel.navigation" value="0"
               <s:if test="channel.navigation==0">checked="checked"</s:if> >否
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入排列顺序
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>序号：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=ordernum
               class=colorblur onfocus="this.className='colorfocus';" onkeyup=if(!isInt(value))execCommand('undo')
               onafterpaste=if(!isInt(value))execCommand('undo')
               maxLength=50 type=text name=channel.orderNum value="${channel.orderNum }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=此栏目的页面链接地址
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>链接地址：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=url
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=250 type=text size="45" name=channel.url value="${channel.url }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请选择此栏目的页面模板，默认为站点所选模板中的channel.html
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>栏目模板：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=templet readonly style="cursor:hand" title="点击选择模板文件"
               class=colorblur onfocus="this.className='colorfocus';"
               onclick="selectTempletFile('${site.indexTemplate }','templet')"
               maxLength=50 type=text name=channel.template value="${channel.template }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请选择此栏目的信息模板，默认为站点所选模板中的info.html
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>信息模板：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=contenttemplet readonly style="cursor:hand" title="点击选择模板文件"
               class=colorblur onfocus="this.className='colorfocus';"
               onclick="selectTempletFile('${site.indexTemplate }','contenttemplet')"
               maxLength=50 type=text name=channel.contentTemplate value="${channel.contentTemplate }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 title=请上传栏目图片
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>栏目图片：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="hidden" id="oldImg" name="oldImg" value="${channel.img }"/>
        <s:if test='%{channel.img!=null && channel.img != "" && channel.img != "null"}'>
							<span id="oldImgSpan">
							<a href="<%=basePath %>${channel.img }?date=<%=UUID.randomUUID() %>" target="_blank">
                                <img src="<%=basePath %>${channel.img }?date=<%=UUID.randomUUID() %>" width="180"
                                     height="42" title="点击查看大图"/>
                            </a>
							<a href="javascript:delImg()">删除</a>
							</span>
            <br/>
        </s:if>
        <input type="file" name="img" id="img">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入栏目的生成静态页面最大页数,0表示不限制。
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>生成静态页面最大页数：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=maxpage onkeyup=if(!isInt(value))execCommand('undo')
               onafterpaste=if(!isInt(value))execCommand('undo')
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=channel.maxPage value="${channel.maxPage }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 title=请选择此栏目下信息变更(添加、编辑、删除)后需要进行的静态化处理
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>当此栏目中的信息变更后：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="checkbox" name="channel.htmlChannel" value="1" ${"1" == channel.htmlChannel ?" checked ":"" }/>静态化所属栏目页面<br/>
        <input type="checkbox" name="channel.htmlChannelOld"
               value="1" ${"1" == channel.htmlChannelOld ?" checked ":"" }/>静态化原所属栏目页面<br/>
        <input type="checkbox" name="channel.htmlParChannel"
               value="1"  ${"1" == channel.htmlParChannel ?" checked ":"" }/>静态化所属栏目的所有父栏目页面<br/>
        <input type="checkbox" name="channel.htmlSite"
               value="1"  ${"1" == channel.htmlSite ?" checked ":"" }/>静态化站点首页<br/>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请设置静态化调度
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>静态化调度：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="hidden" name="htmlQuartz.id" value="${htmlQuartz.id }"/>
        <table>
            <tr>
                <td>
                    <select id="htmlquartzType" name="htmlQuartz.type" onchange="htmlquartzTypeChange(this)">
                        <option value="">无</option>
                        <option value="0" ${"0" == htmlQuartz.type ?"selected":"" }>定时生成栏目页</option>
                        <option value="1" ${"1" == htmlQuartz.type ?"selected":"" }>间隔重复生成栏目页</option>
                    </select>
                </td>
                <td id="exetimeTd" style="display:${"0" == htmlQuartz.type ?"block":"none" }">
                    <select id="exetimehour" name="htmlQuartz.exeTimeHour">
                        <s:iterator value="hours" id="obj">
                            <option value="${obj }"  ${obj == htmlQuartz.exeTimeHour ?"selected":"" }>${obj }</option>
                        </s:iterator>
                    </select>时
                    <select id="exetimemin" name="htmlQuartz.exeTimeMin">
                        <s:iterator value="mins" id="obj">
                            <option value="${obj }"  ${obj == htmlQuartz.exeTimeMin ?"selected":"" }>${obj }</option>
                        </s:iterator>
                    </select>分
                </td>
                <td id="intervalTd" style="display:${"1" == htmlQuartz.type ?"block":"none" }">
                    <table>
                        <tr>
                            <td>
                                间隔单位:
                                <select id="intervalType" name="htmlQuartz.intervalType"
                                        onchange="intervalTypeChange(this)">
                                    <option value="0" ${"0" == htmlQuartz.intervalType ?"selected":"" }>小时</option>
                                    <option value="1" ${"1" == htmlQuartz.intervalType ?"selected":"" }>分钟</option>
                                </select>
                            </td>
                            <td id="intervalhourTd" style="display:${"1" != htmlQuartz.intervalType ?"block":"none" }">
                                <select id="intervalhour" name="htmlQuartz.intervalHour">
                                    <s:iterator value="hours" id="obj">
                                        <option value="${obj }" ${obj == htmlQuartz.intervalHour ?"selected":"" }>${obj }</option>
                                    </s:iterator>
                                </select>时
                            </td>
                            <td id="intervalminTd" style="display:${"1" == htmlQuartz.intervaltype ?"block":"none" }">
                                <select id="intervalmin" name="htmlquartz.intervalmin">
                                    <s:iterator value="mins" id="obj">
                                        <option value="${obj }" ${obj == htmlquartz.intervalmin ?"selected":"" }>${obj }</option>
                                    </s:iterator>
                                </select>分
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入此栏目的描述
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>栏目描述：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="hidden" id="descOpenCloseV" value="0"/>
        <a href="#" onclick="descOpenClose()"><span id="descSpan">点击展开</span></a>
    </TD>
</TR>
<TR>
    <TD width="70%" align="left" colspan="10" id="dsecTd" style="display:none">
        <textarea cols="80" id="editor1" name="channel.description" rows="10">${channel.description }</textarea>
        <script type="text/javascript" src="<%=checkParentBasePath %>/admin/ckeditor/ckeditor.js?t=B37D54V"></script>
        <script type="text/javascript">//<![CDATA[
        CKEDITOR.replace('editor1', {"filebrowserImageBrowseUrl": "\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html?type=Images", "filebrowserBrowseUrl": "\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html", "filebrowserFlashBrowseUrl": "\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html?type=Flash", "filebrowserUploadUrl": "\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Files", "filebrowserImageUploadUrl": "\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Images", "filebrowserFlashUploadUrl": "\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Flash"});
        //]]></script>
        <input type="hidden" id="ckfinderCurrentFolder" value="${currentFolder }"/>
        <input type="hidden" id="ckfinderBasePath" value="<%=checkParentBasePath %>"/>
    </TD>
</TR>
<TR>
    <TD align="center" colspan="10">
        <input type="submit" value="保存" onclick="save(this.form)" class="button"/>&nbsp;
        <s:if test='%{channel!=null && channel.id != null && channel.id != "null" && channel.id != "" }'>
            <input type="button" value="删除" onclick="del('${channel.id }')" class="button"/>&nbsp;
            <input type="button" value="添加下级栏目" onclick="addSon('${channel.id }','${site.id }')" class="button"
                   <s:if test="%{!#session.siteAdmin}">style="display:none"</s:if>/>
            <input type="button" value="改变所属栏目" onclick="parButton('${channel.id }')" class="button"
                   <s:if test="%{!#session.siteAdmin}">style="display:none"</s:if>/>
        </s:if>
    </TD>
</TR>

</TBODY>
</TABLE>
</DIV>
</form>