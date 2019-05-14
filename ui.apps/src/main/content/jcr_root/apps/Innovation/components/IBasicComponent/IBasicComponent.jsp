<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" 
        contentType="text/html;charset=UTF-8"
		import="org.apache.sling.api.request.ResponseUtil"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.day.commons.datasource.poolservice.DataSourcePool" %><%
%><%@ page import="javax.sql.DataSource" %><%
%><%@ page import="java.sql.Connection" %><%
%><%@ page import="java.sql.SQLException" %><%
%><%@ page import="java.sql.Statement" %><%
%><%@ page import="java.sql.ResultSet"%><%
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
  <head>
    <title></title>

  </head>
  <body>
      <span style="font-size: 50px; ">
            <cq:include path="topnav" resourceType="Innovation/components/topnav" />
        </span>
      <sling:defineObjects/>

      <%=com.Innvation.getpageurlthruservice.getSpecificPage() %>

      <%= com.Innovation.SampleUtil.getText() %><br/> How are you ?<br/>

    <cq:include script="/libs/wcm/core/components/init/init.jsp"/>

	<cq:include path="registration" resourceType = "foundation/components/parsys"/>


  </body>
</html>