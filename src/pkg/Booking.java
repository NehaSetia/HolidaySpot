package pkg;

import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;

public class Booking {
	private String booking_id;
	private String hotel_id;
	private String user_id;
	private String room_type;
	private int no_of_rooms;
	private int no_of_members;
	private String from_date ;
	private String to_date;
	private Date booking_date;
	private String status;
	private String type;
	private int total;
	private int price;
	
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getType() {
		System.out.println(type);
		return type;
	}
	public void setType(String type) {
		type=type.replace('+',' ').trim();
		//System.out.println(type+"rrrr");
		this.type = type;
	}
	public String getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}
	public String getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public int getNo_of_rooms() {
		return no_of_rooms;
	}
	public void setNo_of_rooms(int no_of_rooms) {
		this.no_of_rooms = no_of_rooms;
	}
	public int getNo_of_members() {
		return no_of_members;
	}
	public void setNo_of_members(int no_of_members) {
		this.no_of_members = no_of_members;
	}
	public String getFrom_date() {
	
		return from_date;
	}
	public void setFrom_date(String from_date) {
		System.out.println("from...."+from_date);
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
		Date d1;
		try {
			d1 = sdf1.parse(from_date);
			sdf1.applyPattern("dd-MMM-yy");
			from_date = sdf1.format(d1);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.from_date = from_date;
	}
	public String getTo_date() {
	
		return to_date;
	}
	public void setTo_date(String to_date) {
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
		Date d1;
		try {
			d1 = sdf1.parse(to_date);
			sdf1.applyPattern("dd-MMM-yy");
			to_date = sdf1.format(d1);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.to_date = to_date;
	}
	public Date getBooking_date() {
		return booking_date;
	}
	
	public String getStatus() {
		return status;
	}
	
	public String insertBooking()
	{
		String b_id="";
		b_id = QueryDatabase.getId("b", "booking_details");
		booking_id=b_id;
		Connection con=DBConnect.getConn();
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into booking_details values(?,?,?,?,?,?,?,?,sysdate,'booked')");
			ps.setString(1,b_id);
			ps.setString(2,hotel_id);
			ps.setString(3,user_id);
			ps.setString(4,type);
			ps.setInt(5,no_of_rooms);
			ps.setInt(6,no_of_members);
			ps.setString(7,from_date);
			ps.setString(8,to_date);
			
			int i=ps.executeUpdate();
			if(i!=0)
			{

				String typ = ((type.trim()).toLowerCase()).replace(' ', '_');
				PreparedStatement p = con.prepareStatement("update availability_details set "+typ+" = "+ typ+ "-? where hotel_id = ? and" +
						"dates between ? and ?" );
				p.setInt(1,no_of_rooms );
				p.setString(2, hotel_id);
				p.setString(3, from_date.toUpperCase());
				p.setString(4, to_date.toUpperCase());
				
				int x = p.executeUpdate();
				
			}
			else
			{
				b_id="not booked";
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("in booking");
			e.printStackTrace();
		}
		return b_id;
	}
	public void setStatus(String status) {
		// TODO Auto-generated method stub
		this.status=status;
	}
	public void setBooking_date(java.sql.Date booking_date) {
		// TODO Auto-generated method stub
		this.booking_date=booking_date;
	}
	
}

