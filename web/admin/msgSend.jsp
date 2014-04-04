<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../util/loading.jsp" %>
<%@include file="../util/checkParentFrame.jsp" %>

<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../img/style.css">
    <LINK rel=stylesheet type=text/css href="../img/style3.css">
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../js/check.js"></script>
    <script type="text/javascript" src="../js/checkAll.js"></script>

    <script type="text/javascript">
        function WebForm_OnSubmit() {
            if ($("#tomembernames").val() == "" && !isCheckName("membergroups")) {
                alert("请输入收信人或选择收信会员组!");
                $("#tomembernames").focus();
                return false;
            }
            if ($.trim($("#title").val()) == "") {
                alert("请输入标题！");
                $("#title").focus();
                return false;
            }
            if ($.trim($("#content").val()) == "") {
                alert("请输入内容！");
                $("#content").focus();
                return false;
            }
            if ($.trim($("#content").val()).length > 500) {
                alert("内容只能在500字以内！");
                $("#content").focus();
                return false;
            }
            return true;
        }
    </script>
</HEAD>
<BODY>
<FORM id=MyForm onsubmit="javascript:return WebForm_OnSubmit();"
      method=post name=MyForm action=msg_sendDo.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${pageFuncId }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            发送站内信
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
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入收信人
                            src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>收信人：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <INPUT onblur="this.className='colorblur';" id=tomembernames
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=500 type=text name=tomembernames value="">(多个之间用分号隔开)
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请选择收信组
                            src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>收信会员组：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="70%" align="left">
                    <s:iterator value="membergroupList" id="bean">
                        <s:if test='%{"0" == #bean.type}'>
                            <INPUT name="membergroups" type="checkbox" value="<s:property value="id"/>"/><s:property
                                value="name"/>
                        </s:if>
                    </s:iterator>
                    <br/>
                    <s:iterator value="membergroupList" id="bean">
                        <s:if test='%{"1" == #bean.type}'>
                            <INPUT name="membergroups" type="checkbox" value="<s:property value="id"/>"/><s:property
                                value="name"/>
                        </s:if>
                    </s:iterator>
                </TD>
            </TR>

            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入标题
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>标题：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <INPUT onblur="this.className='colorblur';" id=title
                           class=colorblur onfocus="this.className='colorfocus';"
                           maxLength=50 type=text name=msg.title value="">
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=请输入内容
                                src="../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>内容：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';"
                              maxLength=500 type=text id=content name=msg.content cols="50" rows="3"></textarea>
                    (500字以内)
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD height=30 colSpan=2 align=middle>
                    <input type="submit" value="发 送" class="button"/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

