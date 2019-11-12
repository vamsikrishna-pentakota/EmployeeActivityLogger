package beanseal;

import java.sql.*;

import database.DatabaseConnection;

public class LogBookEntryBean {

	public static int logBookEntry(String empid,String date, String equip,
			                               String equipsub, String activity, String obs,
			                               String action, String breakanyl, String remarks,
			                               String modific, String attendance, String sign) throws Exception {
		
		int count=0;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = null;
		PreparedStatement ps = null;
		try {

			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement("insert into EMPLOGBOOK values(?,?,?,?,?,?,?,?,?,?,?,?,emplogbook_sequence.nextval)");

			{
				//ps.setString(1,"emplogbook_sequence.nextval");
				ps.setString(1, empid);
				ps.setString(2, date);
				ps.setString(3, equip);
				ps.setString(4, equipsub);
				ps.setString(5, activity);
				ps.setString(6, obs);
				ps.setString(7, action);
				ps.setString(8, breakanyl);
				ps.setString(9, remarks);
				ps.setString(10, modific);
				ps.setString(11, attendance);
				ps.setString(12, sign);
				
				
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