<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function message()
{
	  var x = document.forms["footerpg"]["name"].value;
	   var y = document.forms["footerpg"]["email"].value;
	    var z = document.forms["footerpg"]["comment"].value;
     if (x == null || x == ""||y == null || y == ""||z == null || z == "") 
     {
         alert("Please fill the entry");
         return false;
         }
         else
	window.alert("Thanks for the feedback") ;
 }


</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div style="background-color:white;">
<form action="index.jsp" name="footerpg" onsubmit="return message()">
<h4 align="left" style="font:fantasy;">Name:</h4>
<input type="text" name="name">
<h4 align="left" style="font:fantasy;">Email:</h4>
<input type="text" name="email">
<h4 align="left" style="font:fantasy;">Comments:</h4>
<textarea cols="" style="width: 363px; height: 120px" name="comment"></textarea><br/>
<h4 align="left" style="font:fantasy;">
<input type="submit" style="width: 110px; " value="Submit"   ></h4>
</form></div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>