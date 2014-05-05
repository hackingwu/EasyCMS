<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@page import="java.util.UUID" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
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
<script type="text/javascript" src="js/templetChannelEdit.js">
</script>
<form action="templetChannel_editDo.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="templet.id" id="templetId" value="${templet.id }">
<input type="hidden" name="templetChannel.templetid" value="${templet.id }">
<input type="hidden" name="templetChannel.parid" value="${templetChannel.parid }">
<input type="hidden" name="templetChannel.id" id="templetChannelId" value="${templetChannel.id }">

<DIV class=column>
<TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
<TBODY>
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
               maxLength=50 type=text name=templetChannel.name value="${templetChannel.name }">
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
        <INPUT onblur="this.className='colorblur';" id=pagemark
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=templetChannel.pagemark value="${templetChannel.pagemark }">
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
        <input type="radio" id="isok1" name="templetChannel.state" value="1"
               <s:if test="channel==null || templetChannel.state==null || templetChannel.state==1">checked="checked"</s:if>>是
        <input type="radio" id="isok0" name="templetChannel.state" value="0"
               <s:if test="templetChannel.state==0">checked="checked"</s:if> >否
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
        <input type="radio" id="isok1" name="templetChannel.navigation" value="1"
               <s:if test="channel==null || templetChannel.navigation==null || templetChannel.navigation==1">checked="checked"</s:if>>是
        <input type="radio" id="isok0" name="templetChannel.navigation" value="0"
               <s:if test="templetChannel.navigation==0">checked="checked"</s:if> >否
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
               maxLength=50 type=text name=templetChannel.ordernum value="${templetChannel.ordernum }">
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
               maxLength=250 type=text size="45" name=templetChannel.url value="${templetChannel.url }">
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
               onclick="selectTempletFile('${templet.id }','templet')"
               maxLength=50 type=text name=templetChannel.templet value="${templetChannel.templet }">
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
               onclick="selectTempletFile('${templet.id }','contenttemplet')"
               maxLength=50 type=text name=templetChannel.contenttemplet value="${templetChannel.contenttemplet }">
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
        <input type="hidden" id="oldImg" name="oldImg" value="${templetChannel.img }"/>
        <s:if test='%{templetChannel.img!=null && templetChannel.img != "" && templetChannel.img != "null"}'>
							<span id="oldImgSpan">
							<a href="<%=basePath %>templet/${templet.id }${templetChannel.img }?date=<%=UUID.randomUUID() %>"
                               target="_blank">
                                <img src="<%=basePath %>templet/${templet.id }${templetChannel.img }?date=<%=UUID.randomUUID() %>"
                                     width="180" height="42" title="点击查看大图"/>
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
        <input type="checkbox" name="templetChannel.htmlchannel"
               value="1" ${"1" == templetChannel.htmlchannel ?" checked ":"" }/>静态化所属栏目页面<br/>
        <input type="checkbox" name="templetChannel.htmlchannelold"
               value="1" ${"1" == templetChannel.htmlchannelold ?" checked ":"" }/>静态化原所属栏目页面<br/>
        <input type="checkbox" name="templetChannel.htmlparchannel"
               value="1"  ${"1" == templetChannel.htmlparchannel ?" checked ":"" }/>静态化所属栏目的所有父栏目页面<br/>
        <input type="checkbox" name="templetChannel.htmlsite"
               value="1"  ${"1" == templetChannel.htmlsite ?" checked ":"" }/>静态化站点首页<br/>
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

        <textarea onblur="this.className='colorblur';"
                  class=colorblur onfocus="this.className='colorfocus';"
                  name=templetChannel.description
                  style="width:100%;height:100px">${templetChannel.description }</textarea>

    </TD>
</TR>
<TR>
    <TD align="center" colspan="10">
        <input type="button" value="保存" onclick="save(this.form)" class="button"/>&nbsp;
        <s:if test='%{templetChannel!=null && templetChannel.id != null && templetChannel.id != "null" && templetChannel.id != "" }'>
            <input type="button" value="删除" onclick="del('${templetChannel.id }')" class="button"/>&nbsp;
            <input type="button" value="添加下级栏目" onclick="addSon('${templetChannel.id }','${templet.id }')"
                   class="button"/>
            <input type="button" value="改变所属栏目" onclick="parButton('${templetChannel.id }')" class="button"/>
        </s:if>
    </TD>
</TR>

</TBODY>
</TABLE>
</DIV>
</form>