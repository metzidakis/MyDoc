<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="classes.Member, classes.Comment, dao.CommentDAO, database.DB, java.sql.Connection, java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,results.FindDoctors, classes.Doctor, dao.DoctorDAO, java.util.*" %>  
 
 <%
 
 	String id = request.getParameter("id");
 	Connection con = null;
	DB dB = new DB();
	
	PreparedStatement stmt = null; 
	PreparedStatement stmt1 = null; 

	String sqlquery = "select * from doctor_table where doctor_id=?;";
	String sqlquery1 = "SELECT * FROM comment_table inner JOIN member_table ON member_table.member_id = comment_table.member_id where doctor_id = ?;";
	
	ArrayList<Comment> comments = new ArrayList<>();
	ArrayList<Member> members = new ArrayList<>();
	Doctor doc = null;
	
	try { 
		dB.open();
		con = dB.getConnection();
			
		stmt = con.prepareStatement(sqlquery);
		stmt1 = con.prepareStatement(sqlquery1);
		
		stmt.setString(1,id); 
		stmt1.setString(1,id);
		
		ResultSet rs = stmt.executeQuery();
		ResultSet rs1 = stmt1.executeQuery();
			
		if (rs.next()) {
			doc = new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth"));
		}
		
		while (rs1.next()) {
			 comments.add( new Comment( rs1.getString("comment_id"), rs1.getString("comment_rating"), rs1.getString("comment_date"), rs1.getString("doctor_id"), rs1.getString("member_id"), rs1.getString("comment_text")));
			 members.add( new Member (rs1.getString("member_id"), rs1.getString("member_username"), rs1.getString("mpassword"), rs1.getString("member_email"), rs1.getString("member_name"), rs1.getString("member_surname"), rs1.getString("member_phone"), rs1.getString("member_gender"), rs1.getString("member_region"), rs1.getString("member_join"), rs1.getString("member_yearofbirth")));
		}
			
		stmt.close();
		stmt1.close();

		dB.close();
			
		} catch (Exception e) {
				
			throw new Exception("An error occured while searching in Database: " + e.getMessage());
				
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
    opacity: .4;
}
.caption-one {
			text-align: left;
			border-radius: 30px;
      background-color: black;
			color: white;
      opacity: 0.85;
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
    background-color:#646464;
    color: #ff7225;
}

.rating-block{
	background-color:#646464;
  color: #ff7225;
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
<h1 style="text-align:left">Doctor Profile</h1>
</div>
<br>
<br>
<br>
<div class="container">
    <div class="caption-one";style="text-align:left">
  <div class="row">
        <div class="col-md-2">
  <h3><%= doc.getdUsername() %></h3>
          <br>
          <a href="/users" class="pull-right"><img title="profile image" class="img-thumbnail"  src="images/FalloutPipBoy.jpg"></a>
          <a href="#" class="btn btn-primary btn-success"><span class="glyphicon glyphicon-thumbs-up"></span> This person is trusted</a>
          <a href="#" class="btn btn-primary btn-danger"><span class="glyphicon glyphicon-thumbs-down"></span> This person is not trusted</a>
        </div>
       <div class="col-md-3">
        <br>
         <br>
         <br>
         <br>
         <ul class="list-group">
             <li class="list-group-item text-muted lichanger text-center" contenteditable="false">Profile</li>
             <li class="list-group-item text-right lichanger"><span class="pull-left"><strong class="">Joined</strong></span><%= doc.getdJoin() %></li>
             <li class="list-group-item text-right lichanger"><span class="pull-left"><strong class="">Real name</strong></span><%= doc.getdSurname() %><%= doc.getdName() %></li>
             <li class="list-group-item text-right lichanger"><span class="pull-left"><strong class="">Gender</strong></span><%= doc.getdGender() %></li>
             <li class="list-group-item text-right lichanger"><span class="pull-left"><strong class="">Region: </strong></span> <%= doc.getdRegion() %></li>
             </ul>
       </div>
       <div class="col-md-3 center">
          <br>
          <br>
          <br>
          <br>
       <ul class="list-group ">
          <li class="list-group-item text-muted lichanger text-center">Activity <i class="fa fa-dashboard fa-1x"></i> </li>
          <li class="list-group-item text-right lichanger"><span class="pull-left"><strong class="">Comments</strong></span> <%= comments.size() %></li>
          <li class="list-group-item text-right lichanger"><span class="pull-left"><strong class="">Ratings</strong></span> 47</li>
          <li class="list-group-item text-right lichanger"><span class="pull-left"><strong class="">Trusted by</strong></span> 56</li>
          <li class="list-group-item text-right lichanger"><span class="pull-left"><strong class="">Negative votes</strong></span> 2</li>
      </ul>
      </div>
      <div class="col-md-4">
          <br>
         <br>
         <br>
         <br>
				<div class="rating-block">
					<h4>Average user rating</h4>
					<h2 class="bold padding-bottom-7">4.3 <small>/ 5</</small></h2>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
          <button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
					  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
				</div>
			</div>
    </div>
  </div>
  </div>
<div class="container ">

  <div class="row ">
  			<div class="col-md-12 ">
              <h2 class="caption-one"; style="text-align:center">Comments History<h2>
  				<div class="caption-one";>
  			<% for (int i = 0; i < comments.size(); i++){ %>		
  					<div class="row">
  						<div class="col-md-2" "insert">
  							<img src="images/Picture.jpg" class="img-thumbnail" width="70%" height="40%">
  							<div class="review-block-name"><a href="#"><%= members.get(i).getmSurname() %> <%= members.get(i).getmName() %></a></div>
  							<div class="review-block-date"><%=comments.get(i).getcDate()%></div>
  						</div>
  						<div class="col-md-10">
  							<div class="review-block-rate">
  								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
  								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
  								</button>
  								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
  								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
  								</button>
  								<button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
  								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
  								</button>
  								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
  								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
  								</button>
  								<button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
  								  <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
  								</button>
  							</div>
  							<div class="review-block-description"><%=comments.get(i).getcText()%></div>
  						</div>
  					</div>
  					<hr/>
  			<% } %>		
      </div>
    </div>

</div>
<center>
<a href="#" class="btn btn-lg btn-info"><span class="glyphicon glyphicon-share-alt"></span> SHOW MORE PERSON'S COMMENTS</a>
</center>
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
