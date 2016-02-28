package pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class user_login extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String login_id = request.getParameter("login_id");
			String pass = request.getParameter("password");
			
			if(QueryDatabase.user_login(login_id, pass).equals("true")){
				 HttpSession session=request.getSession();
				String uid=QueryDatabase.getAsString("select user_id from login_customer where login_id='"+login_id+"'");
				session.setAttribute("user_id",uid);
				String name=QueryDatabase.getAsString("select name from customer_details where user_id='"+uid+"'");
				session.setAttribute("name",name);
				response.sendRedirect("search_room.jsp");
			}
			else{
				response.sendRedirect("login.jsp");
			}
			
			
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}

}
