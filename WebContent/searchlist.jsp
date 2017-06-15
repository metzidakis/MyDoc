<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="results.FindDoctors, classes.Doctor, dao.DoctorDAO, java.util.*, java.sql.Connection, java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException, java.util.ArrayList, database.DB, classes.Doctor, classes.Member" %>  
  
		<%
			ArrayList<Doctor> results = (ArrayList<Doctor>)request.getAttribute("doctors-results");
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
      background-image: url("images/2.jpg");
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
    			text-align: left;
    			border-radius: 30px;
          background-color: black;
    			color: white;
          opacity: 0.9;
          /*padding-left: 0%;*/
          margin-right: 1%;
    			margin-left: 1%;
    			padding-top: 1%;
          padding-bottom: 1%;
    			padding-left: 1%;
          padding-right: 1%;
          /*width: 40%;*/
    }
    .caption-two {
    			text-align: left;
    			border-radius: 30px;
          background-color: black;
    			color: white;
          opacity: 0.6;
          margin-right: 1%;
    			margin-left: 1%;
    			padding-top: 1%;
          padding-bottom: 1%;
    			padding-left: 5%;
          padding-right: 50%;
          /*width: 40%;*/
    }
    .lichanger {
        background-color:black;
        color: white;
        opacity: 0.6
    }

    .rating-block{
    	background-color:black;
      color: white;
      opacity: 0.6
    	border:1px solid #EFEFEF;
    	padding:15px 15px 20px 15px;
    	border-radius:3px;
    }
    .review-block{
    	background-color:#FAFAFA;
    	border:1px solid #EFEFEF;
    	padding:15px;
    	border-radius:3px;
    	margin-bottom:15px;
    }
    .review-block-name{
    	font-size:12px;
    	margin:10px 0;
    }
    .review-block-date{
    	font-size:12px;
    }
    .review-block-rate{
    	font-size:13px;
    	margin-bottom:15px;
    }
    .review-block-title{
    	font-size:15px;
    	font-weight:700;
    	margin-bottom:10px;
    }
    .review-block-description{
    	font-size:13px;
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

  <div class="doctor_table">
      	 <form class="form-inline" action="FindDoctorProfile" method="post">
    
    <%
    
    if (results.size() == 0) {%>
    <div class='jumbotron'><h1> No results found in our Database</h1></div>
    	
   <% }%>
    
   <%  for (Doctor doc : results) {%>
    
    	<div class='caption-one'>
    	<div class='caption-one' style='text-align:left'>
    	<div class='row'>
    	 <div class='col-md-3'>
    	<h3><%=doc.getdSurname() %>  <%=doc.getdName()%></h3>
  		  <br>
    	<a href='/users' class='pull-right'><img title='profile image' class='img-thumbnail'  src='images/3.jpg' ></a>
    	
    	<br>
    	</div>
    	<div class='col-md-3'>
    	<br>
    	<br>
    	<br>
    	<br>
    	<ul class='list-group'>
    	<li class='list-group-item text-muted lichanger text-center' contenteditable='false'>Profile</li>
    	<li class='list-group-item text-right lichanger'><span class='pull-left'><strong class=''>E-mail:</strong></span><%=doc.getdEmail()%></li>
    	<li class='list-group-item text-right lichanger'><span class='pull-left'><strong class=''>Gender:</strong></span><%=doc.getdGender()%></li>
                   <li class='list-group-item text-right lichanger'><span class='pull-left'><strong class=''>Address: </strong></span><%=doc.getdAddress()%></li>
                   <li class='list-group-item text-right lichanger'><span class='pull-left'><strong class=''>Specialization:</strong></span><%=doc.getdSpecialty()%></li>
    	</ul>
    	</div>
    	<div class='col-md-3 center'>
    	<br>
    	<br>
    	<br>
    	<br>
    	<ul class='list-group '>
    	<li class='list-group-item text-muted lichanger text-center'>Activity <i class='fa fa-dashboard fa-1x'></i> </li>
    	<li class='list-group-item text-right lichanger'><span class='pull-left'><strong class=''>Comment by</strong></span> 48</li>
    	<li class='list-group-item text-right lichanger'><span class='pull-left'><strong class=''>Rated by</strong></span> 77</li>
    	<li class='list-group-item text-right lichanger'><span class='pull-left'><strong class=''>Replies</strong></span> 56</li>
    	<li class='list-group-item text-right lichanger'><span class='pull-left'><strong class=''>Status</strong></span> <b>Online</b></li>
    	 </ul>
    	 </div>
    	<div class='col-md-3'>
    	<br>
    	<br>
    	<br>
    	<div class='rating-block'>
    	<h4>Average user rating</h4>
    	<h2 class='bold padding-bottom-7'>5 <small>/ 5</small></h2>
    	<button type='button' class='btn btn-warning btn-sm' aria-label='Left Align'>
    	<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
    	</button>
    	<button type='button' class='btn btn-warning btn-sm' aria-label='Left Align'>
    	<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
    	</button>
    	<button type='button' class='btn btn-warning btn-sm' aria-label='Left Align'>
    	 <span class='glyphicon glyphicon-star' aria-hidden='true'></span>
    	</button>
    	<button type='button' class='btn btn-warning btn-sm' aria-label='Left Align'>
    	 <span class='glyphicon glyphicon-star' aria-hidden='true'></span>
    	</button>
    	<button type='button' class='btn btn-warning btn-sm' aria-label='Left Align'>
    	<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
    	</button>
    	 <br>
    	 <br>
    	<br>
    	<a href='doctorprofile2.jsp?id=<%=doc.getdID() %>' class='btn btn-info btn-lg' style='color:black; width: 180px; height: 50px;'>Full Profile</a>
    	</div>
			 </div>
			</div>   	
 	   </div>
    </div>
     <br><br>
    	  </form>
    	
    	
    <%  } %>

  
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
