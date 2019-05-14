<%@ page language="Java" %>
<%@include file="/libs/foundation/global.jsp"%>
<% %>
<%@page session="false" %>
<% %>
<%
// TODO add you code here
%>
<html>
<head><title>Link Components</title>
<script>
function openWindow(){
var a = "<%=properties.get("select")%>";
if(a == "null"){
window.open("<%=properties.get("link")%>",'_self');
}else{
window.open("<%=properties.get("link")%>",'_blank');
}
}
</script></head><body>
    <div style="background-color:gray; font-size:13px;font-face:bold; color:white; display:block; height:50px;">
        <a href="#" onclick="javascript:openWindow();"><%=properties.get("linkpage")%></a></div>
</body></html>