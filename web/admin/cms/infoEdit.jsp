<%@ page language="java" pageEncoding="UTF-8" %>
<%--<%@   taglib uri="http://ckfinder.com" prefix="ckfinder" %>--%>
<%--<%@   taglib uri="http://ckeditor.com" prefix="ckeditor" %>--%>
<%@page import="cn.easycms.model.Info" %>
<%@page import="java.net.URLDecoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@include file="checkSelectSite.jsp" %>
<HTML>
<HEAD>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>
    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
    <script type="text/javascript" src="../../js/jscolor/jscolor.js"></script>
    <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/infoEdit.js"></script>
    <script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="../../js/ckfinderUtil.jsp"></script>

</HEAD>
<BODY>
<FORM id=MyForm
      method=post name=MyForm action=info_editDo.do enctype="multipart/form-data">
<input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>
<input type="hidden" name="info.id" value="${info.id }"/>
<input type="hidden" name="type"
       value="<%=((request.getParameter("channel.id")!=null || request.getParameter("info.id")!=null)?"channel":"quick") %>"/>

<DIV class=tab>
    <DIV class=tabOn>
        信息编辑
    </DIV>
    <DIV class=clearer></DIV>
</DIV>
<DIV class=column>
<TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
<TBODY>


<input type="hidden" name="info.site" id="siteId" value="${site.id }"/>
<s:if test="%{info.htmlIndexNum!=null}">
    <TR>
        <TD width="30%" align="left">
            <LABEL id=ctl01_ctl00_label><IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl01_ctl00_imgHelp tabIndex=-1 title=信息的唯一索引号，生成静态页面时使用
                    src="../../img/help.gif">
                <NOBR>
                    <SPAN id=ctl01_ctl00_lblLabel>html索引号：</SPAN>
                </NOBR>
            </LABEL>
        </TD>
        <TD width="70%" align="left">
            <INPUT onblur="this.className='inputblur';" readonly
                   class=inputblur onfocus="this.className='inputfocus';"
                   maxLength=250 type=text value="${info.htmlIndexNum }">
        </TD>
    </TR>
