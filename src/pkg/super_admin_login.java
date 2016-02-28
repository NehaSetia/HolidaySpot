package pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class super_admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String login_id = request.getParameter("login_id");
			String pass = request.getParameter("password");
			
			if(QueryDatabase.super_admin_login(login_id, pass).equals("true")){
				HttpSession session=request.getSession();
				session.setAttribute("login_id",login_id);
				response.sendRedirect("super_admin_home.jsp");
				
			}
			else{
				response.sendRedirect("super_admin_login.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		}

}
