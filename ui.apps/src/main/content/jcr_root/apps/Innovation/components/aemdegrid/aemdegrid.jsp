<%@include file="/libs/foundation/global.jsp"%>

<html>
    <head> 
        <style type="text/css">
            	body {
                    font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
                    color: #4f6b72;

                }


                a {
                    color: #c75f3e;
                }

                #mytable {
                    width: 700px;
                    padding: 0;
                    margin: 0;
                }


                caption {
                    padding: 0 0 5px 0;
                    width: 700px;	 
                    font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
                    text-align: right;
                }


                th {
                    font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
                    color: #4f6b72;
                    border-right: 1px solid #C1DAD7;
                    border-bottom: 1px solid #C1DAD7;

                    border-top: 1px solid #C1DAD7;
                    letter-spacing: 2px;
                    text-transform: uppercase;
                    text-align: left;
                    padding: 6px 6px 6px 12px;

                    background: #CAE8EA url(./bg_header.jpg) no-repeat;
                }
                
                
                th.nobg {
                    border-top: 0;
                    border-left: 0;
                    border-right: 1px solid #C1DAD7;
                    background: none;
                }
                
                
                td {
                    border-right: 1px solid #C1DAD7;
                    border-bottom: 1px solid #C1DAD7;
                    background: #fff;
                    padding: 6px 6px 6px 12px;
                    color: #4f6b72;
                }
                
                
                
                td.alt {
                    background: #F5FAFA;
                    color: #797268;
                }
                
                
                th.spec {
                    border-left: 1px solid #C1DAD7;
                    border-top: 0;
                    background: #fff url(images/bullet1.gif) no-repeat;
                    font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
                }
                
                
                th.specalt {
                    border-left: 1px solid #C1DAD7;
                    border-top: 0;
                    background: #f5fafa url(images/bullet2.gif) no-repeat;
                    font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
                    color: #797268;
                }
    	</style>
        <script type="text/javascript">
            function fnedit(cellid){

                var retriveselecedcell = cellid;
                //splitting the value based on the Pipe Symbol '|'

                var txtid = retriveselecedcell; 
                var textid = document.getElementById(txtid);
   				alert(textid);
   				document.getElementById(txtid).setAttribute('disabled', false);
                //document.getElementById("myText").disabled
            }


        </script>

    </head>
    <body>
        <%  
    		int rows = properties.get("rows",0); 
            int cols = properties.get("cols",0);
		%>
        Here you have entered the no.of row (s) : <%=rows %>
        Here you have entered the no.of col (s) : <%=cols %>
        <table id="mytable" cellspacing="0">
            <c:forEach var="k" begin="1" end="<%=cols%>">
                <th scope="col" >table Heading <c:out value="${k}"/></th>
            </c:forEach>
            <c:forEach var="i" begin="1" end="<%=rows%>"> 
            <tr>
                        <c:forEach var="j" begin="1" end="<%=cols%>"> 

                            <td id="row-${i}|cell-${j}"  class="alt" >
                         <input type='text' id="txt-row-${i}|cell-${j}" value="txt-row-${i}|cell-${j}"   style="border:0px; width:50px;" onclick="fnedit(this.id)" disabled/>
                            </td>

                        </c:forEach>
            </tr>		
            </c:forEach>
        </table>

    </body>
</html>