<%@include file="/libs/foundation/global.jsp"%>

<%@page session="false" %>
	<div class="tab_wrap">
			<div class="tabs">
				<ul>
					<li><a name="tab" id="tab_1" href="javascript:void(0)" onClick="tabs(1)" class="active">Pavan Details</a></li>
					<li><a name="tab" id="tab_2" href="javascript:void(0)" onClick="tabs(2)">Recent</a></li>
					<li><a name="tab" id="tab_3" href="javascript:void(0)" onClick="tabs(3)" >New Arrivals</a></li>
					<li><a name="tab" id="tab_4" href="javascript:void(0)" onClick="tabs(4)">Old Stock</a></li>
                    <li><a name="tab" id="tab_5" href="javascript:void(0)" onClick="tabs(5)">Subscribers Count</a></li>
				</ul>
			</div>
			<div name="tab_content" id="tab_content_1" class="tab_content active">
				<ul>
					<li><a href="#">HTML Techniques<br /><small>2012 10 12</small></a></li>
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

        <div>
      <%
			com.SBH.ChangeDateFormat cdf = new com.SBH.ChangeDateFormat();
			java.util.Date today = properties.get("edob",java.util.Date.class);

			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			String testDateString = df.format(today);
			//System.out.println("String in dd/MM/yyyy format is: " + testDateString);
			//String Changedtfrmt = cdf.changeDtFormat(today.toString());

	  %>
            <br/><%=today%><br/> <%=Changedtfrmt%><br/>

</div>
