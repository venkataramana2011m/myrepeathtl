<%@ page import="org.apache.sling.commons.json.JSONObject" %>
<%@include file="/libs/foundation/global.jsp" %>
<%@ page import="java.io.PrintWriter" %>
<%@page session="false" %>

<div style="display: block; border-style: solid; border-width: 1px; margin: 10px; padding: 10px">
		<b>Multi Field Sample</b>
		<%
				try{
							Property property = null;
							if(currentNode.hasProperty("map")){
											property = currentNode.getProperty("map");
							}
							if(property != null){
											JSONObject obj = null;
											Value[] values = null;
											if(property.isMultiple()){
															values = property.getValues();
											}
											else{
															values = new Value[1];
															values[0] = property.getValue();
											}
											for (Value val : values){
															obj = new JSONObject(val.getString());
		%>	
								<br><br>Year : <b><%= obj.get("year") %></b>,
								<br>Price : <b><%= obj.get("price") %></b>,
								<br>Version : <b><%= obj.get("version")%></b>,
								<br>Low Stock : <b><%=obj.get("lowStock")%></b>
											}
						} 
						else {
						
						
		%>
					Add values in dialog
        <%			}
				} 
				catch (Exception e) {
										e.printStackTrace(new PrintWriter(out));
				}%>
</div>