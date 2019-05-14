<%@include file="/libs/foundation/global.jsp"%>


<%@page import="java.text.SimpleDateFormat,java.util.Date,java.util.Calendar"%>

<%
	Date date = properties.get("date", new Date());


%>
<%=date%>
