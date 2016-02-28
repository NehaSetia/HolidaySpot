<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking status</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<jsp:useBean id="book" class="pkg.Booking" scope="session" ></jsp:useBean>

<%String booking_id=book.insertBooking();
 %>
 <jsp:useBean id="pay" class="pkg.Payment"></jsp:useBean>
 <jsp:setProperty property="*" name="pay"/>
 
 <%
 if(!booking_id.equals("not booked"))
 {
 String status=pay.insertPayment(booking_id,book.getPrice(),book.getTotal());
  if(status.equals("inserted"))
  {%>
  	<h1 style="color: green;">Booked successfully with bookig ID :<%=booking_id %></h1>
  <% }
  else
  {%>
  	<h1 style="color: red;">Oops! Booking Failed </h1>
  <% }
 }
 else
  {%>
  	<h1 style="color: red;">Oops! Booking Failed </h1>
  <% }
  %>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>