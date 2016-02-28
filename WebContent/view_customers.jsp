<%@page import="sun.java2d.loops.CustomComponent"%>
<%@page import="pkg.Customer"%>
<%@page import="pkg.QueryDatabase"%>
<%@page import="pkg.Hotel"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customers</title>
</head>
<body>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">

	  <table style="border: thin; background-color:activeborder; color:white; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
	  		<td><a href="view_bookings.jsp"><input type="button" name="button1" value="Bookings"></a></td>
	  		<td><a href="view_customers.jsp"><input style="background-color: cyan" type="button" name="button2" value="Customers"></a></td>
			<td><a href="view_hotels.jsp"><input type="button" name="button3" value="Hotels"></a></td>
	  	</tr>
</table>
<%!ArrayList<Customer> customer = new ArrayList<Customer>(); %>
<%
customer=QueryDatabase.viewCustomers(request.getParameter("hotel_id"));
Iterator <Customer> itr=customer.iterator();
Customer cu;%>
<form action="delete_customer" method="post" >
<table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black">
<tr>
<th>User Id</th>
<th>Name</th>
<th>Gender</th>
<th>Phone</th>
<th>Address</th>
<th>Email</th>
<th>Pan Card No</th>
</tr>
<%
while(itr.hasNext()){  
cu=(Customer)itr.next();
%>
<tr><td><input type="hidden" name="user_id" value=<%=cu.getUser_id()%>></td></tr>
<tr>
<td><%=cu.getUser_id() %></td>
<td><%=cu.getName() %></td>
<td><%=cu.getGender() %></td>
<td><%=cu.getPhone() %></td>
<td><%=cu.getAddress() %></td>
<td><%=cu.getEmail() %></td>
<td><%=cu.getPan_card_no() %></td>

<td><input type="submit" name="button1" value="Delete"></td>
</tr><%} %>

</table>
</form>
</div>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	  <table style="border: thin; background-color:activeborder; color:white; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
		</tr>
</table>
</div>
</body>
</html>
