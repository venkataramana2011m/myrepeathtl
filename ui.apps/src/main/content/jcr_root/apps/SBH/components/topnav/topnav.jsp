<%--
  Copyright 1997-2010 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Top Navigation component

  Draws the top navigation

--%>
<%--
Draws the top navigation
--%>
<%@include file="/libs/foundation/global.jsp"%><%
%><%@ page import="java.util.Iterator,
com.day.text.Text,
com.day.cq.wcm.api.PageFilter,
com.day.cq.wcm.api.Page,
com.day.cq.commons.Doctype,
org.apache.commons.lang.StringEscapeUtils" %><%
// get navigation root page Page
Page navRootPage = currentPage.getAbsoluteParent(2);
// check to make sure the page exists
if (navRootPage == null && currentPage != null) {
navRootPage = currentPage;
}
if (navRootPage != null) {
Iterator<Page> children = navRootPage.listChildren(new PageFilter
(request));
%> <div id="menuWrapper"><ul class="menu"> <%
while (children.hasNext()) {
Page child = children.next();
%>
<li class="top">
<a class="top_link" href="<%= child.getPath() %>.html">
<%= StringEscapeUtils.escapeXml(child.getTitle())%> </a>
</li>
<%
}
%> </ul></div> <%
}
%>