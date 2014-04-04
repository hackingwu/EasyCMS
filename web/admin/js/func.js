function showOne() {
    $("#detail").fadeOut("slow");
    $("#one").fadeIn("slow");
}
function showDetail(id, name) {
    $("#one").fadeOut("slow");
    $.post("func_find.do", "func.id=" + id, findComplete, "text");
    $("#detail").fadeIn("slow");
}
function findComplete(data) {
    if (startsWith(data, "1")) {
        //成功
        var attrStr = data.substr(1, data.length - 1);
        var attr = attrStr.split("<属性>");
        if (attr != null && attr.length > 0) {
            $("#id").val(attr[0]);
            if (attr[1] != null) {
                $("#menuName").val(attr[1]);
            }
            if (attr[2] != null) {
                $("#show" + attr[2]).attr("checked", true);
            }
            if (attr[3] != null) {
                $("#menuOrder").val(attr[3]);
            }
            if (attr[4] != null) {
                $("#menuUrl").val(attr[4]);
            }
            if (attr[5] != null) {
                $("#parid").val(attr[5]);
            }

            document.getElementById("downButton").style.display = "block";
            document.getElementById("delButton").style.display = "block";
            document.getElementById("operButton").style.display = "block";
            document.getElementById("parButton").style.display = "block";
        }
    } else {
        //失败
        alert("获取失败");
    }
}
function addOne() {
    $("#one").fadeOut("slow");
    $("#detail").fadeIn("slow");
    hideButton();
    $("#parid").val("");
    $("#id").val("");
    $("#menuName").val("");
    $("#menuUrl").val("");
    $("#menuOrder").val("");
    $("#show1").attr("checked", true);
}
function addSon() {
    $("#one").fadeOut("slow");
    $("#detail").fadeIn("slow");
    hideButton();
    $("#parid").val($("#id").val());
    $("#id").val("");
    $("#menuName").val("");
    $("#menuUrl").val("");
    $("#menuOrder").val("");
    $("#show1").attr("checked", true);
}
function save() {
    if ($.trim($("#menuName").val()) == "") {
        alert("请输入菜单名称!");
        $("#menuName").focus();
        return false;
    }
    var html = $("#console").html();
    $("#console").html(new Date().toLocaleString() + " 正在保存菜单 " + $("#menuName").val() + " ...<br/>" + html);
    var isok = "1";
    if ($("#show0").attr("checked") == true) {
        isok = "0";
    }
    //单双引号替换
    $("#menuName").val(replaceAll(replaceAll($("#menuName").val(), "'", "‘"), "\"", "“"));
    $("#menuUrl").val(replaceAll(replaceAll($("#menuUrl").val(), "'", "‘"), "\"", "“"));
    //顺序不填写则设置为0
    if ($.trim($("#menuOrder").val()) == "") {
        $("#menuOrder").val("0");
    }
    var data = "pageContentNoFilter=1&func.parid=" + $("#parid").val() + "&func.id=" + $("#id").val()
        + "&func.name=" + $.trim(replaceAll($("#menuName").val(), "&", "<参数>")) + "&func.url=" + $.trim(replaceAll(url($("#menuUrl").val()), "&", "<参数>"))
        + "&func.ordernum=" + $.trim($("#menuOrder").val()) + "&func.isok=" + isok;
    $.post("func_save.do", data, saveComplete, "text");
}
function saveComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        if (startsWith(msg, "添加")) {
            var attr = msg.split("<属性>");
            $("#console").html(new Date().toLocaleString() + " " + attr[0] + "<br/>" + html);
            //判断父节点是否已加载过
            var loaded = false;
            var par = "root";
            if ($("#parid").val() != "") {
                par = $("#parid").val();
            }
            if (loadedNodes != null && loadedNodes.length > 0) {
                for (var i = 0; i < loadedNodes.length; i++) {
                    if (loadedNodes[i] == par) {
                        loaded = true;
                        break;
                    }
                }
            }
            //只有加载过的才需要处理
            if (loaded && attr[1] != null && attr[2] != null) {
                var branches = $("<li id=\"" + attr[1] + "\" class=\"hasChildren\">" +
                    "<span><a href=\"#\" onclick=\"showDetail('" + attr[1] + "','" + attr[2] + "')\">" + attr[2] + "</a>" +
                    "</span>" +
                    "<ul>" +
                    "	<li><span  >&nbsp;</span></li>" +
                    "</ul>" +
                    "</li>").appendTo("#" + par);
                $("#" + par).treeview({
                    add: branches
                });
            }
        } else if (startsWith(msg, "修改")) {
            $("#console").html(new Date().toLocaleString() + " " + msg + "<br/>" + html);
            //更新现在有节点名字
            var id = $.trim($("#id").val());
            $("#" + id).children("span").html($.trim($("#menuName").val()));
        }
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}
function del() {
    if (confirm("确定删除此菜单么?\n注意:删除此菜单将同时删除其子菜单.")) {
        var html = $("#console").html();
        $("#console").html(new Date().toLocaleString() + " 正在删除菜单 " + $("#menuName").val() + " ...<br/>" + html);
        $.post("func_del.do", "func.id=" + $("#id").val() + "&func.name=" + $.trim(replaceAll($("#menuName").val(), "&", "<参数>")), delComplete, "text");
    }
}
function delComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        var attr = msg.split("<属性>");
        $("#console").html(new Date().toLocaleString() + " " + attr[0] + "<br/>" + html);
        //删除此节点
        if (attr[1] != null) {
            $("#" + attr[1]).remove();
        }

        $("#one").fadeOut("slow");
        $("#detail").fadeIn("slow");
        hideButton();
        $("#parid").val("");
        $("#id").val("");
        $("#menuName").val("");
        $("#menuUrl").val("");
        $("#menuOrder").val("");
        $("#show1").attr("checked", true);
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}
function operButton() {
    $.weeboxs.open('operButton.jsp?id=' + $("#id").val(), {title: '管理操作按钮', contentType: 'ajax', height: 400, width: 672, showOk: false, showButton: false, showOk: false, showCancel: false});
}
function hideButton() {
    document.getElementById("downButton").style.display = "none";
    document.getElementById("delButton").style.display = "none";
    document.getElementById("operButton").style.display = "none";
    document.getElementById("parButton").style.display = "none";
}
function parButton() {
    $.weeboxs.open('funcPar.jsp?id=' + $("#id").val(), {title: '改变所属菜单', contentType: 'ajax', height: 400, width: 300, showOk: false});
}
function parButtonDo(id, name) {
    var html = $("#console").html();
    $("#console").html(new Date().toLocaleString() + " 正在改变菜单 " + $("#menuName").val() + " 的所属菜单为 " + name + " ...<br/>" + html);
    $.post("func_par.do", "func.id=" + $("#id").val() + "&func.parid=" + id + "&func.name=" + $.trim(replaceAll($("#menuName").val(), "&", "<参数>")) + "&parname=" + $.trim(replaceAll(name, "&", "<参数>")), parComplete, "text");
    $.weeboxs.close();
}
function parComplete(data) {
    var html = $("#console").html();
    var msg = data.substr(1, data.length - 1);
    if (startsWith(data, "1")) {
        //成功
        var attr = msg.split("<属性>");
        $("#console").html(new Date().toLocaleString() + " " + attr[0] + "<br/>" + html);
        //判断父节点是否已加载过
        var loaded = false;
        var par = "root";
        if (attr[2] != "") {
            par = attr[2];
        }
        if (loadedNodes != null && loadedNodes.length > 0) {
            for (var i = 0; i < loadedNodes.length; i++) {
                if (loadedNodes[i] == par) {
                    loaded = true;
                    break;
                }
            }
        }
        var name = $("#menuName").val();
        //删除此节点
        if (attr[1] != null) {
            $("#" + attr[1]).remove();
        }
        //只有加载过的才需要处理
        if (loaded && attr[1] != null) {
            var branches = $("<li id=\"" + attr[1] + "\" class=\"hasChildren\">" +
                "<span><a href=\"#\" onclick=\"showDetail('" + attr[1] + "','" + name + "')\">" + name + "</a>" +
                "</span>" +
                "<ul>" +
                "	<li><span  >&nbsp;</span></li>" +
                "</ul>" +
                "</li>").appendTo("#" + par);
            $("#" + par).treeview({
                add: branches
            });
        }
        $("#one").fadeOut("slow");
        $("#detail").fadeIn("slow");
        hideButton();
        $("#parid").val("");
        $("#id").val("");
        $("#menuName").val("");
        $("#menuUrl").val("");
        $("#menuOrder").val("");
        $("#show1").attr("checked", true);
    } else {
        //失败
        $("#console").html(new Date().toLocaleString() + " <font color='red'>" + msg + "</font><br/>" + html);
    }
}