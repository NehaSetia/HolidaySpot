<%@page import="pkg.QueryDatabase"%>
<%@page import="pkg.Hotel"%>
<%@page import="pkg.Booking"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bookings</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">

	  <table style="border: thin; background-color:activeborder; color:white; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
	  		<td><a href="view_bookings.jsp"><input type="button" name="button1" value="Bookings" style="background-color: cyan"></a></td>
	  		<td><a href="view_customers.jsp"><input type="button" name="button2" value="Customers"></a></td>
			<td><a href="view_hotels.jsp"><input type="button" name="button3" value="Hotels"></a></td>
	  	</tr>
</table>
<%!ArrayList<Booking> bookings = new ArrayList<Booking>(); %>
<%
System.out.println(request.getParameter("hotel_id"));
bookings=QueryDatabase.viewBookings(request.getParameter("hotel_id"));
Iterator <Booking> itr=bookings.iterator();
Booking bo;%>
<form action="delete_bookings" method="post" >
<table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black">
<tr>
<th>Booking Id</th>
<th>Hotel Id</th>
<th>User Id</th>
<th>Room Type</th>
<th>Number of Rooms</th>
<th>Number of Members</th>
<th>Room Booking Date</th>
<th>Return Date</th>
<th>Booking Date</th>
<th>Status</th>

<%
while(itr.hasNext()){  
bo=(Booking)itr.next();
%>
<tr><td><input type="hidden" name="booking_id" value=<%=bo.getBooking_id()%>></td></tr>
<tr>
<td><%=bo.getBooking_id() %></td>
<td><%=bo.getHotel_id() %></td>
<td><%=bo.getUser_id() %></td>
<td><%=bo.getRoom_type() %></td>
<td><%=bo.getNo_of_rooms() %></td>
<td><%=bo.getNo_of_members() %></td>
<td><%=bo.getFrom_date()  %></td>
<td><%=bo.getTo_date() %></td>
<td><%=bo.getBooking_date() %>
<td><%=bo.getStatus() %></td>


</tr><%} %>

</table>

</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>