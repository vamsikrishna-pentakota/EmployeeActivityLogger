package beanseal;

import java.sql.*;

import database.DatabaseConnection;

public class RegisterWithPassBeanEAL {

	public static int registerWithPassword(String empid,String emppass) throws Exception {
		
		int count=0;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = null;
		PreparedStatement ps = null;
		try {

			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement("insert into EMPPASSWORDS values(?,?)");

			{
				ps.setString(1, empid);
				ps.setString(2,emppass );
				count = ps.executeUpdate();
				
			}
				
			

		} catch (Exception ex) {
			System.out.println("Here is the fault");
			System.out.println(ex);
			return count = 99;

		}
		//System.out.println("Returned count");
		return count;
	}

}