<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="cn.freeteam.cms.model.Creditrule" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<input type="hidden" id="id" value="${creditrule.id }">

<DIV class=column>
    <TABLE cellSpacing=4 cellPadding=4 width="99%" align=center>
        <TBODY>


        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入积分规则编码
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>积分规则编码：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=code
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=creditrule.code value="${creditrule.code }">
                <SPAN id=ctl03>*</SPAN>
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入积分规则名称
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>积分规则名称：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=name
                       class=colorblur onfocus="this.className='colorfocus';"
                       maxLength=50 type=text name=creditrule.name value="${creditrule.name }">
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
                <INPUT onblur="this.className='colorblur';" id=ordernum
                       class=colorblur onfocus="this.className='colorfocus';"
                       onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')
                       maxLength=50 type=text name=creditrule.ordernum value="${creditrule.ordernum }">
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择规则类型
                            src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>类型：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <input type="radio" id="rewardtype1" name="creditrule.rewardtype" value="1" checked="checked">奖励
                <input type="radio" id="rewardtype0" name="creditrule.rewardtype" value="0"
                       <s:if test='%{creditrule.rewardtype == 0}'>checked="checked"</s:if>>惩罚
            </TD>
        </TR>

        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl02_ctl00_label>
                    <IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请选择奖励周期
                            src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl02_ctl00_lblLabel>奖励周期：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD align="left">
                <select name="creditrule.cycletype" id="cycletype" onchange="cycletypeChange(this)">
                    <option value="<%=Creditrule.CYCLETYPE_ONCE %>" ${0 == creditrule.cycletype?"selected":"" }>一次性
                    </option>
                    <option value="<%=Creditrule.CYCLETYPE_EVERYDAY %>" ${1 == creditrule.cycletype?"selected":"" }>
                        每天一次
                    </option>
                    <option value="<%=Creditrule.CYCLETYPE_INTERVAL %>" ${2 == creditrule.cycletype?"selected":"" }>
                        按间隔时间
                    </option>
                    <option value="<%=Creditrule.CYCLETYPE_UNLIMIT %>" ${4 == creditrule.cycletype?"selected":"" }>不限制
                    </option>
                </select>
            </TD>
        </TR>
        <TR id="cycletimeTr" style="display:${2 == creditrule.cycletype?"block":"none" }">
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入两次奖励间隔时间(分)
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>间隔时间(分)：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=cycletime
                       class=colorblur onfocus="this.className='colorfocus';"
                       onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')
                       maxLength=50 type=text name=creditrule.cycletime value="${creditrule.cycletime }">
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入最多奖励次数
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>最多奖励次数：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=rewardnum
                       class=colorblur onfocus="this.className='colorfocus';"
                       onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')
                       maxLength=50 type=text name=creditrule.rewardnum value="${creditrule.rewardnum }">
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入每次奖励或惩罚积分值
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>积分值：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=credit
                       class=colorblur onfocus="this.className='colorfocus';"
                       onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')
                       maxLength=50 type=text name=creditrule.credit value="${creditrule.credit }">
            </TD>
        </TR>
        <TR>
            <TD width="30%" align="left">
                <LABEL id=ctl01_ctl00_label><IMG
                        style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                        id=ctl01_ctl00_imgHelp tabIndex=-1 title=请输入每次奖励或惩罚经验值
                        src="../../img/help.gif">
                    <NOBR>
                        <SPAN id=ctl01_ctl00_lblLabel>经验值：</SPAN>
                    </NOBR>
                </LABEL>
            </TD>
            <TD width="70%" align="left">
                <INPUT onblur="this.className='colorblur';" id=experience
                       class=colorblur onfocus="this.className='colorfocus';"
                       onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')
                       maxLength=50 type=text name=creditrule.experience value="${creditrule.experience }">
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</DIV>
