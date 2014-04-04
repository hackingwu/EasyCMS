//点击文件夹
function showOne(folder) {
    $("#fileFrame").attr("src", "templet_fileSon.do?type=select&root=" + folder);
}