//点击文件夹
function showOne(folder) {
    $("#fileFrame").attr("src", "template_fileSon.do?type=select&root=" + folder);
}