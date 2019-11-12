<%@ page language="java" contentType="text/plain;charset=ISO-8859-1"
	import="java.util.* ,java.io.*,beanseal.* , java.sql.* , database.*"%>

<%
            
		String fromdateq = request.getParameter("fromdate");
        String todateq = request.getParameter("todate");
	try {
		
			String result = SearchByDateBeanEAL.searchByDateAndGenerateEXCEL(fromdateq,todateq);
		     if(result.equals("success")){
		    	 out.println("Succesfully Generated Excel");
		     }
		     else{
		    	 out.println("Could'nt Generate Excel");
		     }
		}
		    catch (Exception ex) {
			out.println(ex.getLocalizedMessage());
		}
		
		//System.out.println(fromdateq + todateq);
	%>
