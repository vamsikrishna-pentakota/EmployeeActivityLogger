<%@ page language="java" contentType="text/plain;charset=ISO-8859-1"
	import="java.util.*,beanseal.* , java.sql.* , database.*"%>

<%
            
		String empidq = request.getParameter("empid");
        String emppassq = request.getParameter("emppass");
        String status;
        try {
			Connection con = null;
			int count = RegisterWithPassBeanEAL.registerWithPassword(empidq,emppassq);
			if (count == 1) {
			    status = "success";
				System.out.println("Reached Here");
				out.println(status);
				System.out.println(status);
            
			DatabaseConnection.close(con);
		}
			else if(count == 99){
				status= "failed";
				out.println(status);
			}
		}
		    catch (Exception ex) {
			status= "failed";
			System.out.println(status);
			out.println(status);
			
		}
	%>
