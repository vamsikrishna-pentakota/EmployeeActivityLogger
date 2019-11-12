<%@ page language="java" contentType="text/plain; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*,beanseal.*"%>

           <% 
                      String empid = request.getParameter("empid");
                      if (empid != null)
                     {
                       String emppass = request.getParameter("emppass");
                       AccesserEAL a = beanseal.LoginBeanEAL.login(empid,emppass);
                       if ( a == null)
                    	   out.println(" Sorry--Invalid Login.....");
                       
                       else {
                    	    System.out.println("succesful");
                     	    session.setAttribute("empname",a);
                            response.sendRedirect("empspace.jsp");
                       }
                     } // end of if

           %>



