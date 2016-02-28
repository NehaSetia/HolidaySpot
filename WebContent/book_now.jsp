<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Now</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<jsp:useBean id="book" class="pkg.Booking" scope="session" ></jsp:useBean>
<jsp:setProperty property="*" name="book"/>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
<table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black">
	<tr>
		<td>Hotel</td>
		<%String hotel_nm = pkg.QueryDatabase.getAsString("select name from hotel_details where hotel_id ='"+book.getHotel_id()+"'") ;
		
		%>
		<td><%=hotel_nm %></td>
	</tr>
	<tr>
		<td>Room Type </td>
		<td><%=book.getType() %></td>
	</tr>
	<tr>
		<td>No of Rooms:  <%=book.getNo_of_rooms() %></td>
		<td>No of Members:  <%=book.getNo_of_members() %></td>
	</tr>
	<tr>
		<td>From: <%=book.getFrom_date() %></td>
		<td>To: <%= book.getTo_date()%></td>
	</tr>
	<tr>
	<%String prc = pkg.QueryDatabase.getAsString("select price from room_details where hotel_id ='"+book.getHotel_id()+"' and room_type='"+book.getType()+"'") ;
	int price=Integer.parseInt(prc);
	
	book.setPrice(price);
	int days=pkg.QueryDatabase.countDays(book.getFrom_date(),book.getTo_date());
	days++;
	int amount = days*price*book.getNo_of_rooms();
	book.setTotal(amount);
		%>
		<td>Price: <%=price %></td>
		<td>No of days: <%=days %></td>
	</tr>
	<tr>
		<td>Total Amount</td>
		<td><%=amount %></td>
	</tr>
	<tr>
		<td><a href="confirm_booking.jsp?payment_mode=cash"><input type="button" value="Confirm>>"></a></td>
	</tr>
	
</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>