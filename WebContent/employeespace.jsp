<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,beanseal.*,database.*,java.sql.*" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="jquery.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<link href="ealstyles.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/personal19.png" type="png" />
<script src="jquery-ui/jquery-ui.js"></script>
<link href="jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css" />

 <!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.css">
  
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
  
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script>

  


<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/menu_topexpand.css" />

<title>Employee Space</title>

<script type="text/javascript">
	$(document).ready(

	function() {

		$("#tabs").tabs();
	});

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


	<%
		AccesserEAL a = (AccesserEAL) session.getAttribute("empname");
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		try {

			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement("select empname, empemail from EMPINFO where EMPID=?");
			//ps1 = con.prepareStatement("select * from studbukinfo where SID=?");
			ps.setString(1, a.getEmpid());
			//ps1.setString(1, a.getSid());

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
	%>

	<!--  *********************************  home content *************************************** -->
	<div class="container" id="hometab">
		<div class="menu-wrap">
			<nav class="menu" id="tabs">
				<div class="icon-list">
					<a href="#hometab"><i class="fa fa-fw fa-book"></i><span>Log
							Book</span></a> <a href="#notificationshow"><i
						class="fa fa-fw fa-bell-o"></i><span>Notifications</span></a> <a
						href="#history"><i class="fa fa-fw fa-search"></i><span>History</span></a>
					<a href="#"><i class="fa fa-fw fa-gear"></i><span><%=rs.getString(1)%> Profile</span></a>
					<a href="#logout"><i class="fa fa-fw fa-power-off"></i><span>Logout</span></a>
				</div>
			</nav>
		</div>
		<button class="menu-button" id="open-button"></button>


		<div class="content-wrap">
			<div class="content">


				<div class="eal-demos">
					<!--   <div class="name">Welcome <%-- rs.getString(1)--%> </div>
							<div class="picadjust"><img src="images/sanjeevipatnam.jpg" class="propic"/></div>
							
									
                      <div id="sectionchooser" class="sectionchooser">
                     <div class="sectionchoosercontent"> 
                        <h3 class="sectionchoosercontentheader">Choose your Section : </h3>
                     </div>
                      </div>
							
							-->
					<table class="tname">
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><img src="images/sanjeevipatnam2.jpg" class="propic" /></td>
						</tr>
					</table>


					<br>
					<br>
					<br>

					<form class="fillarea" action="logbookentry.jsp">
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



				</div>


			</div>
		</div>
		<!-- /content-wrap -->
	</div>

	<!--  *********************************END of home content *************************************** -->


	<!--  *********************************  Notification Content *************************************** -->

	<div class="container" id="notificationshow">
		<div class="menu-wrap">
			<nav class="menu" id="tabs">
				<div class="icon-list">
					<a href="#hometab"><i class="fa fa-fw fa-book"></i><span>Log
							Book</span></a> <a href="#notificationshow" class="iconselect"><i
						class="fa fa-fw fa-bell-o"></i><span>Notifications</span></a> <a
						href="#history"><i class="fa fa-fw fa-search"></i><span>History</span></a>
					<a href="#"><i class="fa fa-fw fa-gear"></i><span>Settings</span></a>
					<a href="#logout"><i class="fa fa-fw fa-power-off"></i><span>Logout</span></a>
				</div>
			</nav>
		</div>
		<button class="menu-button" id="open-button">MENU</button>


		<div class="content-wrap">
			<div class="content">
				<header class="eal-header">

					<div class="eal-demos">
						<h3>Welcome to Notifcation space</h3>
						<h2>
							Dear
							<%=rs.getString(1)%>
						</h2>
						<h3>there aren't any notifications for you yet!!</h3>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br> <br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br> <br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
					</div>

				</header>
			</div>
		</div>
		<!-- /content-wrap -->
	</div>
	<!-- /container -->
	<!--  *********************************  Notification Content *************************************** -->

<!--  *********************************  History Search Content*************************************** -->

	<div class="container" id="history">
		<div class="menu-wrap">
			<nav class="menu" id="tabs">
				<div class="icon-list">
					<a href="#hometab"><i class="fa fa-fw fa-book"></i><span>Log
							Book</span></a> <a href="#notificationshow" class="iconselect"><i
						class="fa fa-fw fa-bell-o"></i><span>Notifications</span></a> <a
						href="#history"><i class="fa fa-fw fa-search"></i><span>History</span></a>
					<a href="#"><i class="fa fa-fw fa-gear"></i><span>Settings</span></a>
					<a href="#logout"><i class="fa fa-fw fa-power-off"></i><span>Logout</span></a>
				</div>
			</nav>
		</div>
		<button class="menu-button" id="open-button">MENU</button>


		<div class="content-wrap">
			<div class="content">
						<div class="eal-demos">
						<table class="tname">
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><img src="images/sanjeevipatnam2.jpg" class="propic" /></td>
						</tr>
					</table>
						
					<div class="searchbydate">		
						<h3>Search Using DATE :</h3>
						
						<div>
						
						<form action="">
					   	
					   <!-- From : <input type="date" id="fromdate" name="fromdate" class="drop1"
									 required="required" /> -->
						From : <input type="text" id="fromdate" name="fromdate" class="drop1" />			 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						To : <input type="text" id="todate" name="todate" class="drop1"
									 required="required" />			
						
						&nbsp;&nbsp;&nbsp;
						<input type="button" value="Search Now"
									class="logbookbutton" onclick="searchLogByDate()"/>
						
						</form>
						</div>
						</div>
						
						
						
						
			
						
					</div>

			</div>
		</div>
		<!-- /content-wrap -->
	</div>
	 <script type="text/javascript">
        $(document).ready( function () {
            $('#table_id').DataTable();
        } );</script>
        
         
    <table id="table_id" class="display">
    <thead>
        <tr>
            <th>Column 1</th>
            <th>Column 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
        </tr>
        <tr>
            <td>Row 2 Data 1</td>
            <td>Row 2 Data 2</td>
        </tr>
    </tbody>
</table>
	<!-- /container -->
	<!--  *********************************  History Serach Content *************************************** -->





	<!--  *********************************  Logout Content *************************************** -->

	<div class="container" id="logout">
		<div class="menu-wrap">
			<nav class="menu" id="tabs">
				<div class="icon-list">
					<a href="#hometab" id="logout"><i class="fa fa-fw fa-book"></i><span>Log
							Book</span></a> <a href="#notificationshow" class="iconselect"><i
						class="fa fa-fw fa-bell-o"></i><span>Notifications</span></a> <a
						href="#"><i class="fa fa-fw fa-search"></i><span>History</span></a>
					<a href="#"><i class="fa fa-fw fa-gear"></i><span>Settings</span></a>
					<a href="#logout"><i class="fa fa-fw fa-power-off"></i><span>Logout</span></a>
				</div>
			</nav>
		</div>
		<button class="menu-button" id="open-button">MENU</button>


		<div class="content-wrap">
			<div class="content">
				<header class="eal-header">

					<div class="eal-demos">

						<div class="logoutconf" id="logoutconf">
							<form action="logout.jsp" method="post" class="logoutconfspace">
								<h4>
									Dear
									<%=rs.getString(1)%>
									, make sure that you have SAVED your changes before logging
									out!
								</h4>

								<!--  <input type="button" id="cancelinlogout" value="Cancel" class="logoutbtn"/>-->

								<input type="submit" value="Logout" class="logoutbtn" />

							</form>
						</div>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br> <br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br> <br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
					</div>

				</header>
			</div>
		</div>
		<!-- /content-wrap -->
	</div>
	<!-- /container -->
	<!--  *********************************  Logout Content *************************************** -->



	<script src="js/classie.js"></script>
	<script src="js/main.js"></script>



	<%
		}
		} catch (Exception ex) {
			System.out.println("Error is " + ex.getMessage());
		}
	%>

</body>
</html>