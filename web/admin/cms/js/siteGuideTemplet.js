function save(form) {
    if (document.getElementById("type0").checked) {
        //选择模板
        if ($.trim($("#id").val()) == "") {
            alert("请选择模板");
            return false;
        }
    } else {
        //创建新模板
        if ($.trim($("#name").val()) == "") {
            alert("请输入模板名称");
            $("#name").focus();
            return false;
        }
    }
    form.submit();
}
//选择模板
function selectTemplet(id) {
    $.weeboxs.open('template_select.do?site.id=' + id, {title: '选择模板', contentType: 'ajax', height: 370, width: 280
    });
}
function selectTempletDo(id, name) {
    $("#id").val(id);
    $("#templetname").val(name);
    $.weeboxs.close();
}
function radioClick(v) {
    if ("1" == v) {
        $("#selectTr").fadeOut("slow");
        $("#addTr").fadeIn("slow");
    } else {
        $("#selectTr").fadeIn("slow");
        $("#addTr").fadeOut("slow");
    }
}