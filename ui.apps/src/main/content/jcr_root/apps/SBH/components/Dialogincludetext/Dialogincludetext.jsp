<%@include file="/libs/foundation/global.jsp"%><%
%><%@ page import="org.apache.commons.lang3.StringEscapeUtils,com.day.cq.wcm.foundation.TextFormat,com.day.cq.wcm.api.components.DropTarget,com.day.cq.wcm.api.WCMMode,com.day.cq.commons.Doctype,com.day.cq.commons.DiffInfo,com.day.cq.commons.DiffService,org.apache.sling.api.resource.ResourceUtil" %> 
<%

    // first calculate the correct title - look for our sources if not set in paragraph
    String title = properties.get(NameConstants.PN_TITLE, String.class);
    
    if (title == null || title.equals("")) {
        title = resourcePage.getPageTitle();
    }
    if (title == null || title.equals("")) {
        title = resourcePage.getTitle();
    }
    if (title == null || title.equals("")) {
        title = resourcePage.getName();
    }
    String defType = currentStyle.get("defaultType", "large");
    String type = properties.get("type", defType);
    String link = properties.get("href", "");
    if (link.length() > 0) {
        %><a href="<%= xssAPI.getValidHref(link) %>"><%
    }
    if (type.equals("small")) {
        %><cq:text property="jcr:title" value="<%= title %>" tagName="h3" escapeXml="true"/><%
    } else if (type.equals("link")) {
        %><cq:text property="jcr:title" value="<%= "\u00bb " + title %>" tagName="p" tagClass="link" escapeXml="true"/><%
    } else if (type.equals("large")) {
        %><cq:text property="jcr:title" value="<%= title %>" tagName="h1" escapeXml="true"/><%
    }   %><%
    
    if (link.length() > 0) {
        %></a><%
    }
    %>
    <cq:text property="jcr:description" tagName="p"/><br/>
    