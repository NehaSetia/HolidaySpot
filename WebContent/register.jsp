<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<script type="text/javascript">
	function check()
	{
		var lgn_id =document.getElementById('login_id').value;
		var chk=new pkg.Customer(&quot;Test String&quot;);
		if(chk.checkUser(lgn_id) =='true')
		{
			window.alert("Login ID already exists");
		}
		else
		{
		window.alert("Login ID ");
		}
	}
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div id="canvas" style="font-family:monospace; width: auto; height: auto; border-top:thick; background:menu;">
	<form action="CustomerRegister.jsp">
	  <table style="border: thin; background-color:activeborder; color:black; font-family:fantasy;" align="center" cellspacing="10"  bordercolor="black" >
	  	<tr>
	  		<td>Login ID</td>
	  		<td><input type="text" name="login_id" onblur="check()"></td>
	  	</tr>
	  	<tr>
	  		<td>Name</td>
	  		<td><input type="text" name="name" ></td>
	  	</tr>
	  	<tr>
			<td>Gender</td>
			<td><input type="radio" name="gender" value="m" id="gender">Male<input type="radio" name="gender" value="f">Female</td>
		</tr>
	  	<tr>
	  		<td>Password</td>
	  		<td><input type="password" name="password" ></td>
	  	</tr>
	  	<tr>
	  		<td>Phone</td>
	  		<td><input type="text" name="phone" maxlength="10"></td>
	  	</tr>
	  	<tr>
	  		<td>Address</td>
	  		<td><textarea name="address"></textarea></td>
	  	</tr>
	  	<tr>
	  		<td>Email ID</td>
	  		<td><input type="text" name="email" ></td>
	  	</tr>
	  	<tr>
	  		<td>PAN Card No.</td>
	  		<td><input type="text" name="pan_card_no" maxlength="10"></td>
	  	</tr>
	  	<tr>
	  		<td><input type="submit" value="Submit"></td>
	  		<td><input type="button" value="Cancel" onclick="window.location.href='index.jsp';"></td>
	  	</tr>
	  </table>
	</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>