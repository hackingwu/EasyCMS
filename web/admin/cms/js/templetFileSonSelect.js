//点击文件
function selectFile(fileName) {
    var inputid = parent.document.getElementById("inputid").value;
    parent.document.getElementById(inputid).value = fileName.replace("根目录/", "");
    window.parent.window.closeWeebox();
}