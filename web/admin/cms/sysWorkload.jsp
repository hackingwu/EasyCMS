<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<HTML>
<HEAD>
    <LINK rel=stylesheet type=text/css href="../../img/style.css">
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
    <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="../../js/jquery.jqChart.css"/>
    <link rel="stylesheet" type="text/css" href="../../js/jquery.jqRangeSlider.css"/>
    <link rel="stylesheet" type="text/css" href="../../js/smoothness/jquery-ui-1.8.21.css"/>
    <script src="../../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.jqChart.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.jqRangeSlider.min.js" type="text/javascript"></script>
    <!--[if IE]>
    <script lang="javascript" type="text/javascript" src="../../js/excanvas.js"></script><![endif]-->
    <script lang="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#jqChart').jqChart({
                title: { text: '工作量统计' },
                axes: [
                    {
                        type: 'category',
                        location: 'bottom',
                        zoomEnabled: true
                    }
                ],
                series: [
                    {
                        title: '信息量',
                        type: 'column',
                        data: [
                            <s:iterator value="infoList" id="obj" status="st">
                            <s:if test="%{#st.index>0}">
                            ,
                            </s:if>
                            ['<s:property value="addUserLoginName"/> (<s:property value="addUserName"/>)', <s:property value="countnum"/>]
                            </s:iterator>
                        ]
                    },
                ]
            });
        });
    </script>
</HEAD>
<BODY style="padding:0;margin:0">
<form name="myForm" method="post" action="stat_sysWorkload.do" id="myForm"
      style="margin: 0px">
    <input type="hidden" name="pageFuncId" id="pageFuncId" value="${param.pageFuncId }"/>
    <input type="hidden" name="export" id="export" value=""/>

    <DIV class="column" style="width:99%">
        <div class="columntitle">
            工作量搜索
        </div>
        <TABLE width="100%" border=0 align=center cellpadding="2"
               cellspacing="0">
            <TBODY>
            <TR class=summary-title>
                <TD height="30" align=left style="padding-left: 10px;">

                    添加人：

                    <input name="info.adduserLike" type="text" maxlength="50" value="${ info.adduserLike}"
                           class="colorblur" onfocus="this.className='colorfocus';"
                           onblur="this.className='colorblur';"/>
                    时间范围：
                    <input name="info.infostarttime" id="starttime" class="Wdate" type="text" size="24"
                           value="${info.infostarttimeStr }"
                           onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    至
                    <input name="info.infoendtime" id="endtime" class="Wdate" type="text" size="24"
                           value="${info.infoendtimeStr }"
                           onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>

                    最多显示条数：
                    <select name="pageSize"
                            id="pageSize">
                        <option selected="selected" value="10">
                            10
                        </option>
                        <option value="30">
                            30
                        </option>
                        <option value="50">
                            50
                        </option>
                        <option value="100">
                            100
                        </option>
                        <option value="200">
                            200
                        </option>
                        <option value="300">
                            300
                        </option>

                    </select>


                    <input type="button" name="Search" value="搜 索" id="Search"
                           onclick="$('#export').val('');this.form.submit();"
                           class="button" style="MARGIN-BOTTOM: 0px"/>

                    <input type="button" name="Search" value="导 出" id="Search"
                           onclick="$('#export').val('1');this.form.submit();"
                           class="button" style="MARGIN-BOTTOM: 0px"/>
                </TD>
            </TR>

            </TBODY>
        </TABLE>
    </DIV>
</form>
<DIV class="column" style="width:99%">
    <div class="columntitle">
        工作量列表(信息总量:${sum })
    </div>

    <div>
        <div id="jqChart" style="width: 99%; height: 300px;">
        </div>
    </div>
    <table id="MyDataList" cellspacing="1" cellpadding="1"
           Align="center" border="0" border="0"
           style="width: 100%; word-break: break-all">
        <TR class="summary-title" style="HEIGHT: 25px" align="center">
            <TD>
                添加人
            </TD>
            <TD>
                信息量
            </TD>
        </TR>

        <s:iterator value="infoList" id="obj" status="bean">
            <TR class="tdbg" onMouseOver="this.className='tdbg-dark';" id="tr<s:property value="id"/>"
                style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">

                <TD align="left" id="adduser<s:property value="id"/>">
                    <s:property value="addUserLoginName"/> (<s:property value="addUserName"/>)
                </TD>
                <TD align="left" id="countnum<s:property value="id"/>">
                    <s:property value="countnum"/>
                </TD>
            </TR>
        </s:iterator>
        <TR class="tdbg"
            style="HEIGHT: 25px">
            <TD align="center" colspan="10">
                <b><font color="red">
                    <s:if test="%{totalCount>pageSize}">
                        总共有${totalCount }条数据，只显示前${pageSize }条，如果没有您要统计的人员，您可以尝试搜索添加人。
                    </s:if></font></b>
            </TD>
        </TR>
    </table>

</DIV>

<table width="95%" align="center">
    <tr>
        <td align="right">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left">
                        <fs:operButtons/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</BODY>
</HTML>

