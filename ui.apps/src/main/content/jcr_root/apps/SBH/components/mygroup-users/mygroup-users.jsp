<%@ page contentType="application/json" %>
<%@ page import="java.util.*" %>
<%@ include file="/libs/foundation/global.jsp" %>
<%@ taglib prefix="mylocation" uri="http://myapp.mysite.com/locations" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<mylocation:users currentPage="${currentPage}" />
{"users":[
<c:forEach var="item" items="${users}" varStatus="loop">
  { "value": "${item.name}", "text": "${item.name}"} ${not loop.last ? ',' : ''}
</c:forEach>
]}


