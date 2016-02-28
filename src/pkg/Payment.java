package pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Payment {
	private String payment_mode;
	private long card_no;
	private String bank;
	public String getPayment_mode() {
		return payment_mode;
	}
	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
	public long getCard_no() {
		return card_no;
	}
	public void setCard_no(long card_no) {
		this.card_no = card_no;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	public String insertPayment(String b_id, int prc , int tot)
	{
		String status="not inserted";
		System.out.println(b_id);
		Connection con=DBConnect.getConn();
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into payment_details values(?,?,?,?,?,?,?,?)");
			ps.setString(1,b_id);
			ps.setString(2,payment_mode);
			ps.setInt(3,prc);
			double comm=tot*0.1;
			double tax=tot*0.14;
			ps.setDouble(4,tax);
			ps.setInt(5,tot);
			ps.setDouble(6,comm);
		
			ps.setLong(7,card_no);
			ps.setString(8,bank);
			
			int i=ps.executeUpdate();
			if(i!=0)
			{
				status="inserted";
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("in payment");
			e.printStackTrace();
		}
		return status;
	}
}
