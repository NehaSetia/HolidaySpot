<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Availability</title>

<script type="text/javascript">
function validate()
{
	var from = document.forms["f1"]["from_date"].value;
	var to = document.forms["f1"]["to_date"].value;
	var rm = document.forms["f1"]["no_of_rooms"].value;
	var mem = document.forms["f1"]["no_of_members"].value;
	if(from==null || from=="" || to==null || to=="" ||rm==null || rm=="" ||mem==null || mem=="" )
		{
			alert("Please fill all the details");
        	return false;
		}

	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	var date = mm+'/'+dd+'/'+yyyy;

	/*if(from<date || to<date)
		{
			alert("Please select correct date");
			return false;
		}*/
	if(mem/rm > 3)
		{
			alert("Maximum capacity of each room is 3");
			return false;
		}
	if(mem==0 || rm==0)
		{
			alert("Please fill values greater than 0");
		}
	}
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>

<%String url[]=((request.getParameter("type").replace('+',' ')).trim()).split(" ");
String hotel_id = url[0];

String name = pkg.QueryDatabase.getAsString("select name from hotel_details where hotel_id='"+hotel_id+"'");
String type="";
for(int i=1;i<url.length;i++)
{
	type += url[i]+" ";
	}%>

<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	<form name="f1" action="#" method="post" onsubmit="return validate()">
	<h1 align="center"><%=name %>  </h1>  <h2 align="center">   Room Type:<%=type %></h2>
		<jsp:include page="requirements.html" flush="true"></jsp:include>
	 </form>
</div>

<%
String from_date=request.getParameter("from_date");

if(from_date!=null)
{

String to_date=request.getParameter("to_date");
String typ=((type.trim()).toLowerCase()).replace(' ','_');
String no_of_rooms=request.getParameter("no_of_rooms");
String no_of_members=request.getParameter("no_of_members");

String sql1="select dates, "+typ+" from availability_details where hotel_id= '"+hotel_id+"' and dates in(select dates from availability_details where dates between '" ;
String sql2="' and "+ typ+" > "+no_of_rooms+")" ;
String status = pkg.QueryDatabase.checkAvailability(sql1,sql2,from_date,to_date);
if(status.equals("available") && from_date!=null)
{
	%>
	<form action="book_now.jsp" align="center">
		<input type="hidden" value="<%=session.getAttribute("user_id") %>" name="user_id">
		<input type="hidden" value="<%=from_date %>" name="from_date">
		<input type="hidden" value="<%=to_date %>" name="to_date">
		<input type="hidden" value="<%=no_of_rooms %>" name="no_of_rooms">
		<input type="hidden" value="<%=no_of_members %>" name="no_of_members">
		<input type="hidden" value="<%=hotel_id %>" name="hotel_id">
		<input type="hidden" value="<%=type %>" name="type">
		<input type="submit" value="Book Now" align="middle">
	</form>
	<% 
}
else
{
%>
	<p style="color:red;" >**Sorry!!Rooms Not Available for selected dates!!!</p>
	<% 
}
}
 %>
 
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>