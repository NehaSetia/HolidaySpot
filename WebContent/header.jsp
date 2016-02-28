<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div align="center">
<a href="index.jsp" style=" color: none;">
<img src="images/header.png"/>
</a>

<%
String uid="";
String hid="";
String sid="";
String name="";

 if((uid=(String)session.getAttribute("user_id"))!=null ||( hid=(String)session.getAttribute("hotel_id"))!=null )
 {
name=(String)session.getAttribute("name");
%>


<p align="right">Hello <%=name %> <a href="logout.jsp" >Logout</a></p>

<%
}
else if(( sid=(String)session.getAttribute("login_id"))!=null)
{%>


<p align="right">Hello Admin  
 <a href="logout.jsp" >Logout</a></p>
<%
}
else{
response.sendRedirect("index.jsp");
}
%>
</div>
