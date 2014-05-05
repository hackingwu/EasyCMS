//添加
function add() {
    location.href = "templateAdd.jsp?pageFuncId=" + $("#pageFuncId").val();
    /*$.weeboxs.open('templet_edit.do', {title:'添加模板', contentType:'ajax',height:210,width:500,
     onok:function(){
     if($.trim($("#name").val())==""){
     alert("请输入名称!");
     $("#name").focus();
     return false;
     }
     //成功
     var isok="1";
     if(document.getElementById("isok0").checked){isok="0";}
     $.post("templet_editDo.do","templet.name="+$("#name").val()+"&templet.state="+isok+"&templet.ordernum="+$("#ordernum").val()
     +"&templet.usesites="+$("#siteid").val()+"&templet.usesitenames="+$("#sitenames").val()
     ,addComplete,"text");
     }
     });*/
}
function addcheck() {
    if ($.trim($("#name").val()) == "") {
        alert("请输入名称!");
        $("#name").focus();
        return false;
    }
    if ($.trim($("#uploadFile").val()) != "" &&
        $.trim($("#uploadFile").val()).substring($.trim($("#uploadFile").val()).length - 4, $.trim($("#uploadFile").val()).length) != ".zip") {
        alert("请上传格式为zip的压缩文件");
        $("#zip").focus();
        return false;
    }
    return true;
}
//编辑
function edit() {
    if (isCheckOne()) {
        $.weeboxs.open('templet_edit.do?templet.id=' + getCheckOneValue(), {title: '编辑模板', contentType: 'ajax', height: 210, width: 500,
            onok: function () {
                if ($.trim($("#name").val()) == "") {
                    alert("请输入名称!");
                    $("#name").focus();
                    return false;
                }
                //成功
                var isok = "1";
                if (document.getElementById("isok0").checked) {
                    isok = "0";
                }
                $.post("templet_editDo.do", "templet.id=" + getCheckOneValue() + "&templet.name=" + $("#name").val() + "&templet.state=" + isok + "&templet.ordernum=" + $("#ordernum").val()
                        + "&templet.usesites=" + $("#siteid").val() + "&templet.usesitenames=" + $("#sitenames").val()
                    , editComplete, "text");
            }
        });
    } else {
        alert("请选择一条记录!");
    }
}
function addComplete(data) {
    if (data == "succ") {
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
        location.href = location.href;
    } else {
        alert("操作失败，请重试!");
    }
}
function editComplete(data) {
    if (data == "succ") {
        var id = getCheckOneValue();
        document.getElementById("name" + id).innerHTML = $("#name").val();
        var isok = "是";
        if (document.getElementById("isok0").checked) {
            isok = "否";
        }
        document.getElementById("state" + id).innerHTML = isok;
        document.getElementById("usesitenames" + id).innerHTML = $("#sitenames").val();
        document.getElementById("ordernum" + id).innerHTML = $("#ordernum").val();
        $.weeboxs.close();//增加事件方法后需手动关闭弹窗
    } else {
        alert("操作失败，请重试!");
    }
}
var oldsiteids;
var oldsitenames;
//选择站点
function siteSelect() {
    oldsiteids = $("#siteid").val();
    oldsitenames = $("#sitenames").val();
    $.weeboxs.open('site_siteCheck.do?sites=' + $("#siteid").val(), {title: '选择站点', contentType: 'ajax', height: 350, width: 240,
        onok: function () {
            /*var siteobjs=document.getElementsByName("sites");
             var siteids="";
             var sitenames="";
             if(siteobjs!=null && siteobjs.length>0){
             for(var i=0;i<siteobjs.length;i++){
             if(siteobjs[i].checked){
             siteids+=siteobjs[i].value+";";
             sitenames+=siteobjs[i].show+";";
             }
             }
             }
             $("#siteid").val(siteids);
             $("#sitenames").val(sitenames);*/
            $.weeboxs.close();
        }, oncancel: function () {
            $("#siteid").val(oldsiteids);
            $("#sitenames").val(oldsitenames);
            $.weeboxs.close();
        }
    });
}
//选择站点时
function siteCheck(obj) {
    if (obj.checked) {
        //选中
        if ($("#siteid").val().indexOf(obj.value + ";") < 0) {
            //没有则添加
            $("#siteid").val($("#siteid").val() + obj.value + ";");
            $("#sitenames").val($("#sitenames").val() + obj.show + ";");
        }
    } else {
        //取消选中
        $("#siteid").val($("#siteid").val().replace(obj.value + ";", ""));
        $("#sitenames").val($("#sitenames").val().replace(obj.show + ";", ""));
    }
}
//清除站点
function clearSite() {
    $("#siteid").val("");
    $("#sitenames").val("");
}

function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("templet_del.do", "ids=" + getCheckValue(), delComplete, "text");
        }
    } else {
        alert("请选择要操作的记录!");
    }
}
function delComplete(data) {
    if (data != "") {
        var datas = data.split(";");
        if (datas != null && datas.length > 0) {
            for (var i = 0; i < datas.length; i++) {
                if (datas[i] != "" && document.getElementById("tr" + datas[i]) != null) {
                    document.getElementById("tr" + datas[i]).parentNode.removeChild(document.getElementById("tr" + datas[i]));
                }
            }
        }
    }
}
//文件管理
function fileManage() {
    if (isCheckOne()) {
        location.href = "templet_fileManage.do?templet.id=" + getCheckOneValue() + "&pageFuncId=" + $("#pageFuncId").val();
    } else {
        alert("请选择一条记录!");
    }
}
//初始化数据
function data() {
    if (isCheckOne()) {
        location.href = "templet_data.do?templet.id=" + getCheckOneValue() + "&pageFuncId=" + $("#pageFuncId").val();
    } else {
        alert("请选择一条记录!");
    }
}
//导出
function exportZip() {
    if (isCheckOne()) {
        $("#buttontd").html("正在导出中，请稍候...");
        location.href = "templet_export.do?templet.id=" + getCheckOneValue();
    } else {
        alert("请选择一条记录!");
    }
}