</s:if>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择栏目
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>栏目：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="hidden" name="info.channel" id="channelId" value="${channel.id }"/>
        <input type="hidden" name="oldChannelId" value="${channel.id }"/>
        <INPUT onblur="this.className='inputblur';" readonly id="channelName" onclick="selectChannel()"
               class=inputblur onfocus="this.className='inputfocus';" style="cursor:hand" title="点击选择栏目"
               maxLength=50 type=text name=channel.name value="${channel.name }"/>
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入标题
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>标题：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=title
               class=inputblur onfocus="this.className='inputfocus';" size="45"
               maxLength=250 type=text name=info.title value="${info.title }">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=在列表中显示，留空则显示完整标题
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>短标题：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=shortTitle
               class=inputblur onfocus="this.className='inputfocus';"
               maxLength=250 type=text size="45" name=info.shortTitle value="${info.shortTitle }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择生成信息静态页面的信息模板
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>信息模板：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=templet readonly style="cursor:hand" title="点击选择模板文件"
               class=inputblur onfocus="this.className='inputfocus';" onclick="selectTempletFile('templet')"
               maxLength=50 type=text name=info.template value="${info.template }"/>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择标题颜色
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>标题颜色：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT id=titleColor
               class="color"
               maxLength=50 type=text name=info.titleColor
               value="${info.titleColor }<s:if test="info==null || info.titleColor == null || info.titleColor ==''">000000</s:if>">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择标题是否加粗
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>标题是否加粗：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="radio" id="isblob1" name="info.titleBlod" value="1"
               <s:if test="info.titleBlod==1">checked="checked"</s:if>>是
        <input type="radio" id="isblob0" name="info.titleBlod" value="0"
               <s:if test="info==null || info.titleBlod==null || info.titleBlod==0">checked="checked"</s:if> >否
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息来源
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>来源：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=source
               class=inputblur onfocus="this.className='inputfocus';"
               maxLength=50 type=text name=info.source value="${info.source }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息作者
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>作者：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=author
               class=inputblur onfocus="this.className='inputfocus';"
               maxLength=50 type=text name=info.author value="${info.author }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息摘要
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>摘要：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <textarea onblur="this.className='inputblur';"
                  class=inputblur onfocus="this.className='inputfocus';"
                  maxLength=500 type=text id=description name=info.description cols="40"
                  rows="3">${info.description }</textarea>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left" colspan="10">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入信息内容
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>信息内容：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
</TR>
<TR>
    <TD width="70%" align="left" colspan="10">
        <textarea cols="80" id="editor1" name="info.content" rows="10">${info.content }</textarea>
        <script type="text/javascript" src="<%=checkParentBasePath %>admin/ckeditor/ckeditor.js?t=B37D54V"></script>
        <script type="text/javascript">//<![CDATA[
        CKEDITOR.replace('editor1', {"filebrowserImageBrowseUrl": "\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html?type=Images", "filebrowserBrowseUrl": "\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html", "filebrowserFlashBrowseUrl": "\<%=checkParentBasePath %>admin\/ckfinder\/ckfinder.html?type=Flash", "filebrowserUploadUrl": "\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Files", "filebrowserImageUploadUrl": "\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Images", "filebrowserFlashUploadUrl": "\<%=checkParentBasePath %>ckfinder\/core\/connector\/java\/connector.java?command=QuickUpload&type=Flash"});
        //]]></script>
        <input type="hidden" id="ckfinderCurrentFolder" value="${currentFolder }"/>
        <input type="hidden" id="ckfinderBasePath" value="<%=checkParentBasePath %>"/>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否热点
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>是否热点：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="radio" id="ishot1" name="info.isHot" value="1" <s:if test="info.isHot==1">checked="checked"</s:if>>是
        <input type="radio" id="ishot0" name="info.isHot" value="0"
               <s:if test="info==null || info.isHot==null || info.isHot==0">checked="checked"</s:if> >否

    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否固顶
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>是否固顶：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="radio" id="istop1" onclick="istop(1)" name="info.isTop" value="1"
               <s:if test="info.isTop==1">checked="checked"</s:if>>是
        <input type="radio" id="istop0" onclick="istop(0)" name="info.isTop" value="0"
               <s:if test="info==null || info.isTop==null || info.isTop==0">checked="checked"</s:if> >否
        <input name="info.topEndTime" id="topEndTime" style="display:none"<s:if
                test="info==null || info.isTop==null || info.isTop==0"></s:if> class="Wdate" title="选择固顶结束时间，没有则表示永远固顶!"
               type="text" size="24" value="${info.topEndTimeStr }"
               onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>

    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否评论
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>是否评论：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="radio" id="iscomment0" name="info.isComment" value="0"
               <s:if test="info==null || info.isComment==null || info.isComment==0">checked="checked"</s:if>>否
        <input type="radio" id="iscomment1" name="info.iscomment" value="1"
               <s:if test="info.iscomment==1">checked="checked"</s:if> >会员评论
        <input type="radio" id="iscomment2" name="info.iscomment" value="2"
               <s:if test="info.iscomment==2">checked="checked"</s:if> >会员和匿名评论
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否签收
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>是否签收：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="radio" id="issign1" onclick="issign(1)" name="info.issign" value="1"
               <s:if test="info.issign==1">checked="checked"</s:if>>是
        <input type="radio" id="issign0" onclick="issign(0)" name="info.issign" value="0"
               <s:if test="info==null || info.issign==null || info.issign==0">checked="checked"</s:if> >否

    </TD>
