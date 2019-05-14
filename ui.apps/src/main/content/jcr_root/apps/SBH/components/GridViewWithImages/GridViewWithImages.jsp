<%@include file="/libs/foundation/global.jsp"%>
<!-- TO SHOW THE IMAGES IN GRID VIEW -->
<script>
function fnshowImg(trgtsrc){
 document.getElementById("preview").src = trgtsrc;
}
</script>
<table>
    <tr>
        <td>
            <center><div  style="width:750px; height:250px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;">
    <img id="preview" src="" style="width:750px; height:250px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" />
</div></center>
        </td></tr>


	<tr>
        <td style="height:50px;">

        </td>
    </tr>
    <tr>
        <td>
            <div style="width:100%; height:450px; overflow:scroll;">
                    <%
                       String path = properties.get("images", currentPage.getPath());
                       resource = resourceResolver.getResource(path);
                       Node node = WCMUtils.getNode(resource);
                       NodeIterator iterator = node.getNodes();
                       while(iterator.hasNext()) {
                            Node child = iterator.nextNode();
                    %>
        
                                <img src="<%=child.getPath()%>" style="width:150px; height:100px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray;" onclick="fnshowImg(this.src);">

        
                    <%  } %>
            </div>   
        </td>
    </tr>
</table>
<br/>
<br/>
