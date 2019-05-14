<%@include file="/libs/foundation/global.jsp"%>
<%@page import="java.text.SimpleDateFormat, java.util.Date,java.util.Calendar, java.util.Date, java.text.DateFormat, java.util.TimeZone"%>
<cq:defineObjects/>


<html>
	<head>
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
			<script>
				jQuery(document).ready(function() {
                    var counter = 0;
                    window.setInterval("refreshDiv()", 5000);
                    function refreshDiv(){
                        counter = counter + 1;
                        document.getElementById("timediv").innerHTML  += "Testing " + counter;
                    }

					function count($this){
						var current = parseInt($this.html(), 0);
						current = current + 1; /* Where 1 is increment */

						$this.html(current);
						if(current > $this.data('count')){
							$this.html($this.data('count'));
						} else {
							setTimeout(function(){count($this)}, 5000);
						}
					}

					jQuery(".stat-count").each(function() {
					  jQuery(this).data('count', parseInt(jQuery(this).html(), 0));
					  jQuery(this).html('0');
					  count(jQuery(this));
					});
				});
			function tabs(selectedtab) {	
					// contents
					var s_tab_content = "tab_content_" + selectedtab;	
					var contents = document.getElementsByTagName("div");
					for(var x=0; x<contents.length; x++) {
						name = contents[x].getAttribute("name");
						if (name == 'tab_content') {
							if (contents[x].id == s_tab_content) {
							contents[x].style.display = "block";						
							} else {
							contents[x].style.display = "none";
							}
						}
					}	
					// tabs
					var	s_tab = "tab_" + selectedtab;		
					var tabs = document.getElementsByTagName("a");
					for(var x=0; x<tabs.length; x++) {
						name = tabs[x].getAttribute("name");
						if (name == 'tab') {
							if (tabs[x].id == s_tab) {
							tabs[x].className = "active";						
							} else {
							tabs[x].className = "";
							}
						}
					}	  
				}
			</script>

			<style>
				/*----- Tabs -----*/
				
					*{
						-webkit-box-sizing: border-box;
						-moz-box-sizing: border-box;
						box-sizing: border-box;
					}
					.tab_wrap{
						/*border:1px solid gray;
						max-width:700px;*/
						
						width: 100%;
					}


					.tabs {
						width: 100%;
						margin: auto;
						overflow: hidden;	
						
					}
					.tabs ul {
						list-style: none;
						overflow: hidden;
						padding: 0;
						margin: 0;	
											
					}
					.tabs li a {
						background:#FFFFFF;
						color: #444444;
						display: block;
						float: left;
						font-weight:bold;	
						padding: 10px;
						text-align: center;
						text-decoration: none;
						border:none;
						border-top-left-radius:5px;
						border-top-right-radius:5px;
						border-left:1px solid #d9d9d9;
						border-bottom:1px solid #d9d9d9;	
					}
					.tabs li a:hover {
						color: #7d7d7d;	
						background:#4a98d3;
					}
					.tabs li:first-child a {
						border-left:none;
					}
					.tabs li a.active {
						background:#4a98d3;
						border:none;
						border-left:1px solid #d9d9d9;
						border-bottom:1px solid #FFFFFF;	
					}
					.tabs li:first-child a.active {
						border:none;
						border-bottom:1px solid #FFFFFF;	
					}
					.tabs li:last-child a.active {
						border:none;
						border-left:1px solid #d9d9d9;	
						border-bottom:1px solid #FFFFFF;	
					}
					
					
					.tab_content {
						background:#FFF;
						padding:0;
						display:none;
						border-left:1px solid #d9d9d9;	
						border-bottom:1px solid #d9d9d9;	
						border-right:1px solid #d9d9d9;
						border-top:1px solid #d9d9d9;
						border-bottom-left-radius:5px;
						border-bottom-right-radius:5px;
					}
					.tab_content.active{
						display:block;	
					}
					.tab_content ul {
						margin:0px;
						padding:0px;
						list-style:none;	
					}
					.tab_content li {
						display:block;
						overflow: hidden;	
						border-bottom:1px solid #d6dde0;	
					}
					.tab_content li:last-child {
						border-bottom:none;
					}
					.tab_content li a {
						display:block;
						list-style:none;
						overflow: hidden;	
						padding:10px;			
						text-decoration:none;
						color:#444444;
					}
					.tab_content li a:hover {
						color:#000000;
						background:#F5F5F5;	
					}
					.tab_content li small {
						color:#AAAAAA;
						font-size:11px;
						font-style:italic;
					}
					.tab_content li a:hover small {
						color:#AAAAAA;
					}
					button{
					  margin      : 0;
					  padding     : 0;
					  border      : 0;
					  
					  font-family : inherit;
					  font-size   : 1em;
					  cursor      : pointer;
					  
					}

					.fdiv{
					   border: solid 1px;
					   float: left;
					   margin: 1em;
					   padding: 0 1em;
					   width: calc(100%/7 -6em);
					   }
					<!-- button > span > span{
					  visibility : hidden;
					} -->
					.stat {
						padding:20px 5px;
						background:#FFFFFF;
						text-align:center;
						float:left;
						margin-left:-1px;
                    width:100%;
                    	border-bottom-left-radius:5px;
						border-bottom-right-radius:5px;

					}
					.stat-count {
						font-size: 51px;
						font-weight: normal;
						letter-spacing: -0.02em;
						line-height: 1.2;
						margin-bottom: 20px;
						overflow:hidden;
						font-family:"Georgia", Courier, monospace;
						padding: 0;
						position: relative;
					}
					.stat-detail {
						color:#000;
						padding-top:10px;
						font: italic 1.3rem/1.75 "Georgia", Courier, monospace;
					}
			</style>
	</head>
	<body>
        <br/>
