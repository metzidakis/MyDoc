<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
    
<%@ page import="classes.Member, classes.Comment, dao.CommentDAO, database.DB, java.sql.Connection, java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,results.FindDoctors, classes.Doctor, dao.DoctorDAO, java.util.*" %>  
    
    <%
 
 	String dID = request.getParameter("dID");
    String mID = ((Member) session.getAttribute("member")).getmID();

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
body  {
    background-image: url("images/Picture.jpg");
		background-size: cover;
    background-color: #white;
}
.bg-1 {
    background-color: #white; /* Green */
    color: #white;
}
.jumbotron {
	background-color: #ffffff;
    opacity: 1;
}
.caption-one {
			text-align: left;
			border-radius: 30px;
      background-color: black;
			color: white;
      opacity: .85;
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
.btn {
  background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
  background-image: -o-linear-gradient(top, #3498db, #2980b9);
  background-image: linear-gradient(to bottom, #3498db, #2980b9);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Courier New;
  color: #ffffff;
  font-size: 24px;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
}

.btn:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}

 

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
<div class="container">

      <!-- edit form column -->
<div class="container">
    <div class="caption-one";>
        <form class="form-horizontal" role="form" action="CommentController" method="post">
          <div class="form-group">
          <h1 style="text-align:center; font-family: Courier New; color: #ffffff; font-size: 34px;">Share your experience</h1>
           <br>
            <br>
            <label class="col-md-3 control-label" style="font-family: Courier New; color: #ffffff; font-size: 24px;">Comment:</label>
            <div class="col-md-8">
              <input class="form-control" value="" type="text"  name="comment_text" style="font-size:18pt; height: 200px;">
              <input type="hidden" name="dID" value="<%=dID%>">
              <input type="hidden" name="mID" value="<%=mID%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-sm-offset-2 col-md-7">
              <input class="btn btn-primary" value="Submit" type="submit">
              <span></span>
              <input class="btn btn-default" value="Reset" type="reset">
            </div>
          </div>
          <br><br>
        </form>
      </div>
      </div>
     </div>
<br><br><br>
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
              <button type="reset" class="btn btn btn-danger" data-dismiss="modal">Cancel</button>
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
