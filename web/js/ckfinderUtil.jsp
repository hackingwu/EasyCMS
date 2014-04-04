<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
function ckfinderUrl(fileUrl,ckfinderCurrentFolder){
if(fileUrl.indexOf("/userfiles/files/")==0){
fileUrl="/userfiles/files"+ckfinderCurrentFolder+fileUrl.substring(17);
}
if(fileUrl.indexOf("/userfiles/images/")==0){
fileUrl="/userfiles/images"+ckfinderCurrentFolder+fileUrl.substring(18);
}
if(fileUrl.indexOf("/userfiles/flash/")==0){
fileUrl="/userfiles/flash"+ckfinderCurrentFolder+fileUrl.substring(17);
}
fileUrl="<%=path %>"+fileUrl;
return fileUrl;
}
