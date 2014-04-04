<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/mailPro.js"></script>
    <script>
        function checkform() {
            if ($.trim($("#recontent").val()) == "") {
                alert("请输入办理结果");
                $("#recontent").focus();
                return false;
            }
            return true;
        }
    </script>
</HEAD>
<BODY>
<FORM id=MyForm onsubmit="return checkform()"
      method=post name=MyForm action=mail_proDo.do>
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
    <input type="hidden" name="mail.id" value="${mail.id }"/>
    <input type="hidden" name="mail.type" value="${mail.type }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            信件办理
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>


            <TR>
                <TD align="left">
                    <b>收信人</b>
                </TD>
                <TD align="left">${param.mail.type }
                    <s:if test="%{'unit' == mail.type}">
                        ${mail.unitname }
                    </s:if>
                    <s:if test="%{'user' == mail.type}">
                        ${mail.username }
                    </s:if>
                </TD>
                <TD align="left">
                    <b>信件类型</b>
                </TD>
                <TD align="left">
                    ${mail.mailtype }
                </TD>
            </TR>

            <TR>
                <TD align="left">
                    <b>信件标题</b>
                </TD>
                <TD align="left" colspan="3">
                    ${mail.title }
                </TD>
            </TR>

            <TR>
                <TD align="left">
                    <b>写信人姓名</b>
                </TD>
                <TD align="left">
                    ${mail.writer }
                </TD>
                <TD align="left">
                    <b>联系电话</b>
                </TD>
                <TD align="left">
                    ${mail.tel }
                </TD>
            </TR>

            <TR>
                <TD align="left">
                    <b>联系地址</b>
                </TD>
                <TD align="left">
                    ${mail.address }
                </TD>
                <TD align="left">
                    <b>电子信箱</b>
                </TD>
                <TD align="left">
                    ${mail.email }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>是否公开</b>
                </TD>
                <TD align="left" colspan="3">
                    ${"1"==mail.isopen?"是":"否" }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>信件内容</b>
                </TD>
                <TD align="left" colspan="3">
                    ${mail.content }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>添加时间</b>
                </TD>
                <TD align="left">
                    <s:date name="mail.addtime" format="yyyy-MM-dd"/>
                </TD>
                <TD align="left">
                    <b>IP</b>
                </TD>
                <TD align="left">
                    ${mail.ip }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>办理状态</b>
                </TD>
                <TD align="left" colspan="3">
                    ${"1"==mail.state?"已办结":"办理中" }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>转办流程</b>
                </TD>
                <TD align="left" colspan="3">
                    ${mail.proflow }
                </TD>
            </TR>
            <TR>
                <TD align="left">
                    <b>办理结果</b>
                </TD>
                <TD align="left" colspan="3">

                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';"
                              type=text id=recontent name=mail.recontent
                              style="width:100%;height:100px">${mail.recontent }</textarea>
                </TD>
            </TR>
            <s:if test="%{mail.retime != null}">
                <TR>
                    <TD align="left">
                        <b>办理时间</b>
                    </TD>
                    <TD align="left" colspan="3">
                        <s:date name="mail.retime" format="yyyy-MM-dd"/>
                    </TD>
                </TR>
            </s:if>
            <TR>
                <TD align="center" colspan="10">
                    <input type="submit" value="办 结" class="button"/>
                    <input type="button" value="返 回" class="button" onclick="history.back(-1);"/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

