<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@include file="../../util/loading.jsp" %>
<%@include file="../../util/checkParentFrame.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <link rel="stylesheet" href="../../img/common.css" type="text/css"/>
    <link rel="stylesheet" href="../../img/style.css" type="text/css"/>
    <LINK rel=stylesheet type=text/css href="../../img/style3.css">
    </script>
    </
    head >
    < body >
    < DIV
    class
    = tab >
            < DIV
    class
    = tabOn >
            站点初始化
            <
    /
    DIV >
    < DIV
    class
    = clearer > <
    /
    DIV >
    <
    /
    DIV >
    < DIV
    class
    = column >
            < div
    id = "man_zone" >
            < form
    action = "site_init.do" >
            < input
    type = "hidden"
    name = "site.id"
    value = "${site.id }" / >
            < input
    type = "hidden"
    name = "site.indextemplet"
    value = "${site.indextemplet }" / >
            您选择的站点模板有初始化数据
    ，
    是否对此站点进行初始化 ?
    <
    br / >
    < input
    type = "submit"
    class
    = "button"
    value = " 是(推荐) " / >
            < input
    type = "button"
    class
    = "button"
    value = " 否 "
    onclick = "location.href='site_edit.do?site.id=${site.id }';" / >
            <
    /
    form >
    <
    /
    div >
    <
    /
    DIV >

    <
    /
    body >
    <
    /
    html >
