<%@ page language="java" pageEncoding="UTF-8" %>
<%@   taglib uri="http://ckfinder.com" prefix="ckfinder" %>
<%@   taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="cn.freeteam.cms.model.Info" %>
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
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">

        function WebForm_OnSubmit() {
            if ($.trim($("#name").val()) == "") {
                alert("请输入职位名称!");
                $("#name").focus();
                return false;
            }
            return true;
        }
    </script>

</HEAD>
<BODY>
<FORM id=MyForm onsubmit="javascript:return WebForm_OnSubmit();"
      method=post name=MyForm action=job_editDo.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>
    <input type="hidden" name="job.id" value="${job.id }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            职位编辑
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>


            <input type="hidden" name="job.siteid" id="siteId" value="${manageSite.id }"/>

            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入职位名称
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>职位名称：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=name
                           class=inputblur onfocus="this.className='inputfocus';" size="45"
                           maxLength=20 type=text name=job.name value="${job.name }">
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入所属部门
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>所属部门：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=unitname
                           class=inputblur onfocus="this.className='inputfocus';"
                           maxLength=20 type=text size="45" name=job.unitname value="${job.unitname }">
                </TD>
            </TR>

            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入工作地点
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>工作地点：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=address
                           class=inputblur onfocus="this.className='inputfocus';"
                           maxLength=20 type=text size="45" name=job.address value="${job.address }">
                </TD>
            </TR>

            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入招聘人数
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>招聘人数：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=num onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo')
                           class=inputblur onfocus="this.className='inputfocus';"
                           maxLength=5 type=text size="5" name=job.num value="${job.num }">
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入工作职责
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>工作职责：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <textarea onblur="this.className='inputblur';"
                              class=inputblur onfocus="this.className='inputfocus';"
                              maxLength=50 type=text id=duty name=job.duty cols="40" rows="3">${job.duty }</textarea>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入职位要求
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>职位要求：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <textarea onblur="this.className='inputblur';"
                              class=inputblur onfocus="this.className='inputfocus';"
                              maxLength=50 type=text id=jobrequire name=job.jobrequire cols="40"
                              rows="3">${job.jobrequire }</textarea>
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
                    <input name="job.addtime" id="addtime" class="Wdate" type="text" size="18"
                           value="${job.addtimeStr }" onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd'})"/>

                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择结束时间
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>结束时间：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <input name="job.endtime" id="endtime" class="Wdate" type="text" size="18"
                           value="${job.endtimeStr }" onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd'})"/>

                </TD>
            </TR>
            <TR>
                <TD align="center" colspan="10">
                    <input type="submit" value="保 存" class="button"/>&nbsp;
                    <input type="button" value="返 回" onclick="history.back(-1)" class="button"/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

