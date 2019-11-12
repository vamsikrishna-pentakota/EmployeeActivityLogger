package beanseal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beanseal.AccesserEAL;
import database.DatabaseConnection;

public class LoginBeanEAL {

    public static AccesserEAL login(String empid , String emppass) throws Exception
    {
    	    AccesserEAL a= new AccesserEAL();
    	    String password="";
    	    Connection con = null;
    	    PreparedStatement ps = null;
    	    PreparedStatement ps1 = null;
    	    try{
    		
    	    	con =DatabaseConnection.getConnection ();
    	    	ps = con.prepareStatement("select EMPPASS from EMPPASSWORDS where EMPID=?");
           
    	    	ps.setString(1,empid);
       
            ResultSet rs = ps.executeQuery();
      
          while(rs.next()){
        	  password = rs.getString(1);
        	  System.out.println(password);
          }
            
            if ( password.equals(emppass)) {                               //if query executed successfully
            	
            	System.out.println("Second Query");
    	    	ps1 = con.prepareStatement("select EMPNAME from EMPINFO where EMPID=?");
           
    	    	ps1.setString(1,empid);
       
                ResultSet rs2 = ps1.executeQuery();
               	
                while(rs2.next()){
        	    a.setEmpname(rs2.getString(1));         
                }
        	    a.setEmpid(empid);
                return a;
                
                
            }    
            
            else
                return null;
    	
    	    }
            catch(Exception ex)
        {
            System.out.println("Error is "+ ex.getMessage());
            return null;
        }
    	    finally {
    			DatabaseConnection.close(ps);
    			DatabaseConnection.close(con);
    		}
        
    } // end of login()

}
