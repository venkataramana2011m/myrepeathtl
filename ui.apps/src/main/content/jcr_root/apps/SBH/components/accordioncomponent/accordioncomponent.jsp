<%@ page import="org.apache.sling.commons.json.JSONObject" %>
<%@ page import="java.io.PrintWriter" %>
<%@include file="/libs/foundation/global.jsp" %>
<%@page session="false" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Accordion - Default functionality</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <link rel="stylesheet" href="./jquery-ui.css">
  <script src="./jquery-1.9.1.js"></script>
  <script src="./jquery-ui.js"></script>
  <link rel="stylesheet" href="./style.css">
  <script>
  $(function() {
    $( "#accordion" ).accordion();
  });
  </script>

</head>
<body>

<div id="accordion">

 <%
        try {
            Property property = null;

            if(currentNode.hasProperty("map")){
                property = currentNode.getProperty("map");
            }

            if (property != null) {
                JSONObject obj = null;
                Value[] values = null;

                if(property.isMultiple()){
                    values = property.getValues();
                }else{
                    values = new Value[1];
                    values[0] = property.getValue();
                }

                for (Value val : values) {
                    obj = new JSONObject(val.getString());
    %>
					<h3><b><%= obj.get("title") %></b></h3>
                    <div><p> <%= obj.get("description") %></p></div>


    <%
                }
            } else {
    %>
                Add values in dialog

    <%
            }
        } catch (Exception e) {
            e.printStackTrace(new PrintWriter(out));
        }
    %>
    </div>
</body>
</html>