</TR>
<TR style="display:${"1"==info.issign?"block":"none" }" id="signtr">
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择签收用户
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>签收用户：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="checkbox" onclick="checkallsign(this.checked)">全部<br/>
        <table>
            <tr>
                <s:iterator value="userList" id="obj" status="bean">
                    <td><input name="signusers"

                    <s:iterator value="infoSignList" id="infosign">
                        ${obj.id == infosign.userid ?"checked":"" }
                    </s:iterator>
                               type="checkbox" value="<s:property value="id"/>"><s:property value="name"/></td>
                    ${(bean.index+1)%6==0?"</tr><tr>":""  }
                </s:iterator>
            </tr>
        </table>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入索引号，政府信息公开使用
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>政府信息索引号：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=indexnum size="50"
               class=inputblur onfocus="this.className='inputfocus';"
               maxLength=50 type=text name=info.indexnum value="${info.indexnum }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择政府信息公开形式
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>政府信息公开形式：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="radio" name="info.opentype" value="1"
               <s:if test="info==null || info.opentype==null || info.opentype==1">checked="checked"</s:if>>主动公开
        <input type="radio" name="info.opentype" value="0"
               <s:if test="info.opentype==0">checked="checked"</s:if> >依申请公开

    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择政府信息公开时限
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>政府信息公开时限：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="radio" id="opentimetype1" onclick="opentimetype(1)" name="info.opentimetype" value="1"
               <s:if test="info==null || info.opentimetype==null || info.opentimetype==1">checked="checked"</s:if>>常年公开
        <input type="radio" id="opentimetype0" onclick="opentimetype(0)" name="info.opentimetype" value="0"
               <s:if test="info.opentimetype==0">checked="checked"</s:if> >限时公开
        <input name="info.openendtime" id="openendtime" style="display:${"0"==info.opentimetype?"block":"none"}"
               class="Wdate"
               title="选择公开结束时间，没有则表示常年公开!" type="text" size="24" value="${info.openendtimeStr }"
               onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>

    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入Tag标签，用,分隔
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>Tag标签：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=tags
               class=inputblur onfocus="this.className='inputfocus';"
               maxLength=50 type=text name=info.tags value="${info.tags }">多个标签之间用,分隔
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入外部链接,输入后点击此信息标题会直接进入此外部链接
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>外部链接：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=url
               class=inputblur onfocus="this.className='inputfocus';"
               maxLength=250 size="45" type=text name=info.url value="${info.url }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入视频地址或上传视频文件
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>视频：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        视频地址:<INPUT onblur="this.className='inputblur';" id=video
                    class=inputblur onfocus="this.className='inputfocus';"
                    maxLength=250 size="45" type=text name=info.video value="${info.video }"><br>
        视频上传:<INPUT onblur="this.className='inputblur';" id=videoUpload
                    class=inputblur onfocus="this.className='inputfocus';"
                    size="45" type=file name=videoUpload value="">
        <br/>(请上传格式为flv的视频文件,最大支持1G)
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传信息图片集
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>图片集：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="hidden" name="delOldimgs" id="delOldimgs"/>

        <div id="imgs">
            <s:iterator value="infoImgList" id="bean">
                <table id='oldimgtable<s:property value="id"/>'>
                    <tr>
                        <td rowspan='4'>
                            <input type='hidden' name='oldimgsid<s:property value="id"/>'
                                   value='<s:property value="id"/>'>
                            <input type='hidden' name='oldimgsurl<s:property value="id"/>'
                                   value='<s:property value="img"/>'><a href='<s:property value="img"/>'
                                                                        target='_blank'>
                            <img src='<s:property value="img"/>' width='150' height='120' title='点击查看大图'/></a></td>
                        <td>标题:</td>
                        <td><INPUT onblur="this.className='inputblur';" class=inputblur
                                   onfocus="this.className='inputfocus';" maxLength=250 size=40 type=text
                                   name=oldimgstitle<s:property value="id"/> value='<s:property value="title"/>'/></td>
                    </tr>
                    <tr>
                        <td>顺序:</td>
                        <td><INPUT onblur="this.className='inputblur';" class=inputblur
                                   onfocus="this.className='inputfocus';" onkeyup=if(!isInt(value))execCommand('undo')
                                   onafterpaste=if(!isInt(value))execCommand('undo') .
                            maxLength=10 size=4 type=text name=oldimgsordernum<s:property value="id"/>
                            value='<s:property value="ordernum"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td>描述:</td>
                        <td><textarea class=inputblur onfocus="this.className='inputfocus';"
                                      onblur="this.className='inputblur';if(this.value.length>500){alert('最多500个字符');this.focus()}"
                                      name=oldimgscontent<s:property value="id"/> cols=40 rows=3><s:property
                                value="content"/></textarea>(最多500个字符)
                        </td>
                    </tr>
                    <tr>
                        <td><input type='button' class='button' value='删 除'
                                   onclick="delOldImgs('<s:property value="id"/>');"/></td>
                        <td></td>
                    </tr>
                </table>
            </s:iterator>
        </div>
        <input type="button" class="button" value="添加图片" onclick="selectImgs()"/>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传信息图片
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>信息图片：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="hidden" name="info.img" id="img" value="${info.img }"/>
							<span id="imgSpan">
							<s:if test='%{info.img!=null && info.img != "" && info.img != "null"}'>
                                <a href="${info.img }?date=<%=UUID.randomUUID() %>" target="_blank">
                                    <img src="${info.img }?date=<%=UUID.randomUUID() %>" width="100" height="100"
                                         title="点击查看大图"/>
                                </a>
                            </s:if>
							</span>

        <s:if test='%{info.img!=null && info.img != "" && info.img != "null"}'>
            <a style="display:block" id="imgDelBtn" href="javascript:delImg()">删除</a>
        </s:if>
        <s:if test='%{info.img==null || info.img == "" || info.img == "null"}'>
            <a style="display:none" id="imgDelBtn" href="javascript:delImg()">删除</a>
        </s:if>
        <br/>
        <input type="button" class="button" value="选择图片" onclick="selectImg()"/>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请上传附件
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>附件：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="hidden" name="info.attchs" id="attchs" value="${info.attchs }"/>
							<span id="attchSpan">
								<%
                                    //获取附件列表
                                    if (request.getAttribute("info") != null) {
                                        Info info = (Info) request.getAttribute("info");
                                        if (info != null && info.getAttchs() != null && info.getAttchs().trim().length() > 0) {
                                            String[] attchs = info.getAttchs().split(";");
                                            if (attchs != null && attchs.length > 0) {
                                                for (int i = 0; i < attchs.length; i++) {
                                                    if (attchs[i].trim().length() > 0) {
                                                        String id = UUID.randomUUID().toString();
                                                        out.println("<span id='attch" + id + "' value='" + attchs[i] + "'><br><a  href='" + attchs[i] + "' target='_blank' title='点击下载'>" +
                                                                URLDecoder.decode(attchs[i].substring(attchs[i].lastIndexOf("/") + 1), "utf-8") +
                                                                "</a>&nbsp;&nbsp;<a  href='javascript:delAttch(\"" + id + "\")'>删除</a></span>");
                                                    }
                                                }
                                            }
                                        }
                                    }

                                %>
							</span><br/>
        <input type="button" class="button" value="添加附件" onclick="selectFile()"/>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择添加时间，默认是当前时间
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>添加时间：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input name="info.addtime" id="addtime" class="Wdate" type="text" size="24" value="${info.addtimeStr }"
               onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>

    </TD>
</TR>
<TR>
    <TD align="center" colspan="10">
        <input type="button" value="保 存" onclick="save()" class="button"/>&nbsp;
        <input type="button" value="返 回" onclick="history.back(-1)" class="button"/>
    </TD>
</TR>
</TBODY>
</TABLE>
</DIV>

</FORM>
</BODY>
</HTML>

