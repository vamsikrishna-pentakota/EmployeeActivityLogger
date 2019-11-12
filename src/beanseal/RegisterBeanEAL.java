package beanseal;

import java.sql.*;

import database.DatabaseConnection;

public class RegisterBeanEAL {

	public static ResultSet register(String empid) throws Exception {
		
		ResultSet rs = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = null;
		PreparedStatement ps = null;
		try {

			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement("select EMPNAME, EMPEMAIL, EMPMOBILE, EMPDEPT from EMPINFO where "
					+ "EMPID = ? ");

			{
				ps.setString(1, empid);
				rs = ps.executeQuery();
				
			}
				
			

		} catch (Exception ex) {
			System.out.println(ex);
			

		}
		//System.out.println("Returned rs");
		return rs;
	}

}