<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ page import="java.sql.Connection, java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException, java.util.ArrayList, database.DB, classes.Doctor, classes.Member" %>  
    
    <%
    
    if( session.getAttribute("loggedinas") == null) {
    	session.setAttribute("loggedinas","user");
    }

    Connection con = null;
	DB dB = new DB();
	
	ArrayList<String> doctorSpecialties = new ArrayList<String>();
	ArrayList<String> doctorRegions = new ArrayList<String>();
	
	PreparedStatement stmt1 = null; 
	PreparedStatement stmt2 = null; 

	String sqlquery1 = "select distinct doctor_specialty from doctor_table;";
	String sqlquery2 = "select distinct doctor_region from doctor_table;";
	
	try { 
		dB.open();
		con = dB.getConnection();
		
		stmt1 = con.prepareStatement(sqlquery1);
		stmt2 = con.prepareStatement(sqlquery2);
		
		ResultSet rs1 = stmt1.executeQuery();
		ResultSet rs2 = stmt2.executeQuery();
		
		while (rs1.next()) {
			doctorSpecialties.add(rs1.getString("doctor_specialty"));
		}
		
		while (rs2.next()) {
			doctorRegions.add(rs2.getString("doctor_region"));
		}
		
		stmt1.close();
		stmt2.close();
		dB.close();
		
		} catch (Exception e) {
			
			throw new Exception("An error occured while searching in Database for region or specialty: " + e.getMessage());
			
		} finally {
			
			try {
				dB.close();
			} catch (Exception e) {
				
			} 
		}

    %>

<!DOCTYPE html>
<html lang="en">
<!-- <img src="Picture.jpg" alt="Picture" width="100%" height="100%"> -->

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- The above 3 meta tags *must* come first in the head; any other head content
must come *after* these tags -->

  <title>MyDoc - Find The best Doctor</title>
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/mystyle.css">
  <style>
    body {
      background-image: url("images/Picture.jpg");
      background-size: cover;
      background-color: #white;
    }

    .bg-1 {
      background-color: #white;
      /* Green */
      color: #white;
    }

    .jumbotron {
      background-color: #ffffff;
      opacity: .4;
    }

    .caption-one {
      text-align: center;
      border-radius: 30px;
      background-color: black;
      color: white;
      opacity: 0.6;
      margin-right: 20%;
      margin-left: 20%;
      padding-top: 1%;
      padding-bottom: 3%;
      padding-left: 1%;
      padding-right: 1%;
    }
    
    .myButton {
	    background-color:transparent;
	    -moz-border-radius:28px;
	    -webkit-border-radius:28px;
	    border-radius:28px;
	    border:1px solid #0c3810 ;
	    display:inline-block;
	    cursor:pointer;
	    color:#c1c423 ;
	    font-family:Arial;
	    font-size:17px;
	    padding:16px 31px;
	    text-decoration:none;
	    text-shadow:0px 1px 0px #acbf2e ;
	}
	.myButton:hover {
	    background-color:transparent;
	}
	.myButton:active {
	    position:relative;
	    top:1px;
	}
	    /*.form-inline {
	      text-align: center;
	      border-radius: 30px;
	      color: white;

    }*/
  </style>
</head>

