<%@page import="pkg.QueryDatabase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Category</title>

<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<% String hotel=request.getParameter("hotel");
String type,price;
if(hotel==null)
{
	hotel="all";
	type="all";
	price="all";
}
else
{
	type=request.getParameter("type").replace('+',' ').trim();
	price=request.getParameter("price");
}
%>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	<form action="#">
	  <table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
		<tr>
		<td>Hotel</td>
		<%! HashMap<String, String> details; %>
		<%! String sql; %>
		<% sql="select hotel_id, name from hotel_details";
			details = QueryDatabase.getDetails(sql);
		 %>
		<td>
			<select name="hotel" >
				<option value="all">All</option>
			<% for(Map.Entry<String, String> m:details.entrySet()){
			%>
				<option value="<%=m.getKey() %>"><%=m.getValue()%></option>
			<%} %>
			</select>
		</td>
		</tr>
		<tr>
		<td>Room Type</td>
		<td>
			<select name="type" >
				<option value="all">All</option>
				<option value="Deluxe Room">Deluxe Room</option>
				<option value="Deluxe Suite Room">Deluxe Suite Room</option>
				<option value="Heritage Room">Heritage Room</option>
				<option value="Heritage Triple Room">Heritage Triple Room</option>
			</select>
		</td>
		</tr>
		<tr>
		<td>Price</td>
		<td>
			<select name="price" >
				<option value="all">All</option>
				<option value="3000">2000-3000</option>
				<option value="4000">3000-4000</option>
				<option value="5000">4000-5000</option>
				<option value="6000">5000-6000</option>
			</select>
		</td>
		</tr>
		<tr>
	  		<td><input type="submit" value="Search"></td>
	  		<td><input type="button" value="Cancel" onclick="window.location.href='index.jsp';"></td>
	  	</tr>
		</table>
	</form>
</div>
<% 
String hotel_id=request.getParameter("hotel");
System.out.print("hi"+hotel_id);
if(hotel_id != null)
{
	%>
<jsp:include page="select_room.jsp" flush="true">
<jsp:param value="<%= hotel_id%>" name="hotel"/>
<jsp:param value="<%=type%>" name="type"/>
<jsp:param value="<%=price%>" name="price"/>
</jsp:include>
<%} %>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>