<%@include file="/libs/foundation/global.jsp"%>

<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script type="text/javascript">
$(document).ready(function() {
$("#submit").click(function xyz(){
var user = $("#user").val();
var pass = $("#pass").val();
var repass = $("#repass").val();
var fname= $("#fname").val();
var lname= $("#lname").val();
var email= $("#email").val();
if(user == "" || pass == "" || repass == "" || email == "")    {
alert("Please Enter Username and Password");
return;
} else {
alert("UserName: "+user+" Password: "+pass);
var expression = "^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-z]]$";
if(!(pass == repass) )    {
alert("Passwords doen't match.");
return;
}
//if(!email.match(expression))    {
//alert("Please Enter Proper Email.");
//return;
//}
$.ajax({
url:"/bin/demoservlet",
type:"POST",
data:{"user":user,"password":pass,"repass":repass,"fname":fname,"lname":lname,"email":email},
success:function() {
alert("Success");

},
error:function()    {
alert("Error");
}

});
}

});
});
</script>
</head>


<body>
<div align = "center">
</div> <br/> <br/> <br/> <br/> 

<div align="center">
<table>
<tr><td>User Name* :</td><td><input type="text" id="user"/></td></tr>
<tr><td>Password* :</td><td><input type="password" id="pass"/></td></tr>
<tr><td>Retype Password* :</td><td><input type="password" id="repass"/></td></tr>
<tr><td>First Name :</td><td><input type="text" id="fname"/></td></tr>
<tr><td>Last Name :</td><td><input type="text" id="lname"/></td></tr>
<tr><td>email* :</td><td><input type="text" id="email"/></td></tr>
<tr><td></td><td><input type="button" value="Login" id="submit"/></td></tr>
</table>
</div>
</body>
</html>