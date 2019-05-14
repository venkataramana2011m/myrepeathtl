<%--

  Upload Component component.

  Creating the Upload Component and Make it to Preview the Uploaded File in the dialog itself ...........

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
	String path = (String)properties.get("fileReference","");

    File file = new File(path);

    double file_size = file.length();
%>