<!-- Code for Retreiving the date from the control starts here -->


<%	
    Date date = properties.get("edob", new Date());
    //DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    //dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
    //String CSDate = df.format(date);
    //get current date time with Date()
    //Date date1 = new Date();
    //System.out.println(dateFormat.format(date1));


%>

  <div id="timediv">
      <%
    		Date today = new Date();
			//Date today =  properties.get("edob", new Date());
	        //displaying this date on IST timezone
	        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	        df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
	        String IST = df.format(today);
	        %>
      <%=IST%></div>



			<!-- Ends Here -->

		<div class="tab_wrap">
			<div class="tabs">
				<ul>
					<li><a name="tab" id="tab_1" href="javascript:void(0)" onClick="tabs(1)" class="active"><%=properties.get("tabtitle","Personal Details")%></a></li>
					<li><a name="tab" id="tab_2" href="javascript:void(0)" onClick="tabs(2)">Recent</a></li>
					<li><a name="tab" id="tab_3" href="javascript:void(0)" onClick="tabs(3)" >New Arrivals</a></li>
					<li><a name="tab" id="tab_4" href="javascript:void(0)" onClick="tabs(4)">Old Stock</a></li>
                    <li><a name="tab" id="tab_5" href="javascript:void(0)" onClick="tabs(5)">Subscribers Count</a></li>
				</ul>
			</div>
			<div name="tab_content" id="tab_content_1" class="tab_content active">
				<ul>
					<li><a href="#"><%= properties.get("ename","Name")%><br /><small><%=date%></small></a></li>
					<li><a href="#">HTML Techniques<br /><small>2012 10 12</small></a></li>
					<li><a href="#">HTML Techniques<br /><small>2012 10 12</small></a></li>

				</ul>

			</div>
			<div name="tab_content" id="tab_content_2" class="tab_content">
				<ul>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
				</ul>
			</div>
			<div name="tab_content" id="tab_content_3" class="tab_content">
				<ul>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
				</ul>
			</div>
			<div name="tab_content" id="tab_content_4" class="tab_content">
				<ul>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
					<li><a href="#">2HTML Techniques<br /><small>2012 10 12</small></a></li>
				</ul>
			</div>
            <div name="tab_content" id="tab_content_5" class="tab_content">
				<div class="stat" >
                    <span class="stat-count">100</span>
                    <p class="stat-detail">Subscribers</p>
                 </div>
			</div>
            </div>

        <!--<div class="stat" style="float:left; position:relative;left:590px; top:-188px;">
			<span class="stat-count">100</span>
			<p class="stat-detail">Subscribers</p>
            </div>-->

	</body>
</html>