<body>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>

        <a class="navbar-brand" href="mydocmain.jsp" style="background-color:black;" color="white">MyDoc</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">

           <li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("aboutus.jsp") ? "active":"") %>"><a href="aboutus.jsp">About Us</a></li>
          <li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("howitworks.jsp") ? "active":"") %>"><a href="howitworks.jsp">How it Works</a></li>
          <li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("contactus.jsp") ? "active":"") %>"><a href="contactus.jsp">Contact Us</a></li>
        </ul>
        
     <%   if ( ((String)session.getAttribute("loggedinas")).equals("doctor") ) { %>
	   <ul class="nav navbar-nav navbar-right">
            <li class="inactive">
                <a href='doctorprofile.jsp?id=<%=((Doctor) session.getAttribute("doctor")).getdID() %>' class='myButton'>Profile</a>
               </li>
               <li class="inactive">
                 <a href='logout' class='myButton'>Logout</a>
             </li>
         </ul>
     <%   } else if ( ((String)session.getAttribute("loggedinas")).equals("member") ) { %>
        <ul class="nav navbar-nav navbar-right">
            <li class="inactive">
                <a href='memberprofile.jsp?id=<%=((Member) session.getAttribute("member")).getmID() %>' class='myButton'>Profile</a>
               </li>
               <li class="inactive">
                 <a href='logout' class='myButton'>Logout</a>
               </li>
            </ul>
     <%   } else { %>
	  	<ul class="nav navbar-nav navbar-right">
          <li class="inactive"><a href="" id="Sign Up" data-toggle="modal" data-target="#myModal2"><span class="glyphicon glyphicon-user"></span>&nbsp;Sign Up</a></li>
          <li class="inactive"><a href="" id="login" data-toggle="modal" data-target="#myModal1"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Login</a></li>
        </ul>
	 <%   } %>      
      </div>
      <!--/.nav-collapse -->
    </div>
  </nav>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <div class="caption-one">
    <h1>Doctor Search</h1>
    <strong>Search your local doctor in 3 simple steps</strong>
    <br><br>
    <form class="form-inline" action="searchdoctors" method="get">
      <!-- <div class="form-group" action="SearchList.html" method="get"> -->
      <div class="form-group">
        <!-- <label for="keyword">Keyword:</label> -->
        <input class="form-control" id="keyword" type="text" placeholder="1. Please Input Keyword" name="keyword" style="width: 210px;">
      </div>
      
      <!-- <label for="specialty">Specialty:</label> -->
      <select class="form-control" id="specialty" name="specialty" style="width: 210px;" required>
		<option value="" disabled selected>2. Please Select Specialty</option>
		<option>Any</option>
		<% for (int i = 0; i < doctorSpecialties.size(); i++) {
			out.println("<option>"+ doctorSpecialties.get(i) +"</option>");
			}%>
	  </select>
	  
	  
      <!-- <label for="location">Location:</label> -->
      <select class="form-control" id="location" name="location" placeholder="Please Input Keyword" style="width: 210px;" required>
		<option value="" disabled selected>3. Please Select Location</option>
		<option>Any</option>
		<% for (int i = 0; i < doctorSpecialties.size(); i++) {
					out.println("<option>"+ doctorRegions.get(i) +"</option>");
					}%>
	  </select>
      <br><br>
      <button type="submit" class="btn btn-default" style="width: 170px; color:black"> Search</button>
      <input type="reset" class="btn btn-default" style="width: 170px; color:black">
      <!-- <button type="button" onclick="alert('Hello World!')">Click Me!</button> -->
    </form>
  </div>


  <footer>
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <br>
          <p class="text-center">&copy; Copyright 2017 MyDoc</p>
        </div>
      </div>
    </div>
  </footer>
  
  <!-- Login-pop up - Modal content -->
  <div class="container">
    <div class="modal fade" id="myModal1" role="dialog">
      <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4><span class="glyphicon glyphicon-lock"></span> Login :</h4>
                </div>
                <br>
                <div class="container">
                  <form class="form-horizontal" method="post" action="LoginController">
                    <div class="col-sm-offset-1 col-sm-10">
                      <div class="input-group col-sm-5">
                       <label for="inputusername" class="sr-only">username</label>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="text" name="username" id="inputusername" class="form-control" placeholder="username" required>
                      </div>
                      <div class="input-group col-sm-5">
                                    <label for="inputpassword" class="sr-only">Password</label>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input name="password" type="password" id="inputpassword" class="form-control" placeholder="password" required>
                      </div>
                        <div class="input-group col-sm-5">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                        <select class="form-control" id="registrationtype" name="loginType" style="width: 250px;">
                          <option value="" disabled selected>Type of Login</option>
                          <option>Member</option>
                          <option>Doctor</option>
                        </select>
                      </div>
                    <br>
          <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
              <button type="submit" class="btn btn btn-success">Sign in</button>
              <button type="clear" class="btn btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                      </div>
          </div>
                </form>
        </div>
                </div>
            </div>
        </div>
    </div>

    <!-- end of Login-pop up - Modal content -->

	<!-- SignUp-pop up - Modal content -->
	
    <div class="container">
        <div class="modal fade" id="myModal2" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4><span class="glyphicon glyphicon-lock"></span> Sign up</h4>
                </div>
                <br>
                <div class="container">
                  <form class="form-horizontal" method="post" action="SignUp">
                    <div class="col-sm-offset-1 col-sm-10">
                      <div class="form-group">
                        <select class="form-control" id="registrationtype" name="registrationtype" style="width: 250px;">
                          <option value="" disabled selected>Type of Registration</option>
                          <option>Member</option>
                          <option>Doctor</option>
                        </select>
                      </div>
                    </div>
          <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
              <button type="submit" class="btn btn btn-success">Sign up</button>
              <button type="clear" class="btn btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </form>
                </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- end of SignUp-pop up - Modal content -->

<!-- End footer -->

<!-- JavaScript files -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>    
