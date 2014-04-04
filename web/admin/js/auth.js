function siteAuth(basePath) {
    $("#MyForm").attr("action", basePath + "admin/cms/site_auth.do");
    $("#MyForm").submit();
}
function wsAuth(basePath) {
    $("#MyForm").attr("action", basePath + "admin/user_wsAuth.do");
    $("#MyForm").submit();
}
function channelAuth(basePath) {
    $("#MyForm").attr("action", basePath + "admin/cms/channel_auth.do");
    $("#MyForm").submit();
}