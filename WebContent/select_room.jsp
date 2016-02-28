<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Room</title>
<script type="text/javascript">

function fvalidate()
{
	
	var tp = document.forms["f"]["type"].value;

	if(tp == null || tp=="")
		{
			alert("Please select hotel and room of your choice");
        	return false;
		}
}


</script>
<script type="text/javascript">
function winOpen(desc)
{
    var myWindow=window.open("","Description","width=300, height=300, top=150, left=300");
    myWindow.document.write(desc);
}
</script>


</head>
<body>
<% 
	
String hotel_id=request.getParameter("hotel");
%>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
<form name="f" action="check_availability.jsp" onsubmit=" return fvalidate();">
<%
	
	String type=request.getParameter("type").replace('+',' ').trim();
	String price=request.getParameter("price");
	
	String hquery="select * from hotel_details ";
	String rquery="select room_type, price from room_details ";
	ArrayList<pkg.Hotel> hotel;
	HashMap<String, String> room;
	
	if(!hotel_id.equals("all"))
	{
		hotel=pkg.QueryDatabase.getHotels(hquery+" where hotel_id='"+hotel_id+"'");
	}
	else
	{
		hotel=pkg.QueryDatabase.getHotels(hquery);
	}
	for(pkg.Hotel h:hotel)
	{
	 hotel_id=h.getHotel_id();
	%>

<table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	<caption ><br><br><h1><%=h.getName() %></h1></caption>
	<tr >
		<td><img src="images/<%=h.getName()%>/<%=h.getHotel_id()%>_1.jpg" alt="loading" style="width:304px;height:228px"></td>
		<td>Hotel : <%=h.getName() %><br>
			Address : <%= h.getAddress() %><br>
			Phone : <%= h.getPhone() %><br>
			Website : <a href="<%= h.getWebsite() %>"><%= h.getWebsite() %></a>
		</td>
	</tr>
	<tr style="font:bolder;">
		<td >Room Type</td>
		<td align="center">Price</td>
	</tr>
	<%
		if(!type.equals("all"))
		{
			room=pkg.QueryDatabase.getRooms(rquery+" where hotel_id='"+hotel_id+"' and room_type='"+type+"'");
		}	
		else
		{
			if(!price.equals("all"))
			{
				int hprc=Integer.parseInt(price);
				int lprc=hprc-1000;
				room=pkg.QueryDatabase.getRooms(rquery+" where hotel_id='"+hotel_id+"' and price between "+lprc+" and "+ hprc);
			}
			else
			{
				room=pkg.QueryDatabase.getRooms(rquery+" where hotel_id='"+hotel_id+"'");
			}
			
		}
			for(Map.Entry<String, String> m:room.entrySet()){
	 %>
	<tr>
		<td><input type="radio" name="type" value="<%=hotel_id %> <%=m.getKey()%>" >
		<%= m.getKey() %></td>
		<td align="center"><%= m.getValue() %></td>
	</tr>
	<%}
	
	 %>
	<tr>
		<td><input type="submit" value="Check Availability" ></td>
		<%String desc = pkg.QueryDatabase.getAsString("select description from hotel_description where hotel_id='"+hotel_id+"'");
		%>
		<td><a href="javascript:winOpen('<%=desc %>');" >View more</a></td>
	</tr>
</table>	

<% 
	}	
 %>
 </form>
 </div>

</body>
</html>