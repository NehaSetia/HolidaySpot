package pkg;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	public static Connection getConn()
	{
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
					"ayushi","ayushi");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
}
