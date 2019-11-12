<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,beanseal.*,database.*,java.sql.*,java.io.*" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="ealstyles.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/personal19.png" type="png" />
<script type="text/javascript" src="jquery.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 

<title>EAL-RINL</title>

<script type="text/javascript">
	
	
  function goToLogBook(){
	  window.location.replace("empspace.jsp");
  }
	
	
  function goToSearchSpace(){
	  window.location.replace("searchhistory.jsp");
  }
  function goToLogout(){
	  window.location.replace("logout.jsp");
  }
	
	
	
var mainname = [
			{
				'name' : 'LOCO',
				'subname' : [ 'LOCO-1', 'LOCO-2', 'LOCO-3', 'LOCO-4', 'LOCO-5',
						'LOCO-6' ]
			},
			{
				'name' : 'CHARGING CAR',
				'subname' : [ 'CHARGING CAR-1', 'CHARGING CAR-2',
						'CHARGING CAR-3', 'CHARGING CAR-4', 'CHARGING CAR-5',
						'CHARGING CAR-6', 'CHARGING CAR-7', 'CHARGING CAR-8',
						'CHARGING CAR-9', 'CHARGING CAR-10' ]
			},
			{
				'name' : 'PUSHER CAR',
				'subname' : [ 'PUSHER CAR-1', 'PUSHER CAR-2', 'PUSHER CAR-3',
						'PUSHER CAR-4', 'PUSHER CAR-5', 'PUSHER CAR-6' ]
			},
			{
				'name' : 'DOOR EXTRACTOR',
				'subname' : [ 'DOOR EXTRACTOR-1', 'DOOR EXTRACTOR-2',
						'DOOR EXTRACTOR-3', 'DOOR EXTRACTOR-4',
						'DOOR EXTRACTOR-5', 'DOOR EXTRACTOR-6',
						'DOOR EXTRACTOR-7' ]
			},
			{
				'name' : 'CPP REMOTE LOCATIONS',
				'subname' : [ 'CPP REMOTE LOCATIONS' ]
			},
			{
				'name' : 'CPP PLC',
				'subname' : [ 'CPP PLC-3', 'CPP PLC-4' ]
			},
			{
				'name' : 'CSP PLC',
				'subname' : [ 'CSP PLC-1', 'CPP PLC-2' ]
			},
			{
				'name' : 'ESP CONTROLLER',
				'subname' : [ 'ESP CONTROLLER-1', 'ESP CONTROLLER-2',
						'ESP CONTROLLER-3', 'ESP CONTROLLER-4',
						'ESP CONTROLLER-5', 'ESP CONTROLLER-6',
						'ESP CONTROLLER-7' ]
			},
			{
				'name' : 'CENTRIFUGE DRUMS DRIVER',
				'subname' : [ 'CENTRIFUGE DRUMS DRIVER-1',
						'CENTRIFUGE DRUMS DRIVER-2',
						'CENTRIFUGE DRUMS DRIVER-3',
						'CENTRIFUGE DRUMS DRIVER-4',
						'CENTRIFUGE DRUMS DRIVER-5' ]
			}, {
				'name' : 'MBC',
				'subname' : [ 'MBC' ]
			}, {
				'name' : 'BENZOL DISTILLATION PHASE-2',
				'subname' : [ 'BENZOL DISTILLATION PHASE-2' ]
			}, {
				'name' : 'FINAL GAS COOLER PHASE-2',
				'subname' : [ 'FINAL GAS COOLER PHASE-2' ]
			}, {
				'name' : 'REVERSING WINCH PLC BAT 1&2',
				'subname' : [ 'REVERSING WINCH PLC BAT 1&2' ]
			}, {
				'name' : 'REVERSING WINCH PLC BAT 3&4',
				'subname' : [ 'REVERSING WINCH PLC BAT 3&4' ]
			}, {
				'name' : 'SKIP HOIST 1 OF BAT 1&2',
				'subname' : [ 'SKIP HOIST 1 OF BAT 1&2' ]
			}, {
				'name' : 'SKIP HOIST 1 OF BAT 3&4',
				'subname' : [ 'SKIP HOIST 1 OF BAT 3&4' ]
			}, {
				'name' : 'CHILLED WATER PLANT 2',
				'subname' : [ 'CHILLED WATER PLANT 2' ]
			} ];

	$(function() {

		//for (var idx in states) {
		//    var state = states[idx];
		//    $('#states').append(new Option(state.name));
		//}

		$.each(mainname, function(idx, state) {
			$('#mainname').append(new Option(state.name));
		});

		$("#mainname").change(function() {
			$("#subname").html("");

			if ($("#mainname").val() === '') {
				return;
			}

			$.each(mainname, function(idx, state) {
				if (state.name == $("#mainname").val()) {
					$.each(state.subname, function(i, city) {
						$("#subname").append(new Option(city));
					});
				}
			});

		});

	});
	
	function addLogBook(){
		$.get("logbookentry.jsp", { dateofentry: $("#dateofentry").val(),
			                        equipment: $("#mainname").val(),
			                        subequipment: $("#subname").val(),
			                        activity: $("#activity").val(),
			                        observations: $("#obs").val(),
			                        action: $("#action").val(),
			                        brkanyl: $("#brkanyl").val(),
			                        remarks: $("#remarks").val(),
			                        modifications: $("#modifications").val(),
			                        attendance: $("#attendance").val(),
			                        sign: $("#sign").val(),
			                        
			                        } , doUpdate);
		         	
	}
	function doUpdate(response){
		if(response){
			
			var resp = response;
			var resptrimmed = resp.trim();
			alert(resptrimmed);
			$("#dateofentry").val("Select A Date");
            $("#mainname").val("");
            $("#subname").val("");
            $("#activity").val(-1);
            $("#obs").val("");
            $("#action").val("");
            $("#brkanyl").val("");
            $("#remarks").val("");
            $("#modifications").val("");
            $("#attendance").val("");
            $("#sign").val("");
		}
	}
	var searchdates = new Array();
	
	function searchLogByDate(){
		$.get("searchandgenerateexcel.jsp", { fromdate: $("#fromdate").val(),
			                  todate: $("#todate").val(),
                                  } , doGetData);

    }
	
	function doGetData(response) {

		var datafromserver = response;
          		
          alert(datafromserver);
	}
	
	
	$(document).ready(
            function () {
                $("#dateofentry").datepicker(
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

   
  
  
  <div id="tabspace" class="tabspace">
  
   <table cellspacing =10px class="banner">
      <tr><td><button class="logbooknew" onclick="goToLogBook()">Log Book</button></td>
      <td><button class="searchnew" onclick="goToSearchSpace()">Search</button></td>
      <td><button class="profilenew">Profile</button></td>
      <td><button class="logbooknew" onclick="goToLogout()">Logout</button></td></tr>
      
   </table>
 
 </div>
 
   

 <form class="lgbk" action="logbookentry.jsp">
						<h2 align="center">LOG BOOK ENTRY</h2>
						<br>
				     	<br>
						
						<table>
							
							<tr>
								<td>Date :</td>
								<td><input type="text" id="dateofentry" name="dateofentry" class="drop1"
									 required="required" value="Select A Date"/></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td>Choose The Equipment :</td>

								<td><select id="mainname" class="drop" name="equipment"
									required="required">
										<option value="" selected>Select an Equipment</option>

								</select> <select class="drop3" id="subname" name="subequipment">
										<option value="-1">Select the SubType</option>
								</select></td>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td>Choose The Activity Type :</td>

								<td><select class="drop" name="activity" id="activity"
									required="required">
										<option value="-1" selected>Select an Activity</option>
										<option value="Testing">Testing</option>
										<option value="Modification">Modification</option>
										<option value="Checking">Checking</option>
										<option value="Inspection">Inspection</option>
										<option value="PPM">PPM</option>
										<option value="Breakdown">Breakdown</option>
										<option value="Commisioning">Commisioning</option>

								</select></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td>Observations :</td>
								<td><textarea spellcheck=false class="obs" id="obs"
										name="observations"></textarea></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td>Action Taken :</td>
								<td><textarea spellcheck=false class="obs" id="action"
										name="action"></textarea></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td>Breakdown Analysis :</td>
								<td><textarea spellcheck=false class="obs" id="brkanyl"
										name="brkanyl"></textarea></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td>Modifications :</td>
								<td><textarea spellcheck=false class="obs2" id="modifications"
										name="modifications"></textarea></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td>Remarks :</td>
								<td><textarea spellcheck=false class="obs2" id="remarks"
										name="remarks"></textarea></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td>Attendance :</td>
								<td><textarea spellcheck=false class="obs3" id="attendance"
										name="attendance" required="required"></textarea></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td>Signature :</td>
								<td><textarea spellcheck=false class="obs4" id="sign"
										name="sign" required="required"></textarea></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td></td>
								<td><input type="button" value="Update Log Book"
									class="logbookbutton" onclick="addLogBook()"/></td>
							</tr>
						</table>
					</form>
 
    


       <% AccesserEAL a = (AccesserEAL) session.getAttribute("empname"); 
       String name = a.getEmpid();
   %>
   <%= name %>
   
</body>
</html>