<%@ page language="java" pageEncoding="UTF-8" %>
<%@   taglib uri="http://ckfinder.com" prefix="ckfinder" %>
<%@   taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="cn.freeteam.cms.model.Info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../../img/style.css">
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
    <script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/check.js"></script>
    <script type="text/javascript" src="../../js/checkAll.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
    <script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
    <link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css"/>
    <link rel="stylesheet" href="../../js/jquery.treeview.css"/>
    <script src="../../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../js/jquery.treeview.async.js" type="text/javascript"></script>

    <script type="text/javascript" src="js/templetList.js"></script>

</HEAD>
<BODY>
<FORM id=MyForm onsubmit="return addcheck()"
      method=post name=MyForm action=templet_editDo.do enctype="multipart/form-data">
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>

    <DIV class=tab>
        <DIV class=tabOn>
            添加模板
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
                           maxLength=50 type=text name=templet.name value="">
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
                    <input type="radio" name="templet.state" value="1" checked="checked">是
                    <input type="radio" id="isok0" name="templet.state" value="0">否
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
                    <input type="text" id="ordernum" value="" name="templet.ordernum"
                           onkeyup=if(!isInt(value))execCommand('undo')
                           onafterpaste=if(!isInt(value))execCommand('undo') class="colorblur"
                           onfocus="this.className='colorfocus';" onblur="this.className='colorblur';">
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
                              rows="3"></textarea>
                    <a href="javascript:clearSite()" title="点击清除所有站点">清除</a>
                    <input type="hidden" name="templet.usesites" id="siteid" value=""/>
                </TD>
            </TR>
            <TR>
                <TD width="30%" align="left">
                    <LABEL id=ctl02_ctl00_label>
                        <IMG
                                style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                                id=ctl02_ctl00_imgHelp tabIndex=-1 alt=点击选择模板文件。
                                src="../../img/help.gif"/>
                        <NOBR>
                            <SPAN id=ctl02_ctl00_lblLabel>模板文件：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD align="left">
                    <INPUT onblur="this.className='inputblur';" id=uploadFile
                           class=inputblur onfocus="this.className='inputfocus';"
                           size="45" type=file name=uploadFile value="">
                    <br/>(请上传格式为zip的压缩文件)
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

