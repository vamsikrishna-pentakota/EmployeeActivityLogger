package beanseal;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import database.DatabaseConnection;

public class SearchByDateBeanEAL {

	public static String searchByDateAndGenerateEXCEL(String fromdate , String todate) throws Exception {
		
		ResultSet rs = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = null;
		PreparedStatement ps = null;
		try {
			
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement("select EMPID,EQUIPMENTSUB,ACTIVITY,OBSERVATIONS,ACTIONTAKEN,BREAKDOWNANALYSIS,REMARKS,MODIFICATIONS,ATTENDANCE,SIGNATURE from EMPLOGBOOK where DATEOFENTRY BETWEEN ? AND ?");
					

			{
				ps.setString(1,fromdate);
				ps.setString(2,todate);
				rs = ps.executeQuery();
				
				
				int total = 2;
				
				
				
				try {
		            String filename = "D:/donebysrujana.xls" ;
		            HSSFWorkbook workbook = new HSSFWorkbook();
		            HSSFSheet sheet = workbook.createSheet("FirstSheet");  
           
		           			            
		            HSSFRow rowhead = sheet.createRow(0);
		            rowhead.createCell(0).setCellValue("EMPID"); // Check for removal--suggest by sruj(ask Mr.SP)
		            rowhead.createCell(1).setCellValue("EQUIPMENT");
		            rowhead.createCell(2).setCellValue("ACTIVITY");
		            rowhead.createCell(3).setCellValue("OBSERVATIONS");
		            rowhead.createCell(4).setCellValue("ACTIONTAKEN");
		            rowhead.createCell(5).setCellValue("BREAKDOWNANALYSIS");
		            rowhead.createCell(6).setCellValue("REMARKS");
		            rowhead.createCell(7).setCellValue("MODIFICATIONS");
		            rowhead.createCell(8).setCellValue("ATTENDANCE");
		            rowhead.createCell(9).setCellValue("SIGNATURE");
		         
		            while(rs.next()){
		            	
		            HSSFRow row = sheet.createRow(total);
		            row.createCell(0).setCellValue(rs.getString("EMPID"));
		            row.createCell(1).setCellValue(rs.getString("EQUIPMENTSUB"));
		            row.createCell(2).setCellValue(rs.getString("ACTIVITY"));
		            row.createCell(3).setCellValue(rs.getString("OBSERVATIONS"));
		            row.createCell(4).setCellValue(rs.getString("ACTIONTAKEN"));
		            row.createCell(5).setCellValue(rs.getString("BREAKDOWNANALYSIS"));
		            row.createCell(6).setCellValue(rs.getString("REMARKS"));
		            row.createCell(7).setCellValue(rs.getString("MODIFICATIONS"));
		            row.createCell(8).setCellValue(rs.getString("ATTENDANCE"));
		            row.createCell(9).setCellValue(rs.getString("SIGNATURE"));
		            total++;
              }
		            FileOutputStream fileOut = new FileOutputStream(filename);
		            workbook.write(fileOut);
		            fileOut.close();
		            workbook.close();
		            return "success";

		        } catch ( Exception ex ) {
		            System.out.println(ex.getLocalizedMessage());
		        }
				
				
				
			}
				
			

		} catch (Exception ex) {
			System.out.println(ex);
			return "failure";

		}
		//System.out.println("Returned rs");
		return "success" ;
	}

     
}

