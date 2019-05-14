<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<cq:include script="/libs/wcm/core/components/init/init.jsp"/>
<%  
    		int rows = properties.get("genrows",0); 
            int cols = properties.get("genparsys",0);
%>
<table style="width:100%">
    <tr>
        <td colspan="3"><cq:include path="imagepar" resourceType="foundation/components/parsys"/></td>
    </tr>
    <tr>
        <c:forEach var="i" begin="1" end="3"> 
           <td style="width:33%"> 
               <cq:include path="par${i}" resourceType="foundation/components/parsys"/>
            </td>
        </c:forEach>
    
    </tr>
    <tr>
        <c:forEach var="i" begin="4" end="6">         
           <td style="width:33%"> 
               <cq:include path="par${i}" resourceType="foundation/components/parsys"/>
            </td>
        </c:forEach>
    </tr>
</table>
<% Calendar date = node.getProperty("myDateProperty").getValue().getDate();%>
<%= date %>