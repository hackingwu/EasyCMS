<%@ page language="java" pageEncoding="UTF-8" %>
<%@   taglib uri="http://ckfinder.com" prefix="ckfinder" %>
<%@   taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="cn.freeteam.cms.model.Info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style3.css" type="text/css"/>
    <script src="../../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/templetFileEdit.js"></script>

</HEAD>
<BODY>
<FORM id=MyForm
      method=post name=MyForm action=templet_fileEditDo.do>
    <input type="hidden" value="${currFolder }" name="currFolder"/>
    <input type="hidden" value="${filePaths }" name="filePaths"/>

    <DIV class=tab>
        <DIV class=tabOn>
            文件编辑
        </DIV>
        <DIV class=clearer></DIV>
    </DIV>
    <DIV class=column>
        <TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
            <TBODY>


            <TR>
                <TD width="20%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入文件名
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>文件名：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="80%" align="left">
                    <INPUT onblur="this.className='inputblur';" id=fileName
                           class=inputblur onfocus="this.className='inputfocus';" size="45"
                           maxLength=250 type=text name=fileName value="${fileName }"/>
                    <select name="fileExt" id="fileExt">
                        <option value=".html">.html</option>
                        <option value=".js">.js</option>
                        <option value=".css">.css</option>
                        <option value=".txt">.txt</option>
                    </select>
                    <script>
                        var fileExtVal = "${fileExt}";
                        if (fileExtVal != "") {
                            $("#fileExt").val(fileExtVal);
                        }
                    </script>
                    <SPAN id=ctl03>*</SPAN>
                </TD>
            </TR>
            <TR>
                <TD width="20%" align="left">
                    <LABEL id=ctl01_ctl00_label><IMG
                            style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
                            id=ctl01_ctl00_imgHelp tabIndex=-1 alt=请输入文件内容
                            src="../../img/help.gif">
                        <NOBR>
                            <SPAN id=ctl01_ctl00_lblLabel>文件内容：</SPAN>
                        </NOBR>
                    </LABEL>
                </TD>
                <TD width="80%" align="left">
                    <textarea onblur="this.className='colorblur';"
                              class=colorblur onfocus="this.className='colorfocus';"
                              type=text id=fileContent name=fileContent
                              style="width:100%;height:380px">${fileContent }</textarea>
                </TD>
            </TR>

            <TR>
                <TD align="center" colspan="10">
                    <input type="button" value="保 存" onclick="save();" class="button"/>&nbsp;
                    <input type="button" value="返 回" onclick="history.back(-1);" class="button"/>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
    </DIV>

</FORM>
</BODY>
</HTML>

