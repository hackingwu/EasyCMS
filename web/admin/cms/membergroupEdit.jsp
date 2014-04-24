<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="java.util.UUID" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<HTML>
<HEAD>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script type="text/javascript" src="../../js/jscolor/jscolor.js"></script>
    <script type="text/javascript" src="js/membergroupEdit.js"></script>

</HEAD>
<BODY>
<FORM id=MyForm
      method=post name=MyForm action=membergroup_editDo.do enctype="multipart/form-data">
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>
    <input type="hidden" name="membergroup.id" value="${membergroup.id }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            会员组编辑
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
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择会员组类型
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>会员组类型：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <input type="radio" id="type0" onclick="typeChange(0)" name="membergroup.type" value="0"
                           <s:if test="membergroup==null || membergroup.type==null || membergroup.type==0">checked="checked"</s:if> >经验会员组
                    <input type="radio" id="type1" onclick="typeChange(1)" name="membergroup.type" value="1"
                           <s:if test="membergroup.type==1">checked="checked"</s:if>>特殊会员组
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入会员组名称
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>名称：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=name
                           class=inputblur onfocus="this.className='inputfocus';"
                           maxLength=50 type=text name=membergroup.name value="${membergroup.name }">
                    <SPAN id=ctl03>*</SPAN>
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
                    <INPUT onblur="this.className='inputblur';" id=orderNum
                           class=inputblur onfocus="this.className='inputfocus';"
                           onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo')
                           maxLength=50 type=text name=membergroup.orderNum value="${membergroup.orderNum }">
                </TD>
            </TR>
            <TR id="beginexperienceTr">
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入开始经验值
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>经验值大于：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=beginexperience
                           class=inputblur onfocus="this.className='inputfocus';"
                           onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo')
                           maxLength=50 type=text name=membergroup.beginexperience
                           value="${membergroup.beginexperience }">
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传图标
                                src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>图标：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <input type="hidden" id="oldImg" name="oldImg" value="${membergroup.img }"/>
                    <s:if test='%{membergroup.img!=null && membergroup.img != "" && membergroup.img != "null"}'>
							<span id="oldImgSpan">
							<a href="<%=basePath %>${membergroup.img }?date=<%=UUID.randomUUID() %>" target="_blank">
                                <img src="<%=basePath %>${membergroup.img }?date=<%=UUID.randomUUID() %>" width="180"
                                     height="42" title="点击查看大图"/>
                            </a>
							<a href="javascript:delImg()">删除</a>
							</span>
                        <br/>
                    </s:if>
                    <input type="file" name="img" onblur="this.className='inputblur';"
                           class=inputblur onfocus="this.className='inputfocus';" id="img">
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择颜色
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>颜色：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT id=color
                           class="color"
                           maxLength=50 type=text name=membergroup.color
                           value="${membergroup.color }<s:if test="membergroup==null || membergroup.color == null || membergroup.color ==''">000000</s:if>">
                </TD>
            </TR>
            <TR id="beginexperienceTr">
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 title=请设置附件最大大小
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>附件最大大小：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=maxattchsize
                           class=inputblur onfocus="this.className='inputfocus';"
                           onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo')
                           maxLength=50 type=text name=membergroup.maxattchsize value="${membergroup.maxattchsize }">
                    (MB)
                </TD>
            </TR>
            <TR id="beginexperienceTr">
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 title=请设置最大好友数
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>最大好友数：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=maxfriendnum
                           class=inputblur onfocus="this.className='inputfocus';"
                           onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo')
                           maxLength=50 type=text name=membergroup.maxfriendnum value="${membergroup.maxfriendnum }">

                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择评论是否需要审核
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>评论是否需要审核：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <input type="radio" id="commentneedcheck1" name="membergroup.commentneedcheck" value="1"
                           <s:if test="membergroup==null || membergroup.commentneedcheck==null || membergroup.commentneedcheck==1">checked="checked"</s:if>>是
                    <input type="radio" id="commentneedcheck0" name="membergroup.commentneedcheck" value="0"
                           <s:if test="membergroup.commentneedcheck==0">checked="checked"</s:if> >否
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD align="center" colspan="10">
                    <input type="button" value="保 存" onclick="save()" class="button"/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

