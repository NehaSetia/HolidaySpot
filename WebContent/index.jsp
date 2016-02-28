<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<script type="text/javascript">
var slideimages = new Array(); 
slideimages[0] = new Image(); 
slideimages[0].src = "images/OOty/ooty_1.jpg"; // set image object src property to an image's src, preloading that image in the process
slideimages[1] = new Image();
slideimages[1].src = "images/OOty/ooty_2.jpg";
slideimages[2] = new Image();
slideimages[2].src = "images/OOty/ooty_3.jpg";
slideimages[3] = new Image();
slideimages[3].src = "images/OOty/ooty_4.jpg";
slideimages[4] = new Image();
slideimages[4].src = "images/OOty/ooty_5.jpg";
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
	
<body>
			<div align="center">
				<table style="border: none;">
					<tr>
						<td >
							<a title="Home" href="index.jsp" style="text-decoration: none; color: navy; font-family: serif;">| Home </a>
						</td>
						<td>
							<a title="Search room" href="search_room.jsp" style="text-decoration: none; color: navy; font-family: serif;">| Search </a>
						</td>
						<td>
							<a title="User login" href="login.jsp" style="text-decoration: none; color: navy; font-family: serif;">| User </a>
						</td>
						<td>
							<a title="Hotel admin login" href="hotel_admin_login.jsp" style="text-decoration: none; color: navy; font-family: serif;">| Hotel Admin </a>
						</td>
						<td>
							<a title="Super admin login" href="super_admin_login.jsp" style="text-decoration: none; color: navy; font-family: serif;">| Super Admin </a>
						</td>
						<td>
							<a title="Contact Us" href="contact.jsp" style="text-decoration: none; color: navy; font-family: serif;" >| Contact Us |</a>
						</td>
						</tr>
				</table>
				</div>
			<jsp:include page="slider.jsp"></jsp:include>
			<jsp:include page="footer.jsp"></jsp:include>
</body>
	
</html>