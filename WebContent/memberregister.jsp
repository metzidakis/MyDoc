<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.Connection, java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException, java.util.ArrayList, database.DB, classes.Doctor, classes.Member" %>  
    
    ﻿<!DOCTYPE html>
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
<div class="caption-two";style="text-align:left">
<h1 style="text-align:left">Sign up As Member</h1>
</div>
<br>
<br>
<br>
<div class="container">


      <div class="caption-one";style="text-align:left">
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="images/FalloutPipBoy.jpg" class="avatar img-circle" alt="avatar">
          <h6>Upload a different photo...</h6>
          <input style="background-color:#0080ff" class="form-control" name="picture" type="file">
        </div>
      </div>

      <!-- edit form column -->

      <div class="col-md-9 personal-info">
        <h3>Personal info</h3>

        <form class="form-horizontal" role="form" action="MemberSignUp" method="post"> 
          <div class="form-group">
            <label class="col-md-3 control-label">First name:</label>
            <div class="col-md-8">
              <input class="form-control" value="" type="text"  name="member_name">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Last name:</label>
            <div class="col-md-8">
              <input class="form-control" value="" type="text" name="member_surname">
            </div>
          </div>

          <div class="form-group">
            <label class="col-md-3 control-label">Region:</label>
            <div class="col-md-8">
              <input class="form-control" value="" type="text" name="member_region">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Phone Number:</label>
            <div class="col-md-8">
              <input class="form-control" value="" type="text" name="member_phone">
            </div>
          </div>
            <div class="form-group">
              <label class="col-md-3 control-label">Email:</label>
              <div class="col-md-8">
                <input class="form-control" value="" type="email" name="member_email">
              </div>
            </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Gender:</label>
            <div class="col-md-8">
              <label class="radio-inline" for="Gender-0">
                <input type="radio" name="member_gender" id="Gender-0" value="Male" checked="checked">Male
              </label>
              <label class="radio-inline" for="Gender-1">
                <input type="radio" name="member_gender" id="Gender-1" value="Female">Female
              </label>
              <label class="radio-inline" for="Gender-2">
                <input type="radio" name="member_gender" id="Gender-2" value="Other"> Other
              </label>
            </div>
            </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
              <input class="form-control" value="" type="text" name="member_username" >
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" value="" type="password" name="mpassword">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Date of Birth:</label>
              <div class="row col-sm-offset-1 col-md-6">
            <select class="form-control col-md-2" id="location" name="member_year" placeholder="Year" style="width: 90px;">
              <option value="" disabled selected>Year</option>
           	<option value="1990">1990</option>
              <option value="1989">1989</option>
              <option value="1988">1988</option>
              <option value="1987">1987</option>
              <option value="1986">1986</option>
              <option value="1985">1985</option>
              <option value="1984">1984</option>
              <option value="1983">1983</option>
              <option value="1982">1982</option>
              <option value="1981">1981</option>
              <option value="1980">1980</option>
            </select>
            <select class="form-control col-md-2" id="location" name="member_month" placeholder="Month" style="width: 90px;">
              <option value="" disabled selected>Month</option>
              <option value="01">1</option>
             	<option value="02">2</option>
               <option value="03">3</option>
               <option value="04">4</option>
              <option value="05">5</option>
               <option value="06">6</option>
               <option value="07">7</option>
               <option value="08">8</option>
               <option value="09">9</option>
             <option value="10">10</option>
             <option value="11">11</option>
             <option value="12">12</option>
            </select>
            <select class="form-control col-md-2" id="location" name="member_day" placeholder="Day" style="width: 90px;">
              <option value="" disabled selected>Day</option>
              <option value="01">1</option><option value="02">2</option>  <option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option>
               <option value="07">7</option><option value="08">8</option><option value="09">9</option><option>10</option><option>11</option><option>12</option>
              <option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
              <option>19</option><option>20</option><option>21</option><option>22</option>  <option>23</option><option>24</option>
              <option>25</option><option>26</option> <option>27</option> <option>28</option> <option>29</option> <option>30</option> <option>31</option>
            </select>
          </div>

          </div>

          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-sm-offset-2 col-md-7">
              <input class="btn btn-primary" value="Submit" type="submit">
              <span></span>
              <input class="btn btn-default" value="Cancel" type="reset">
            </div>
          </div>
        </form>
      </div>
  </div>
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
    

    
    