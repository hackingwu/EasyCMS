<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="checkSelectSite.jsp" %>
<span id="loadspan" style="display:none">正在处理中,请稍候...</span>
<script>
    if (confirm("确实首页静态化操作么?")) {
        document.getElementById("loadspan").style.display = "block";
        location.href = "html_indexDo.do";
    }
</script>