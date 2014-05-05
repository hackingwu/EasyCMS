<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<input type="hidden" id="id" value="${templet.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
        <TBODY>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入模板名称
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>模板名称：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=name
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=templet.name value="${templet.name }">
                <SPAN id=ctl03>*</SPAN>
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
                <input type="radio" name="templet.state" value="1"
                       <s:if test="templet==null || templet.state==1">checked="checked"</s:if>>是
                <input type="radio" id="isok0" name="templet.state" value="0"
                       <s:if test="templet.state==0">checked="checked"</s:if> >否
            </TD>
        </TR>
        <TR>
            <TD align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入排序号
                            src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>排序号：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <input type="text" id="ordernum" value="${templet.ordernum }" name="templet.ordernum"
                       onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')
                       class="colorblur" onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=点击选择可使用此模板的站点，不选择则所有站点均可使用。
                            src="../../img/help.gif"/>
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>可使用的站点：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <textarea onblur="this.className='colorblur';" title="点击选择站点" style="cursor:hand"
                          class=colorblur onfocus="this.className='colorfocus';" readonly="readonly"
                          onclick="siteSelect()"
                          maxLength=50 type=text id=sitenames name=templet.usesitenames cols="40"
                          rows="3">${templet.usesitenames }</textarea>
                <a href="javascript:clearSite()" title="点击清除所有站点">清除</a>
                <input type="hidden" name="templet.usesites" id="siteid" value="${templet.usesites }"/>
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</DIV>
