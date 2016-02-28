<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">

	  <table style="border: thin; background-color:activeborder; color:white; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
	  		<td><a href="view_bookings.jsp"><input type="button" name="button1" value="Bookings"></a></td>
	  		<td><a href="view_customers.jsp"><input type="button" name="button2" value="Customers"></a></td>
			<td><a href="view_hotels.jsp"><input type="button" name="button3" value="Hotels"></a></td>
	  	</tr>
</table>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>