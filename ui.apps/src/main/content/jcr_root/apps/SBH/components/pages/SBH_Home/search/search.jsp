<%--
  ADOBE CONFIDENTIAL
  __________________

   Copyright 2012 Adobe Systems Incorporated
   All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
--%><%
%><%@ include file="/libs/foundation/global.jsp" %><%
%><%@ page contentType="text/html; charset=utf-8" import="
    com.day.cq.i18n.I18n"
%><%

    final I18n i18n = new I18n(slingRequest);
    final String searchPath = currentStyle.get("searchPath", currentPage.getPath()) + ".html";

%>
<form class="search-form" action="<%= xssAPI.getValidHref(searchPath) %>" method="get">
    <p class="search-field">
        <input id="search-field" type="text" name="q" placeholder="<%= xssAPI.filterHTML(i18n.get("Search")) %>" />
    </p>
    <p class="search-submit">
        <input id="search-submit" type="submit" value="<%= xssAPI.filterHTML(i18n.get("Go")) %>" />
    </p>
</form>