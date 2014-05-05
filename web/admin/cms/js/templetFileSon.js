//添加
function add() {
    location.href = "templet_fileEdit.do?currFolder=" + encodeURI($("#root").val());
}
//编辑
function edit() {
    if (isCheckOne()) {
        location.href = "templet_fileEdit.do?filePaths=" + getCheckOneValue() + "&currFolder=" + encodeURI($("#root").val());
    } else {
        alert("请选择一条记录!");
    }
}
//删除
function del() {
    if (isCheck()) {
        if (confirm("确定删除操作么?此操作无法回退!")) {
            $.post("templet_fileDel.do", "filePaths=" + getCheckValue(), delComplete, "text");
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
//创建文件夹
function createFolder() {
    $.weeboxs.open('templet_folderEdit.do?currFolder=' + $("#root").val(), {title: '创建文件夹', contentType: 'ajax', height: 60, width: 350,
        onok: function () {
            if ($.trim($("#fileName").val()) == "") {
                alert("请输入文件夹名称!");
                $("#fileName").focus();
                return false;
            }
            $.post("templet_folderEditDo.do", "currFolder=" + $("#root").val() + "&fileName=" + $("#fileName").val(), createFolderComplete, "text");
        }
    });
}
function createFolderComplete(data) {
    if (data == "succ") {
        alert("操作成功");
        $.weeboxs.close();
        parent.location.reload();
    } else {
        alert(data);
    }
}
//重命名文件夹
function renameFolder() {
    $.weeboxs.open('templet_folderEdit.do?filePaths=' + encodeURI($("#root").val()), {title: '重命名文件夹', contentType: 'ajax', height: 60, width: 350,
        onok: function () {
            if ($.trim($("#fileName").val()) == "") {
                alert("请输入文件夹名称!");
                $("#fileName").focus();
                return false;
            }
            $.post("templet_folderEditDo.do", "filePaths=" + encodeURI($("#root").val()) + "&fileName=" + $("#fileName").val(), renameFolderComplete, "text");
        }
    });
}
function renameFolderComplete(data) {
    if (data == "succ") {
        alert("操作成功");
        $.weeboxs.close();
        parent.location.reload();
    } else {
        alert(data);
    }
}
//刷新文件夹
function flushFolder() {
    location.href = location.href;
}
//删除文件夹
function delFolder() {
    if (confirm("确定删除操作么?此操作无法回退!")) {
        $.post("templet_folderDel.do", "filePaths=" + $("#root").val(), delFolderComplete, "text");
    }
}
function delFolderComplete(data) {
    if (data == "succ") {
        alert("操作成功");
        parent.location.reload();
    } else {
        alert(data);
    }
}
//上传文件
function uploadFile() {
    $.weeboxs.open('templateUploadFile.jsp', {title: '上传文件', contentType: 'ajax', height: 60, width: 350,
        onok: function () {
            if ($.trim($("#uploadFile").val()) == "") {
                alert("请选择上传的文件!");
                return false;
            }
            $.ajaxFileUpload
            (
                {
                    url: 'templet_uploadFile.do?root=' + encodeURI($("#root").val()),
                    secureuri: false,
                    fileElementId: 'uploadFile',
                    dataType: 'json',
                    success: function (data, status) {
                        if (typeof(data.error) != 'undefined') {
                            if (data.error != '') {
                                alert(data.error);
                            } else {
                                alert("上传成功");
                                flushFolder();
                            }
                        }
                    },
                    error: function (data, status, e) {
                        alert("上传失败!");
                    }
                }
            )
        }
    });
}