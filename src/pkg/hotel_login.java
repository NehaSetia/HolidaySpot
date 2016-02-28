package pkg;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class hotel_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
						
			String login_id = request.getParameter("login_id");
			String pass = request.getParameter("password");
			
			if(QueryDatabase.hotel_admin_login(login_id, pass).equals("true")){
				HttpSession session=request.getSession();
				String hid=QueryDatabase.getAsString("select hotel_id from login_admin where login_id='"+login_id+"'");
				session.setAttribute("hotel_id",hid);
				String name=QueryDatabase.getAsString("select name from hotel_details where hotel_id='"+hid+"'");
				//session.setAttribute("name",name);
				response.sendRedirect("hotel_admin_home.jsp");
				
			}
			else{
				response.sendRedirect("hotel_admin_login.jsp");
			}
			
			
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}

}
