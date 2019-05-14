<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.wcm.foundation.Image,
com.day.cq.wcm.foundation.TextFormat,
org.apache.commons.lang.StringEscapeUtils,
com.day.cq.wcm.api.components.DropTarget,
com.day.cq.wcm.api.WCMMode" %><%
%><%@include file="/libs/wcm/global.jsp"%>

<%
//drop target css class = dd prefix + name of the drop target in the edit config
String ddClassName = DropTarget.CSS_CLASS_PREFIX + "image";
Image img = new Image(resource, "image");
if (img.hasContent() || WCMMode.fromRequest(request) == WCMMode.EDIT) {
%><div style="float:left; margin: 0 8px 8px 0;"><%
img.loadStyleData(currentStyle);
// add design information if not default (i.e. for reference paras)
if (!currentDesign.equals(resourceDesign)) {
img.setSuffix(currentDesign.getId());
}
img.addCssClass(ddClassName);
img.setSelector(".img");
if (img.getTitle().length() > 0) {
%><strong></strong><%
}
%><% img.draw(out); %><br><%
if (img.getDescription().length() > 0) {
%><small><%= img.getDescription(true) %></small><%
}
%></div><%
}
if (properties.get("text", "").length() > 0) {
%><div style="float left; margin: 0 8px 8px 0; color:black;"><%
String text = properties.get("text", String.class);
if (properties.get("textIsRich", "false").equals("true")) {
%><%= text %><%
} else {
TextFormat fmt = new TextFormat();
fmt.setTagUlOpen("<ul>");
fmt.setTagOlOpen("<ol start=\"%s\">");
%><%= fmt.format(text) %><%
}
%></div><%
} else if (WCMMode.fromRequest(request) == WCMMode.EDIT) {
%><%--<img src="/libs/widgets/0.gif" class="cq-text-placeholder <%= ddClassName %>" alt="">--%><%
}
%><div class="clear"></div>