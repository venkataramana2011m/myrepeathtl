<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.wcm.foundation.Image,
        com.day.cq.wcm.foundation.TextFormat,
        org.apache.commons.lang.StringEscapeUtils,
        com.day.cq.wcm.api.components.DropTarget,
        com.day.cq.commons.Doctype,
        com.day.cq.commons.DiffInfo,
        com.day.cq.commons.DiffService,
        org.apache.sling.api.resource.ResourceUtil,
        com.day.cq.wcm.api.WCMMode" %><%
%><%@include file="/libs/wcm/global.jsp"%>

<%
//drop target css class = dd prefix + name of the drop target in the edit config
String ddClassName = DropTarget.CSS_CLASS_PREFIX + "image";
Image img = new Image(resource, "image");
if (img.hasContent() || WCMMode.fromRequest(request) == WCMMode.EDIT) {
%><div><%
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
%></div><div class="details">
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

    // escape title
    title = xssAPI.filterHTML(title);
    
    // check if we need to compute a diff
    String diffOutput = null;
    DiffInfo diffInfo = resource.adaptTo(DiffInfo.class);
    if (diffInfo != null) {
        DiffService diffService = sling.getService(DiffService.class);
        ValueMap map = ResourceUtil.getValueMap(diffInfo.getContent());
        String diffText = map.get(NameConstants.PN_TITLE, "");
        // if the paragraph has no own title, we use the current page title(!)
        if (diffText == null || diffText.equals("")) {
            diffText = title;
        } else {
            diffText = xssAPI.filterHTML(diffText);
        }
        diffOutput = diffInfo.getDiffOutput(diffService, title, diffText, false);
        if (title.equals(diffOutput)) {
            diffOutput = null;
        }
    }
    String defType = currentStyle.get("defaultType", "large");

    // use image title if type is "small" but not if diff should be displayed
    if (properties.get("type", defType).equals("small") && diffOutput == null) {
        String suffix = currentDesign.equals(resourceDesign) ? "" : "/" + currentDesign.getId();
        // add mod timestamp to avoid client-side caching of updated images
        long tstamp = properties.get("jcr:lastModified", properties.get("jcr:created", System.currentTimeMillis()));
        suffix += "/" + tstamp + ".png";
        String xs = Doctype.isXHTML(request) ? "/" : "";
        %><img src="<%= xssAPI.getValidHref(resource.getPath()+".title.png"+suffix) %>" alt="<%= xssAPI.encodeForHTMLAttr(title) %>"<%=xs%>><%

    // large title
    } else if (diffOutput == null) {
        %><h1><%= title %></h1><%

    // we need to display the diff output
    } else {
        // don't escape diff output
        %><h1><%= diffOutput %></h1><%

    }

%>



<%
}
if (properties.get("text", "").length() > 0) {
%><%
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