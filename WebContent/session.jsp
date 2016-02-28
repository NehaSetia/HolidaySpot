<%
	if(session.getAttribute("user_id")==null || session.getAttribute("user_id") == "" )
	{
		response.sendRedirect("index.jsp");
		
	}
%>