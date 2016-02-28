<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	<form action="super_admin_login" method="post">
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
	  	</tr>
	  </table>
	 </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>