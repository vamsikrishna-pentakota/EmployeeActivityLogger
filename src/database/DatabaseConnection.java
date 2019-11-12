package database;

import java.sql.*;
public class DatabaseConnection {
    public static Connection getConnection()
    {
      try
      {
    	  Class.forName("oracle.jdbc.driver.OracleDriver");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hr","hr");
          return con;
      }
      catch(Exception ex)
      {
          System.out.println(ex.getMessage());
          return null;
      }
   }
    
   public static void close(Connection con)
   {
       try
       {
           con.close();
       }
       catch(Exception ex) {}
   }
   
   public static void close(Statement st)
   {
       try
       {
           st.close();
       }
       catch(Exception ex) {}
   }    

    
}
