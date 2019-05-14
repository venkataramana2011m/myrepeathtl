<%--

  Microsoft Logo component.

  Logo Component for Microsoft Project

--%><%
%><%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.text.Text,com.day.cq.wcm.foundation.Image,com.day.cq.commons.Doctype" %>

    <%
     String home=Text.getAbsoluteParent(currentPage.getPath(),2);
     Resource res=currentStyle.getDefiningResource("fileReference");
     if(res==null){
      res=currentStyle.getDefiningResource("file");
      }
      log.error("path is:" +currentStyle.getPath());
     %><div>
         <a href="<%=home%>.html" style="border-radius: 6px; border: 1px solid gray; box-shadow: 0 3px 6px rgba(0,0,0,0.9);">
     <% if(res==null){
     %> <img src="/apps/Microsoft/components/MicroComponent/clientlib/images/logo.png" alt="LOGO" style="border-radius: 6px; border: 1px solid gray; box-shadow: 0 3px 6px rgba(0,0,0,0.9);"> <%
     }
     else{
           Image img=new Image(res);
           img.setItemName(Image.NN_FILE,"file");
           img.setItemName(Image.PN_REFERENCE,"fileReference");
           img.setSelector("img");

           img.setDoctype(Doctype.fromRequest(request));
           img.setAlt("Home Page2");
           img.draw(out);
          }
          %>
    </a></div>