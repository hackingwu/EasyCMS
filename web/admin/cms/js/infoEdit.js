//选择栏目
function selectChannel() {
    if ($("#siteId").val() != "") {

        $.weeboxs.open('channel_channel.do?noShowSite=1&channel.id=select&channel.site.id=' + $("#siteId").val(), {title: '选择栏目', contentType: 'ajax', height: 320, width: 280
        });
    } else {
        alert("请先选择站点");
        selectSite();
    }
}
//点击栏目
function showOne(id, name) {
    $.weeboxs.close();
    $("#channelId").val(id);
    $("#channelName").val(name);
}
function selectChange() {
    $.post("site_getChannel.do", "site.id=" + document.getElementById("siteId").value, selectChangeComplete, "text");
}
function selectChangeComplete(data) {
    $("#channelId").empty();
    if (data != null && data != "") {
        var json = eval(data);
        if (json != null && json.length > 0) {
            var html = "";
            for (var i = 0; i < json.length; i++) {
                if (json[i].id != "") {
                    html += "<option value='" + json[i].id + "'>" + json[i].name;
                }
            }
            $("#channelId").append(html);
        }
    }
}
//提交验证
function save() {
    if ($("#siteId").val() == "") {
        alert("请选择站点");
        return false;
    }
    if ($("#channelId").val() == "") {
        alert("请选择栏目");
        return false;
    }
    if ($.trim($("#title").val()) == "") {
        alert("请输入标题");
        return false;
    }
    $("#MyForm").submit();
}
//选择图片
function selectImg() {
    var finder = new CKFinder();
    finder.basePath = '../../';
    finder.selectActionFunction = selectImgDo;
    finder.popup();
}
//选择图片处理
function selectImgDo(fileUrl) {
    fileUrl = ckfinderUrl(fileUrl, $("#ckfinderCurrentFolder").val());
    $("#imgSpan").html("<a href='" + fileUrl + "' target='_blank'>" +
        "<img src='" + fileUrl + "' width='100' height='100' title='点击查看大图'/>" +
        "</a>");
    $("#imgDelBtn").fadeIn("slow");
    $("#img").val(fileUrl);
}
//删除图片
function delImg() {
    $("#imgSpan").empty();
    $("#imgDelBtn").fadeOut("slow");
    $("#img").val("");
}

//选择附件
function selectFile() {
    var finder = new CKFinder();
    finder.basePath = '../../';
    finder.selectActionFunction = selectFileDo;
    finder.popup();
}
//选择附件处理
function selectFileDo(fileUrl) {
    fileUrl = ckfinderUrl(fileUrl, $("#ckfinderCurrentFolder").val());
    var id = new Date().getMilliseconds();
    $("#attchSpan").append("<span id='attch" + id + "' value='" + fileUrl + "'><br><a  href='" + fileUrl + "' target='_blank' title='点击下载'>" +
        decodeURI(fileUrl.substring(fileUrl.lastIndexOf("/") + 1)) +
        "</a>&nbsp;&nbsp;<a  href='javascript:delAttch(\"" + id + "\")'>删除</a></span>");
    $("#attchs").val($("#attchs").val() + fileUrl + ";");
}
//删除附件
function delAttch(id) {
    $("#attch" + id).fadeOut("slow");
    $("#attchs").val($("#attchs").val().replace($("#attch" + id).attr("value") + ";", ""));
}
function istop(isok) {
    if (1 == isok) {
        //$("#topendtime").fadeIn("slow");
    } else {
        //$("#topendtime").fadeOut("slow");
    }
}
function opentimetype(opentimetype) {
    if (1 == opentimetype) {
        $("#openendtime").fadeOut("slow");
    } else {
        $("#openendtime").fadeIn("slow");
    }
}
var templetFileWeeboxs;
function selectTempletFile(inputid) {
    var siteId = $("#siteId").val();
    if (siteId != "") {
        templetFileWeeboxs = $.weeboxs.open('templet_selectFile.do?inputid=' + inputid + '&site.id=' + siteId, {title: '选择模板文件', contentType: 'ajax', height: 400, width: 500,
            onok: function () {
            }});
    } else {
        alert("请选择站点");
    }
}
function closeWeebox() {
    templetFileWeeboxs.close();
}
function issign(issign) {
    if (1 == issign) {
        $("#signtr").fadeIn("slow");
    } else {
        $("#signtr").fadeOut("slow");
    }
}
function checkallsign(checked) {
    var objs = document.getElementsByName("signusers");
    if (objs != null && objs.length > 0) {
        for (var i = 0; i < objs.length; i++) {
            objs[i].checked = checked;
        }
    }
}

//选择图片集
function selectImgs() {
    var finder = new CKFinder();
    finder.basePath = '../../';
    finder.selectActionFunction = selectImgsDo;
    finder.popup();
}
//选择图片集处理
function selectImgsDo(fileUrl) {
    fileUrl = ckfinderUrl(fileUrl, $("#ckfinderCurrentFolder").val());
    var id = new Date().getMilliseconds();
    var html = "<table id='imgtable" + id + "'><tr>" +
        "<td rowspan='4'><input type='hidden' name='imgsurl" + id + "' value='" + fileUrl + "'><a href='" + fileUrl + "' target='_blank'>" +
        "<img src='" + fileUrl + "' width='150' height='120' title='点击查看大图'/>" +
        "</a></td>" +
        "<td>标题:</td>" +
        "<td><INPUT onblur=\"this.className='inputblur';\" class=inputblur onfocus=\"this.className='inputfocus';\"   maxLength=250 size=40 type=text name=imgstitle" + id + " /></td>" +
        "</tr><tr>" +
        "<td>顺序:</td>" +
        "<td><INPUT onblur=\"this.className='inputblur';\" class=inputblur onfocus=\"this.className='inputfocus';\" onkeyup=if(!isInt(value))execCommand('undo') onafterpaste=if(!isInt(value))execCommand('undo')   maxLength=10 size=4 type=text name=imgsordernum" + id + " /></td>" +
        "</tr><tr>" +
        "<td>描述:</td>" +
        "<td><textarea  class=inputblur onfocus=\"this.className='inputfocus';\" onblur=\"this.className='inputblur';if(this.value.length>500){alert('最多500个字符');this.focus()}\" name=imgscontent" + id + " cols=40 rows=3></textarea>(最多500个字符)</td>" +
        "</tr><tr>" +
        "<td><input type='button'  class='button' value='删 除' onclick=\"delImgs('" + id + "');\"/></td>" +
        "<td></td>" +
        "</tr></table>";
    $("#imgs").append(html);
}
//删除图片集
function delImgs(id) {
    $("#imgtable" + id).remove();
}
//删除图片集
function delOldImgs(id) {
    $("#oldimgtable" + id).remove();
    $("#delOldimgs").val($("#delOldimgs").val() + id + ";");
}