<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.wcm.foundation.Image,
com.day.cq.wcm.foundation.TextFormat,
org.apache.commons.lang.StringEscapeUtils,
com.day.cq.wcm.api.components.DropTarget,
com.day.cq.wcm.api.WCMMode" %><%
%><%@include file="/libs/wcm/global.jsp"%>
<html>
    <head>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="/apps/Microsoft/components/carousel/clientlibs/cquery.js"></script>
		<link rel="stylesheet" href="/apps/Microsoft/components/carousel/clientlibs/cquery.css" type="text/css">
    </head>
    <body>
        <div id="carousel">
            <div id="carouselNav" class="crsl-nav" >
                    <span style="height:40px;"><h1>Guy Carpenter Innovations</h1></span>			
                    <a href="#" id='prev'><label class="previous"></label></a>
                    <a href="#" id='next' ><label class="next" ></label></a>                    
            </div>
            <div class="clear"></div>        
            <div id="slides"> 
                <ul>
                    <%
                        String[] images = properties.get("images", new String[0]); 
                        for (int i = 0; i < images.length; i++) {
                    %>
                    <li> <img src="<%= images[i] %>" width="280px" height="180px"/></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </body>
</html>