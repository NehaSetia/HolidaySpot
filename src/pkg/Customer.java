package pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Customer {
	private String user_id;
	private String login_id;
	private String name;
	private char gender;
	private String password;
	private String phone;
	private String address;
	private String email;
	private String pan_card_no;
	
	public Customer() 
	{
		
		this.user_id = null;
		this.login_id = null;
		this.name =  null;
		this.gender =  '\0';
		this.password =  null;
		this.phone =  null;
		this.address =  null;
		this.email =  null;
		this.pan_card_no =  null;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPan_card_no() {
		return pan_card_no;
	}
	public void setPan_card_no(String pan_card_no) {
		this.pan_card_no = pan_card_no;
	}
	public String getUser_id() {
		return user_id;
	}
	
	public static String authenticate(String login_id, String password)
	{
		String usr_id=null;
		try
		{	
			Connection con=DBConnect.getConn();
			PreparedStatement ps = con.prepareStatement("select user_id from login_customer where login_id=? and password=?");
			ps.setString(1,login_id);
			ps.setString(2,password);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
				usr_id = rs.getString(1);
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return usr_id;
	}
	
	public static boolean checkUser(String login_id)
	{
		boolean status = false;
		try
		{	
			Connection con=DBConnect.getConn();
			PreparedStatement ps = con.prepareStatement("select login_id from customer_details where login_id=?");
			ps.setString(1,login_id);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
				status = true;
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	public void setUser_id(String user_id) {
		// TODO Auto-generated method stub
		this.user_id=user_id;
	}
	
	public String insertCustomer()
	{
		String status="invalid";
		try {
			Connection con=DBConnect.getConn();
			Statement st=con.createStatement();
			String user=QueryDatabase.getId("u","customer_details");
			 
			PreparedStatement ps1=con.prepareStatement("insert into customer_details values(?,?,?,?,?,?,?)");
			ps1.setString(1, user);
			ps1.setString(2, name);
			ps1.setString(3, String.valueOf(gender));
			ps1.setString(4, phone);
			ps1.setString(5, address);
			ps1.setString(6, email);
			ps1.setString(7, pan_card_no);
			
		    int n =	ps1.executeUpdate();
		    int i=0;
		    if(n!=0)
		    {
		    	status="valid";
		    	PreparedStatement ps2=con.prepareStatement("insert into login_customer values(?,?,?)");
				ps2.setString(1, login_id);
				ps2.setString(2, user);
				ps2.setString(3, password);
		    	
		    	i=ps2.executeUpdate();
		    }

		con.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return status;
		
	}
}
