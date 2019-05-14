	<%@include file="/libs/foundation/global.jsp"%>
<!-- TO SHOW THE IMAGES IN GRID VIEW -->
<html>
	<head>
		<script>
            function fnshowImg(trgtsrc){
             document.getElementById("preview").src = trgtsrc;
            }


            function fnbottom(){
                document.getElementById("divpreview").style.top="";
            }
			
		</script>

	</head>
	<body >


                        <center>
                            <div id="divpreview" style="width:300px; height:300px; border:1px solid #A7D7F9; position:relative; top:140px; border-radius:6px;box-shadow: 5px 5px 5px gray;">
                                    <img id="preview" src="" style="width:300px; height:300px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" />
                            </div>
       					</center>


							<%
							   String GPosition = properties.get("galleryposition", "bottom");
							   String path = properties.get("images", currentPage.getPath());
							   resource = resourceResolver.getResource(path);
							   Node node = WCMUtils.getNode(resource);
							   NodeIterator iterator = node.getNodes();
                             %>
        						<c:set var="GPosition" value="<%=GPosition%>"/>
                                <c:choose>
                                    <c:when test="${GPosition == 'top'}">
                                        <div id="gallery" style="width:762px;height:135px; position:relative; overflow-x:scroll; top:-310px;">
                                            <table>
                                                <tr>
                                                        <%
                                                           while(iterator.hasNext()) {
                                                                Node child = iterator.nextNode();
    
                                                        %>
                                                                <td><img src="<%=child.getPath()%>" style="width:150px; height:100px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" onclick="fnshowImg(this.src);"/></td>

                
                                                        <%  } %>
                                                    </tr>
                                                </table>
        
                                            </div>
                                    </c:when>
                                    <c:when test="${GPosition == 'bottom'}">
										<script>fnbottom();</script>
                                        <div id="gallery" style="width:762px;height:135px; position:relative; overflow-x:scroll; top:5px;">
                                            <table>
                                                <tr>
                                                        <%
                                                           while(iterator.hasNext()) {
                                                                Node child = iterator.nextNode();
    
                                                        %>
                                                                <td><img src="<%=child.getPath()%>" style="width:150px; height:100px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" onclick="fnshowImg(this.src);"/></td>

                
                                                        <%  } %>
                                                    </tr>
                                                </table>
        
                                            </div>
                                    </c:when>
                                    <c:when test="${GPosition == 'right'}">

                                        <div id="gallery" style="width:175px;height:400px; position:relative; overflow-y:scroll; top:-180px; left:500px; ">
                                            <table>
        
                                                    <%
                                                       while(iterator.hasNext()) {
                                                            Node child = iterator.nextNode();

                                                    %>
                                                            <tr><td><img src="<%=child.getPath()%>" style="width:150px; height:100px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" onclick="fnshowImg(this.src);"/></td></tr>
        
        
                                                    <%  } %>
        
                                            </table>        
                                        </div>
                                    </c:when>
                                    <c:when test="${GPosition == 'left'}">

                                        <div id="gallery" style="width:175px;height:400px; position:relative; overflow-y:scroll; top:-200px; left:-10px;">
                                            <table>
        
                                                    <%
                                                       while(iterator.hasNext()) {
                                                            Node child = iterator.nextNode();

                                                    %>
                                                            <tr><td><img src="<%=child.getPath()%>" style="width:150px; height:100px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" onclick="fnshowImg(this.src);"/></td></tr>
        
        
                                                    <%  } %>
        
                                            </table>        
                                        </div>
                                    </c:when>
                                    <c:otherwise>
										<script>fnbottom();</script>
                                        <div id="gallery" style="width:762px;height:135px; position:relative; overflow-x:scroll; top:5px;">
                                            <table>
                                                <tr>
                                                        <%
                                                           while(iterator.hasNext()) {
                                                                Node child = iterator.nextNode();
    
                                                        %>
                                                                <td><img src="<%=child.getPath()%>" style="width:150px; height:100px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" onclick="fnshowImg(this.src);"/></td>

                
                                                        <%  } %>
                                                    </tr>
                                                </table>
        
                                            </div>
                                    </c:otherwise>
                                </c:choose>




	</body>
</html>