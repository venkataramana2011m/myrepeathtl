<%@include file="/libs/foundation/global.jsp"%>

Multifield Test Component<br/>


<table>

	<tr>
        <td style="height:50px;">

        </td>
    </tr>
    <tr>
        <td>
            <div style="width:100%; overflow:scroll;">

                    <%
                    //    String[] images = properties.get("images", String[].class); // default is null
                        String[] images = properties.get("images", new String[0]); // default is empty array
                        for (int i = 0; i < images.length; i++) {
                    %>
    
                    <img src="<%= images[i] %>" style="width:150px; height:100px; border:1px solid #A7D7F9; border-radius:6px;box-shadow: 5px 5px 5px gray; float:left;" />
                    <%
                        }
                    %>
            </div>   
        </td>
    </tr>
</table>
<br/>
<br/>