<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,beanseal.*,database.*,java.sql.*,java.io.*" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Search History </title>
<link href="ealstyles.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/personal19.png" type="png" />
<script type="text/javascript" src="jquery.js"></script>
<link rel="stylesheet" href="jquery-ui.css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="jquery-ui.js" type="text/javascript"></script> 

          <!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="TableTools/css/dataTables.tableTools.css">
<link rel="stylesheet" type="text/css" href="TableTools/css/dataTables.tableTools.min.css">

  
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="TableTools/js/dataTables.tableTools.js"></script>
<script type="text/javascript" charset="utf8" src="jquery.dataTables.js"></script>
       <script type="text/javascript">
       var date = new Date().toDateString();
       //var day = date.getDay()+"-"+ date.getMonth()+"-"+ date.getFullYear();
       //alert(day);
       var date1 = new Date().toString(); 
       $.fn.dataTable.TableTools.defaults.aButtons = [ {
           "sExtends": "pdf",
           "sTitle": "Search History("+date1+")" ,
           "sPdfMessage": "Pdf Generated on"+date1,
           "sPdfOrientation": "landscape"
       }, "copy", "xls", "print"];
       $(document).ready( function () {
    	   
    	  
    	 
    	   $("#table_id").dataTable({
    		  dom: 'T<"clear">lfrtip',
    		  tableTools: {
    			  "sSwfPath":"TableTools/swf/copy_csv_xls_pdf.swf"
    		  }
    		  
    	  });
    	});
      
    
       function showResult() {
    	   $('#table_id').DataTable();
    	   $('#searchtable').show();
            
        } 
        
        function goToLogBook(){
      	  window.location.replace("empspace.jsp");
        }
      	
      	
        function goToSearchSpace(){
      	  window.location.replace("searchhistory.jsp");
        }
        function goToLogout(){
        	  window.location.replace("logout.jsp");
          }
      	
        function goToSearchByDate(){
        	window.location.replace("searchhistory.jsp");
        }
        function goToSearchByAct(){
        	window.location.replace("searchhistoryactivity.jsp");
        }
        
    	
    	$(document).ready(
                function () {
                    $("#fromdate").datepicker(
                        {
                            dateFormat: "dd-M-y", changeMonth: true,
                            changeYear: true,
                            showAnim: "fold", showButtonPanel: true
                        })

                  }
              
                
            );
    	
    	$(document).ready(
                function () {
                    $("#todate").datepicker(
                        {
                            dateFormat: "dd-M-y", changeMonth: true,
                            changeYear: true,
                            showAnim: "fold", showButtonPanel: true
                        })

                  }
              
                
            );

        </script>
    </head>
    <body>
     <% AccesserEAL a = (AccesserEAL) session.getAttribute("empname"); 
       String name = a.getEmpid();
  
       String frmdate = request.getParameter("fromdate"); 
       String tdate = request.getParameter("todate"); 
       try{
                                 Class.forName("oracle.jdbc.driver.OracleDriver");

          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hr","hr"); 
          PreparedStatement ps = con.prepareStatement("select DATEOFENTRY,EQUIPMENTSUB,ACTIVITY,OBSERVATIONS,ACTIONTAKEN,BREAKDOWNANALYSIS,REMARKS,MODIFICATIONS,ATTENDANCE from EMPLOGBOOK where DATEOFENTRY BETWEEN ? AND ?");
          ps.setString(1,frmdate);
          ps.setString(2,tdate);
          ResultSet rs = ps.executeQuery();
        
          %>         
                
       <div id="tabspace">
        <table id="tabspacesearch" cellspacing =10px class="banner3">
     
      <tr><td><button class="logbooknew1" onclick="goToLogBook()">Log Book</button></td>
      <td><button class="searchnew1" onclick="goToSearchSpace()">Search</button></td>
      <td><button class="profilenew1">Profile</button></td>
      <td><button class="logoutnew1" onclick="goToLogout()">Logout</button></td>
      </tr>
  
 
 </table>   
 </div> 
           <div id="searchoptions" class="searchoptions">
           
           <input type="button" value="Search By Date"	class="optionsbutton" onclick="goToSearchByDate()" />
		   <input type="button" value="Search By Activity" class="optionsbutton2" onclick="goToSearchByAct()"/>
           </div>
           
      <div id="searchbydate" class="searchbydate">
     <form action="searchhistory.jsp" method="post"> 
   From : <input type="text" id="fromdate" name="fromdate" class="drop1" required="required" />			 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						To : <input type="text" id="todate" name="todate" class="drop1"
									 required="required" />			
						
						&nbsp;&nbsp;&nbsp;
						<input type="submit" value="Search Now"
									class="logbookbutton" />
     </form>
      </div>
     


<div class="datedetail">
 <h2>Log Book details from <span class="fdate"><%= frmdate %></span> to <span class="fdate"><%= tdate %></span> </h2>
</div>
    <div class="searchtable" id="searchtable">
        
                 <table id="table_id" class="display">
    <thead>
        <tr>
            
            <th>DATE OF ENTRY</th>
             <th>EQUIPMENT</th>
              <th>ACTIVITY</th>
              <th>OBSERVATIONS</th>
             <th>ACTIONTAKEN</th>
              <th>BREAKDOWNANALYSIS</th>
              <th>REMARKS</th>
              <th>MODIFICATIONS</th>
              <th>ATTENDANCE</th>
            
        </tr>
    </thead>
    <tbody>
     <% while(rs.next()){ %>
        <tr>
        
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(7) %></td>
            <td><%= rs.getString(8) %></td>
            <td><%= rs.getString(9) %></td>
            
        </tr>
        <%} %>
    </tbody>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
         <% 
           con.close();
          
          }
                   catch(Exception ex){
                       System.out.println(ex);
                   }
        
        %> 

         
          </body>
</html>