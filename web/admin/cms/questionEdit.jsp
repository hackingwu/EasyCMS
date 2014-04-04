<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<input type="hidden" id="id" value="${question.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="99%" align=center>
        <TBODY>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入网上调查名称
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>网上调查名称：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=name
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=question.name value="${question.name }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>

        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择类型
                            src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>选择类型：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <input type="radio" name="question.selecttype" value="0"
                       <s:if test="question==null || question.selecttype==0">checked="checked"</s:if>>单选
                <input type="radio" id="selecttype1" name="question.selecttype" value="1"
                       <s:if test="question.selecttype==1">checked="checked"</s:if> >多选
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
                <input type="radio" name="question.isok" value="1"
                       <s:if test="question==null || question.isok==1">checked="checked"</s:if>>是
                <input type="radio" id="isok0" name="question.isok" value="0"
                       <s:if test="question.isok==0">checked="checked"</s:if> >否
            </TD>
        </TR>

        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入调查说明
                            src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>调查说明：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <textarea onblur="this.className='colorblur';"
                          class=colorblur onfocus="this.className='colorfocus';"
                          maxLength=50 type=text id=detail name=question.detail cols="40"
                          rows="6">${question.detail }</textarea>
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</DIV>
