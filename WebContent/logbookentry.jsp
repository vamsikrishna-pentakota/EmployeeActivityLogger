<%@ page language="java" contentType="text/plain;charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,beanseal.*,database.*,java.sql.*" session="true"%>
 <%
    String doe = request.getParameter("dateofentry");
    String equip = request.getParameter("equipment");
    String subequip = request.getParameter("subequipment");
    String act = request.getParameter("activity");
    String obs = request.getParameter("observations");
    String actn = request.getParameter("action");
    String breakanyl = request.getParameter("brkanyl");
    String rmrks = request.getParameter("remarks");
    String modific = request.getParameter("modifications");
    String attd = request.getParameter("attendance");
    String signature = request.getParameter("sign");
 
 
    AccesserEAL a = (AccesserEAL) session.getAttribute("empname");
    String empidq = a.getEmpid();
 
    String status;
    try {
		Connection con = null;
		int count = LogBookEntryBean.logBookEntry(empidq,doe,equip,subequip,act,obs,actn,breakanyl,rmrks,modific,attd,signature);
		if (count == 1) {
		    status = "success";
			System.out.println("Reached Here for Log Book");
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
