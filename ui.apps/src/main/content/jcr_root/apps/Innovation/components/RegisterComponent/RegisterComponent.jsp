<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<sling:defineObjects>
<%
    String resourcePath = "/content/ibasicpage";
    Resource res = resourceResolver.getResource(resourcePath);
%>
    <%=res%>