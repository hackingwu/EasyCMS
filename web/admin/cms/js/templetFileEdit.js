function save() {
    if ($.trim($("#fileName").val()) == "") {
        alert("请输入文件名");
        $("#fileName").focus();
        return false;
    }
    $("#MyForm").submit();
}