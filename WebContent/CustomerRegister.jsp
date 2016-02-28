<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="pkg.Customer">
</jsp:useBean>
<jsp:setProperty name="obj" property="*"/>
<jsp:getProperty property="login_id" name="obj"/>
<%

String status=obj.insertCustomer();
if(status.equals("valid"))
{
	%>
	<jsp:forward page="login.jsp"/>
	<%}
	else
	{
		%>
		<jsp:forward page="register.jsp"/>
<% 	}%>


</body>
</html>