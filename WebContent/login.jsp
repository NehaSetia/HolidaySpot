<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="pkg.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script type="text/javascript">
function validate()
{
	var id = document.forms["f1"]["login_id"].value;
	var pass = document.forms["f1"]["password"].value;
	
	if(id==null || id=="" || pass==null || pass=="" )
		{
			alert("Please fill all the details");
        	return false;
		}

	}
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	<form name="f1" action="user_login" onsubmit="return validate()" method="post">
	  <table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
	  		<td>Login ID</td>
	  		<td><input type="text" name="login_id" ></td>
	  	</tr>
	  	<tr>
	  		<td>Password</td>
	  		<td><input type="password" name="password" ></td>
	  	</tr>
	  	<tr>
	  		<td><input type="submit" value="Login"></td>
	  		<td><input type="button" value="Cancel" onclick="window.location.href='index.jsp';"></td>
	  	</tr>
	  	<tr>
	  	<td>New User?</td>
	  	<td><a href="register.jsp" >Register</a></td>
	  	</tr>
	  </table>
	 </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>