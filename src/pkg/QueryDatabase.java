package pkg;

import java.sql.*;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class QueryDatabase {

	//Retrieve a single value as string
	public static String getAsString(String sql)
	{
		String result=null;
		Connection con=DBConnect.getConn();
		try
		{
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			if(rs.next())
				result=rs.getString(1);
			System.out.println("price:"+result);
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
	
	//Get hotel id and name for search
	public static HashMap<String,String> getDetails(String sql)
	{
		HashMap<String, String> details=new HashMap<String, String>();
		Connection con=DBConnect.getConn();
		try
		{
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				String hno=rs.getString(1);
				String hname=rs.getString(2);
				details.put(hno,hname);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return details;
	}
	
	//Retrieve details of one or more hotels
	public static ArrayList<Hotel> getHotels(String sql)
	{
		ArrayList<Hotel> hotels = new ArrayList<Hotel>();
		Connection con=DBConnect.getConn();
		
		try
		{
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				Hotel h = new Hotel();
				h.setHotel_id(rs.getString(1));
				h.setName(rs.getString(2));
				h.setAddress(rs.getString(3));
				h.setPhone(rs.getString(4));
				h.setWebsite(rs.getString(5));
				hotels.add(h);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return hotels;
	}
	
	//Get room type and price
	public static HashMap<String,String> getRooms(String sql)
	{
		HashMap<String, String> details=new HashMap<String, String>();
		Connection con=DBConnect.getConn();
		try
		{
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				String rtype=rs.getString(1);
				String rprice=rs.getString(2);
				details.put(rtype,rprice);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return details;
	}
	
	//Check availability
	public static String checkAvailability(String sql1,String sql2, String from, String to)
	{
		System.out.println(to);
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/yyyy");
		Date d1,d2;
		String from_date="",to_date="",from_upper="",to_upper="";
		try {
			d1 = sdf1.parse(from);
			sdf1.applyPattern("dd-MMM-yy");
			from_date = sdf1.format(d1);
			from_upper = from_date.toUpperCase();
			
			d2 = sdf2.parse(to);
			sdf2.applyPattern("dd-MMM-yy");
			to_date = sdf2.format(d2);
			to_upper = to_date.toUpperCase();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql3=from_upper +"' and '" +to_upper;
		System.out.println("ca"+from_upper+ " "+ to_upper);
		String status="available";
		Connection con=DBConnect.getConn();
		int count=0;
		int no_of_days=countDays(from_date, to_date);
		no_of_days++;
		System.out.println("days:"+no_of_days);
		String date, start_upper=from_upper,start=from_date;
		int avail;
		try
		{
			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs=st.executeQuery(sql1+sql3+sql2);
			while(rs.next())
			{
				count++;
			}
			System.out.println("count:"+count);
			rs.beforeFirst();
			
			if(count != no_of_days)
			{
				if(count==0)
				{
					status=start_upper;
				}
				else
				{
					while(rs.next())
					{
						date=rs.getString(1);
						if(!start_upper.equals(date))
						{
							status=start_upper;
							break;
						}
						start=QueryDatabase.nextDate(start);
						start_upper=start.toUpperCase();
						System.out.println(start_upper);
					}
				}
				
			}
			
			con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static int countDays(String from_date,String to_date)
	{
		SimpleDateFormat myFormat1 = new SimpleDateFormat("dd-MMM-yy");
		SimpleDateFormat myFormat2 = new SimpleDateFormat("dd-MMM-yy");
		int days=0;
		try {
		    Date date1 = myFormat1.parse(from_date);
		    Date date2 = myFormat2.parse(to_date);
		    long diff = date2.getTime() - date1.getTime();
		    days = (int)TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
		    
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return days;
	}
	
	public static String nextDate(String date)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yy");
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(sdf.parse(date));
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		c.add(Calendar.DATE, 1);  // number of days to add
		String dt = sdf.format(c.getTime());
		return dt;
	}
	public static String super_admin_login(String login_id, String pass){
		String chk="false";
		try {
			
			Connection con = DBConnect.getConn();
			
			CallableStatement cs= con.prepareCall("{Call HS_super_login_chk(?,?,?)}");	
			cs.setString(1, login_id);
			cs.setString(2, pass);
			cs.registerOutParameter(3,java.sql.Types.NUMERIC);
			
			int i=cs.executeUpdate();
			int chk1=cs.getInt(3);
	
		
			if(i!=0)
			{
				if(chk1==1){
					chk= "true";
				}
			else if(chk1==0){
				chk="false";
			}
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return chk;
		
	}
	
	public static String hotel_admin_login(String login_id, String pass){
		String chk="false";
		try {
			Connection con = DBConnect.getConn();
			
			CallableStatement cs= con.prepareCall("{Call HS_hotel_login_chk(?,?,?)}");	
			cs.setString(1, login_id);
			cs.setString(2, pass);
			cs.registerOutParameter(3,java.sql.Types.NUMERIC);
			
			int i=cs.executeUpdate();
			int chk1=cs.getInt(3);
	
		
			if(i!=0)
			{
				if(chk1==1){
					chk= "true";
				}
			else if(chk1==0){
				chk="false";
			}
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return chk;
	}
	
	//Generate ID
	 
	public static String getId(String c, String table) 
	 
	{
	 
	        String id = c;
	 
	        try {
	 
	                 int max = 0;
	 
	                 Connection con = DBConnect.getConn();
	 
	                 Statement st = con.createStatement();
	 
	                 ResultSet res = st.executeQuery("select count(*) from " + table);
	 
	                 if (res.next()) {
	 
	                        max = res.getInt(1);
	 
	                 }
	 
	                 if (max >= 0 && max < 10) {
	 
	                        id = id + "00" + (max + 1);
	 
	                 } else if (max >= 10 && max < 100) {
	 
	                        id = id + "0" + (max + 1);
	 
	                 } else if (max >= 100 && max < 1000) {
	 
	                        id = id + "" + (max + 1);
	 
	                 }
	 
	                 con.close();
	 
	        } catch (Exception e) {
	 
	                 e.printStackTrace();
	 
	        }
	 
	       
	 
	        return id;
	 
	}
	public static String user_login(String login_id, String pass){
		String chk=null;
		try {
			Connection con = DBConnect.getConn();
			
			CallableStatement cs= con.prepareCall("{Call HS_user_login_chk(?,?,?)}");	
			cs.setString(1, login_id);
			cs.setString(2, pass);
			cs.registerOutParameter(3, java.sql.Types.NUMERIC);
			
			int i=cs.executeUpdate();
			int chk1=cs.getInt(3);
	
		
			if(i!=0)
			{
				if(chk1==1){
					chk= "true";
				}
				else{
				chk="false";
				}
			}
			
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return chk;
		
	}
	
	public static String add_hotel(String sql)
	{
		String result=null;
		Connection con=DBConnect.getConn();
		try
		{
			Statement st=con.createStatement();
			int add=st.executeUpdate(sql);
			if(add!=0)
				result= "DATA ENTERED";
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	
	
	}
	public static String delete_hotel(String sql)
	{
		String result="false";
		Connection con=DBConnect.getConn();
		try
		{
			Statement st=con.createStatement();
			int add=st.executeUpdate(sql);
			if(add!=0)
				result= "true";
			else
				result="false";
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	
	
	}
	

public static ArrayList<Customer> viewCustomers(String hotel_id)
{
      ArrayList<Customer> customer = new ArrayList<Customer>();
      Connection con=DBConnect.getConn();
      
      try
      {
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select user_id,name,gender,phone,address,email,pan_card_no from customer_details where user_id in(select user_id from booking_details where hotel_id='"+hotel_id+"')");
            while(rs.next())
            {
            	Customer c = new Customer();
                  c.setUser_id(rs.getString(1));
                  c.setName(rs.getString(2));
                  c.setGender(rs.getString(3).charAt(0));
                  c.setPhone(rs.getString(4));
                  c.setAddress(rs.getString(5));
                  c.setEmail(rs.getString(6));
                  c.setPan_card_no(rs.getString(7));
                  customer.add(c);
                  
                  
                  
            }
            con.close();
      }
      catch(Exception e)
      {
            e.printStackTrace();
      }
      return customer;
}


public static ArrayList<Booking> viewBookings(String hotel_id)
{
      ArrayList<Booking> booking = new ArrayList<Booking>();
      Connection con=DBConnect.getConn();
      System.out.println("hotel"+hotel_id);
      try
      {
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from booking_details where hotel_id='"+hotel_id+"'");
            while(rs.next())
            {
            	Booking b = new Booking();
                  b.setBooking_id(rs.getString(1));
                  b.setHotel_id(rs.getString(2));
                  b.setUser_id(rs.getString(3));
                  b.setRoom_type(rs.getString(4));
                  b.setNo_of_rooms(rs.getInt(5));
                  b.setNo_of_members(rs.getInt(6));
                  b.setFrom_date(rs.getDate(7).toString());
                  b.setTo_date(rs.getDate(8).toString());
                  b.setBooking_date(rs.getDate(9));
                  b.setStatus(rs.getString(10));
                  booking.add(b);   
                  
            }
            con.close();
      }
      catch(Exception e)
      {
            e.printStackTrace();
      }
      return booking;
}

	
	
}
