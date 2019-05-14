<%--

  Upload Control component.

  Creating the Control for Uploading the file

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%>

<html>

<%
	File file = new File("/mypath/mydocument.pdf");
FileInputStream is = new FileInputStream(file);
mimeType = "application/octet-stream";
Node node = session.getNode(parentNode);
ValueFactory valueFactory = session.getValueFactory();
Binary contentValue = valueFactory.createBinary(is);
Node fileNode = node.addNode(fileName, "nt:file");
fileNode.addMixin("mix:referenceable");
Node resNode = fileNode.addNode("jcr:content", "nt:resource");
resNode.setProperty("jcr:mimeType", mimeType);
resNode.setProperty("jcr:data", contentValue);
Calendar lastModified = Calendar.getInstance();
lastModified.setTimeInMillis(lastModified.getTimeInMillis());
resNode.setProperty("jcr:lastModified", lastModified);
session.save();
return fileNode.getPath();
%>

</html>