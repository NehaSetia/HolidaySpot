<%@page import="pkg.QueryDatabase"%>
<%@page import="pkg.Hotel"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function delet(){
var con=confirm("Do you really want to delete ?");
if(con==true){
window.location.href="delete_hotel.jsp";
}
else{
window.location.href="view_hotels.jsp";
}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotels</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	
	  <table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
	  		<td><a href="view_bookings.jsp"><input type="button" name="button1" value="Bookings"></a></td>
	  		<td><a href="view_customers.jsp"><input type="button" name="button2" value="Customers"></a></td>
			<td><a href="view_hotels.jsp"><input type="button" name="button3" value="Hotels" style="background-color: cyan"></a></td>
	  	</tr>
</table>


<%!ArrayList<Hotel> hotels = new ArrayList<Hotel>(); %>
<%
hotels=QueryDatabase.getHotels("select * from hotel_details");
Iterator <Hotel> itr=hotels.iterator();
%>
<form action="delete_hotel" method="post" >
<table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black">
<tr>
<th>Hotel Id</th>
<th>Name</th>
<th>Address</th>
<th>Web site</th>
<th>Delete</th>
</tr>
<%
while(itr.hasNext()){  
	Hotel ht=(Hotel)itr.next();
	String hotel_id=ht.getHotel_id();
%>

<tr>
<td><%=hotel_id %></td>
<td><%=ht.getName() %></td>
<td><%=ht.getAddress() %></td>
<td><a href="<%=ht.getWebsite()%>"><%=ht.getWebsite() %></a></td>
<td><input type="submit" name="button1" value="Delete" onclick="delet()"></td>
<td><input type="submit" name="button1" value="Bookings"></td>
<td><input type="submit" name="button1" value="Customers"></td>
<%System.out.println("..."+hotel_id); %>
<td><input type="hidden" name="hotel_id" value="<%=hotel_id %>" ></td>
</tr><%} %>

</table>
</form>
</div>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	  
	  <table style="border: thin; background-color:activeborder; color:white; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
	  		<td><a href="add_hotel.jsp"><input type="button" name="button1" value="Add"></a></td>
		</tr>
</table>

</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>