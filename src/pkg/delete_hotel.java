package pkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class delete_hotel
 */
public class delete_hotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try {
	String hotel_id = request.getParameter("hotel_id");
	System.out.println(hotel_id);
			String butt= request.getParameter("button1");
			if(butt.trim().equalsIgnoreCase("delete")){
			
			String sql= "delete from hotel_details where hotel_id='"+hotel_id+"'";
			
			if(QueryDatabase.delete_hotel(sql).equals("true")){
				response.sendRedirect("view_hotels.jsp");
			}
			else{
				response.sendRedirect("view_hotels.jsp");
					
			}
			}
			else if(butt.trim().equalsIgnoreCase("bookings")){
				response.sendRedirect("view_bookings.jsp?hotel_id="+hotel_id);
				//RequestDispatcher rd= request.getRequestDispatcher("view_bookings.jsp");
				//rd.forward(request, response);
			}
			else if(butt.trim().equalsIgnoreCase("customers")){
				response.sendRedirect("view_customers.jsp?hotel_id="+hotel_id);
				//request.getRequestDispatcher("view_customers.jsp");
			}
			else{
				response.sendRedirect("view_hotels.jsp");
			}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}

}
