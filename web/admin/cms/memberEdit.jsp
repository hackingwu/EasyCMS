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
    <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"
            defer="defer"></script>
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script type="text/javascript" src="../../js/checkLoginName.js"></script>
    <script type="text/javascript" src="js/memberEdit.js"></script>

</HEAD>
<BODY>
<FORM id=MyForm
      method=post name=MyForm action=member_editDo.do enctype="multipart/form-data">
<input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>
<input type="hidden" name="member.id" id="id" value="${member.id }"/>

<DIV class=tab>
    <DIV class=tabOn>
        会员编辑
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
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择会员类型
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>会员类型：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <table>
            <tr>
                <td>
                    <input type="radio" id="type0" onclick="typeChange(0)" name="member.grouptype" value="0"
                           <s:if test="member==null || member.grouptype==null || member.grouptype==0">checked="checked"</s:if> >经验会员
                    ${membergroup.name }
                </td>
                <td>
                    <input type="radio" id="type1" onclick="typeChange(1)" name="member.grouptype" value="1"
                           <s:if test="member.grouptype==1">checked="checked"</s:if>>特殊会员
                </td>
                <td id="groupidTd" style="display:${1==member.grouptype?"block":"none" }">
                    <select name="member.groupid">
                        <s:iterator value="membergroupList" id="bean">
                        <option value="<s:property value="id"/>" ${bean.id == member.groupid ?"selected":"" }>
                                <s:property value="name"/>
                            </s:iterator>
                    </select>
                </td>
                <td>
                    <SPAN id=ctl03>*</SPAN>
                </td>
            </tr>
        </table>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl01_ctl00_imgHelp tabIndex=-1 alt=会员登录系统使用的登录名
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>登录名：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=loginname oninput="checkLoginName(this)"
               class=colorblur onfocus="this.className='colorfocus';" ${not empty member.id ?"readonly='readonly'":"" }
               maxLength=50 type=text name=member.loginname value="${member.loginname }"
               onpropertychange="checkLoginName(this)">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入会员名称
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>名称：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=name
               class=inputblur onfocus="this.className='inputfocus';"
               maxLength=50 type=text name=member.name value="${member.name }">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>

<TR style="display:${not empty member.id ?"block":"none" }">
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择是否修改密码
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>修改密码：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <input type="checkbox" id="editpwd" name="editpwd" value="1" onclick="iseditpwd(this.checked)">我要修改密码
    </TD>
</TR>
<TR id="pwdTr" style="display:${not empty member.id ?"none":"block" }">
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl01_ctl00_imgHelp tabIndex=-1 alt=会员登录系统使用的密码
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>登录密码：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=pwd type="password"
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=member.pwd value="">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<TR id="repwdTr" style="display:${not empty member.id ?"none":"block" }">
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl01_ctl00_imgHelp tabIndex=-1 alt=再输入一次会员登录系统使用的密码
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>确认登录密码：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='colorblur';" id=repwd type="password"
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text value="">
        <SPAN id=ctl03>*</SPAN>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择性别
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>性别：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="radio" name="member.sex" value="1" checked="checked">男
        <input type="radio" name="member.sex" value="0" <s:if test='%{member.sex == "0"}'>checked="checked"</s:if>>女
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=输入出生日期
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>出生日期：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input name="member.birthday" id="birthday" class="Wdate" type="text" size="14" value="${member.birthdayStr }"
               onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})"/>
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=输入联系电话
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>联系电话：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <INPUT onblur="this.className='colorblur';"
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=member.tel value="${member.tel }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=输入手机
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>手机：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <INPUT onblur="this.className='colorblur';"
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=member.mobilephone value="${member.mobilephone }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入正确的电子邮箱，密码找回时需要此邮箱地址！
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>电子邮箱：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <INPUT onblur="this.className='colorblur';" id="email"
               class=colorblur onfocus="this.className='colorfocus';"
               maxLength=50 type=text name=member.email value="${member.email }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请上传头像
                    src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>头像：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <input type="hidden" id="oldImg" name="oldImg" value="${member.img }"/>
        <s:if test='%{member.img!=null && member.img != "" && member.img != "null"}'>
							<span id="oldImgSpan">
							<a href="<%=basePath %>${member.img }?date=<%=UUID.randomUUID() %>" target="_blank">
                                <img src="<%=basePath %>${member.img }?date=<%=UUID.randomUUID() %>" width="180"
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

<TR id="beginexperienceTr">
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入经验值
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>经验值：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=experience
               class=inputblur onfocus="this.className='inputfocus';" onkeyup=if(!isInt(value))execCommand('undo')
               onafterpaste=if(!isInt(value))execCommand('undo')
               maxLength=50 type=text name=member.experience value="${member.experience }">
    </TD>
</TR>
<TR id="beginexperienceTr">
    <TD width="30%" align="left">
        <LABEL id=ctl01_ctl00_label><IMG
                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入积分值
                src="../../img/help.gif">
            <NOBR>
                <SPAN id=ctl01_ctl00_lblLabel>积分值：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD width="70%" align="left">
        <INPUT onblur="this.className='inputblur';" id=credit
               class=inputblur onfocus="this.className='inputfocus';" onkeyup=if(!isInt(value))execCommand('undo')
               onafterpaste=if(!isInt(value))execCommand('undo')
               maxLength=50 type=text name=member.credit value="${member.credit }">
    </TD>
</TR>
<TR>
    <TD width="30%" align="left">
        <LABEL id=ctl02_ctl00_label>
            <IMG
                    style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                    id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入简介(200字以内)
                    src="../../img/help.gif"/>
            <NOBR>
                <SPAN id=ctl02_ctl00_lblLabel>简介：</SPAN>
            </NOBR>
        </LABEL>
    </TD>
    <TD align="left">
        <textarea onblur="this.className='colorblur';"
                  class=colorblur onfocus="this.className='colorfocus';"
                  maxLength=50 type=text id=intro name=member.intro cols="40" rows="3">${member.intro }</textarea>
        (200字以内)
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

