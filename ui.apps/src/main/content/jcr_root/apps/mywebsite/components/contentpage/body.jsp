<%@include file="/libs/foundation/global.jsp"%><%
%>
<body>
    <div id="CQ">
        <span style="font-size: 50px; ">
            <cq:include path="topnav" resourceType="mywebsite/components/topnav" />
        </span>
        <div class="content">
            <cq:include script="left.jsp" />
            <cq:include script="center.jsp" />
            <cq:include script="right.jsp" />
        </div>
        <div class="footer">
        	<cq:include path="toolbar" resourceType="foundation/components/toolbar"/>
        </div>
    </div>
</body>

