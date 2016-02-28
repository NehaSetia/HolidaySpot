<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Hotel</title>
</head>
<body>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">

	  <table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
	  		<td><a href="view_bookings.jsp"><input type="button" name="button1" value="Bookings"></a></td>
	  		<td><a href="view_customers.jsp"><input type="button" name="button2" value="Customers"></a></td>
			<td><a href="view_hotels.jsp"><input type="button" name="button3" value="Hotels"></a></td>
	  	</tr>
</table>

</div>

<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	<form action="validate_add_hotel" method=post>
	  <table style="border: thin; background-color:activeborder; color:white; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  
	  	<tr>
	  		<td>Hotel Name</td>
	  		<td><input type="text" name="name" ></td>
	  	</tr>
	  	
	  <tr>
	  		<td>Address</td>
	  		<td><textarea name="address"></textarea></td>
	  	</tr>
	  	<tr>
	  		<td>Phone</td>
	  		<td><input type="text" name="phone" maxlength="10"></td>
	  	</tr>
	  	
	  	<tr>
	  		<td>Web site</td>
	  		<td><input type="text" name="website" ></td>
	  	</tr>
	  		<tr>
	  		<td>Login ID</td>
	  		<td><input type="text" name="login_id" ></td>
	  	</tr>
	  	<tr>
	  		<td>Password</td>
	  		<td><input type="password" name="password" ></td>
	  	</tr>
	  	<tr>
	  		<td><input type="submit" value="Submit"></td>
	  		<td><input type="button" value="Cancel" onclick="window.location.href='view_hotels.jsp';"></td>
	  	</tr>
	  </table>
	</form>
	</div>
</body>
</html>