<%@ page import="org.apache.sling.commons.json.JSONObject" %>
<%@ page import="java.io.PrintWriter" %>
<%@include file="/libs/foundation/global.jsp" %>
<%@page session="false" %>
<html>
<head>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>



    <style type="text/css">
.crsl-nav .previous {
width: 17px;
height: 33px;
display: block;
position: absolute;
top: 0px;
right: 35px;
background: url(/content/dam/Carpenter_Guy/arrow-carousel-nav.png) 0px 0px no-repeat ;
}

.crsl-nav .next {
width: 17px;
height: 33px;
display: block;
position: absolute;
top: 0px;
right: 0px;
background: url(/content/dam/Carpenter_Guy/arrow-carousel-nav.png) 0px -33px no-repeat ;
}

.crsl-nav {
width: 100%;
position: relative;
z-index: 1;
}

*, *:before, *:after {
margin: 0;
padding: 0;
-moz-box-sizing: border-box;
-webkit-box-sizing: border-box;
box-sizing: border-box;
}

div {
display: block;
}
body {
font-family: SlateProBk,Arial,Helvetica,sans-serif;
line-height: 1;
color: #000;
cursor: default;
font-size: 100%;
}
.crsl-nav a {
border: 0;
outline: 0;
text-decoration: none;
font-weight: normal;
color: #0080b2;
}
.crsl-nav a:-webkit-any-link {
color: -webkit-link;
text-decoration: underline;
cursor: auto;
}


#1,#4,#7{
display:block;
background-color:#185B82;
width:250px;
    height:250px;
    color:white;
}
#2,#5,#8{
display:block;
background-color:#1B7EA8;
width:250px;
    height:250px;
color:white;
}
#3,#6,#9{
display:block;
background-color:#23B4CD;
width:250px;
    height:250px;
    color:white;
}
#carousel {
    width:750px;
    height:250px;   
    margin:0 0 0 0;
    overflow:hidden;
}

#slides {
    overflow:show;
    /* fix ie overflow issue */
    position:relative;
    width:2340px;
    height:250px;
    
}

/* remove the list styles, width : item width * total items */  
#slides ul {
    position:relative;
    left:0;
    top:0;
    list-style:none;
    margin:0;
    padding:0;  
    width:2340px;
        
}

/* width of the item, in this case I put 250x250x gif */
#slides li {
    width:250px;
    height:250px;   
    float:left;
    display:inline;
}



/* Styling for prev and next buttons */
#buttons {
    padding:0 0 5px 0;  
    float:right;
}

#buttons a {
    display:transperent; 
    width:31px; 
    height:32px;
    text-indent:-999em;
    float:left;
    outline:0;
}

a#prev {
    background:url(./arrow.gif) 0 -31px no-repeat; 
}

a#prev:hover {
    background:url(./arrow.gif) 0 0 no-repeat;
}

a#next {
    background:url(./arrow.gif) -32px -31px no-repeat; 
}

a#next:hover {
    background:url(./arrow.gif) -32px 0 no-repeat;
}

.clear {clear:both}

</style>
</head>
<body>
<div id="carousel">

    <div id="carouselNav" class="crsl-nav">
            <span style="height:40px;"><h1>Guy Carpenter Innovations</h1></span>            
            <a href="#" id='prev'><label class="previous"></label></a>
            <a href="#" id='next' ><label class="next" ></label></a>
            
        </div>
    <div class="clear"></div>

    <div id="slides"> 
    <ul>

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
					<li>
    					 <span >
                			 <h1><b><%= obj.get("title") %></b></h1>
                             <p> <%= obj.get("description") %></p>
                             <p> <%= obj.get("date") %></p>
                		</span>
            		</li>

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

</ul>
        <div class="clear"></div>
    </div>

</div>
    </body>
</html>