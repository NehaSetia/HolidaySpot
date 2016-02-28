<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function func()
{
	document.forms["pay"].submit();
}
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<form action="#" name="pay" >
	<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
		<table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<caption><h2>Please enter your payment details</h2></caption>
	  	<tr>
	  	<td>Payment Mode </td>
	  	<td>
	  	<select name="payment_mode" onchange="func()">
	  	<%
	if(request.getParameter("payment_mode").equals("credit"))
	{%>
	  		<option value="cash" >Cash</option>
	  		<option value="credit" selected>Credit Card</option>
	  		<option value="debit">Debit Card</option>
	  <%}else if(request.getParameter("payment_mode").equals("debit")){ %>
	  <option value="cash" >Cash</option>
	  		<option value="credit" >Credit Card</option>
	  		<option value="debit" selected>Debit Card</option>
	  	<%}else{ %>
	  	<option value="cash" selected>Cash</option>
	  		<option value="credit" >Credit Card</option>
	  		<option value="debit" >Debit Card</option>
	  		<%} %>
	  	</select>
	</td>
	</tr>
	</table>
	</div>  	
	</form>
	
	<form action="book.jsp" >
	<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
		<table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
<%

	if(!request.getParameter("payment_mode").equals("cash"))
	{%>
		
	  	<tr>
	  	<td>Bank </td>
	  	<td><input type="text" name="bank"></td>
		</tr>
		<tr>
	  	<td>Card No </td>
	  	<td><input type="text" name="card_no"></td>
		</tr>
	<%} %>
		<tr>
		<td><input type="hidden" value="<%=request.getParameter("payment_mode") %>" name="payment_mode"></td>
		</tr>
		<tr>
		<td><input type="submit" value="book"></td>
		</tr>
	
	</table>
	</div>  	
	</form>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>