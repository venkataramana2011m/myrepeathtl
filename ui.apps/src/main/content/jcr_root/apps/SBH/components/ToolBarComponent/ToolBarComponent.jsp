<%@include file="/libs/foundation/global.jsp"%><%
%><%@ page import="java.util.Iterator,
                   org.apache.commons.lang3.StringEscapeUtils,
                   com.day.cq.wcm.api.PageFilter,
                   com.day.text.Text" %><%

    // get starting point of toolbar
    long absParent = currentStyle.get("absParent", 2L);
    boolean listStyle = currentStyle.get("list", false);
    String toolbarparent = Text.getAbsoluteParent(currentPage.getPath(), (int) absParent);

    ToolbarFilter filter = new ToolbarFilter(request, currentStyle.get("toolbar", ""));

    //if not deep enough or no "/toolbar" skip
    if (!toolbarparent.equals("")) {
        String toolbarpath = toolbarparent + "/toolbar";
        Resource rootRes = slingRequest.getResourceResolver().getResource(toolbarpath);
        Page rootPage = rootRes == null ? null : rootRes.adaptTo(Page.class);
        if (rootPage != null) {
            if (listStyle) {
                %><ul><%
            }
            Iterator<Page> iter = rootPage.listChildren(filter);
            boolean first = true;
            while (iter.hasNext()) {
                Page child = iter.next();
                boolean last = !iter.hasNext();
                String title = child.getNavigationTitle();
                if (title == null) {
                    title = child.getTitle();
                }
                if (title == null) {
                    title = child.getName();
                }
                title = StringEscapeUtils.escapeHtml4(title);
                if (listStyle) {
                    %><li class="<%= first ? "first " : "" %><%= last ? "last" : ""%>">
                        <a href="<%= Text.escape(child.getPath(), '%', true) %>.html"><%= title %></a>
                    </li><%
                } else {
                    %><%= first ? "&nbsp;&nbsp;" : "" %><a href="<%= Text.escape(child.getPath(), '%', true) %>.html" <%= first ? "class=\"first\"":"" %>><%= title%></a><%
                }
                first = false;
            }
            if (listStyle) {
                %></ul><%
            }
        }
    }
%><%!
    private static class ToolbarFilter extends PageFilter {

        private final String toolbar;

        private ToolbarFilter(ServletRequest req, String toolbar) {
            super(req);
            this.toolbar = toolbar;
        }

        @Override
        public boolean includes(Page page) {
            if (!super.includes(page)) {
                return false;
            }
            if (toolbar.length() == 0) {
                return true;
            }
            String[] tbs = page.getProperties().get("cq:toolbars", String[].class);
            if (tbs == null || tbs.length == 0) {
                return true;
            }
            for (String tb: tbs) {
                if (tb.equals(toolbar)) {
                    return true;
                }
            }
            return false;
        }
    }
%>