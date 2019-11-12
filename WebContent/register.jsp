<%@ page language="java" contentType="text/plain;charset=ISO-8859-1"
	import="java.util.*,beanseal.* , java.sql.* , database.*"%>

<%
            
		String empidq = request.getParameter("empid");
		try {
			Connection con = null;
			ResultSet rs = RegisterBeanEAL.register(empidq);
			while (rs.next()) {
			    String getdata = rs.getString(1) + "***" + rs.getString(2)+ "***" + rs.getString(3)+ "***" + rs.getString(4);
				//System.out.println("Reached Here");
				out.println(getdata);
				//System.out.println(getdata);

			DatabaseConnection.close(con);
		}
		}
		    catch (Exception ex) {
			out.println(ex.getLocalizedMessage());
		}
	%>
