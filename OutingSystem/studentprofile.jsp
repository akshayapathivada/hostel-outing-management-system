<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Student Profile</title>

    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>

    
    <link rel="stylesheet" href="demo.css" />
    
	    <link rel="stylesheet" href="style.css">
</head>
<body>
	<%
    String redg=(String)session.getAttribute("redg");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false","root","Gaya@123$");
Statement stm=con.createStatement();
ResultSet rs = stm.executeQuery("select * from students where redg='" + redg + "'");
while(rs.next()){
%>	
<div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-right">
        </div>
    </div>
</div>
<div style="text-align: right;margin-right: 50px;">
  <button onclick="location.href='home.html'" style="background-color: crimson; color: white; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">LOGOUT</button>
</div>
<header class="ScriptHeader">
    <div class="rt-container">
    	<div class="col-rt-12">
        	<div class="rt-heading">
            	<h1 style="color:crimson">Student Profile</h1>
            </div>
        </div>
    </div>
</header>

<section>
    <div class="rt-container">
          <div class="col-rt-12">
              <div class="Scriptcontent">
              
<div class="student-profile py-4">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent text-center">
            <img class="profile_img" src="avatar.jpg" alt="student dp">
            <h3>Hello <%=rs.getString("name")%></h3>
          </div>
          <div class="card-body">
            <p class="mb-0"><strong class="pr-1">Student ID:</strong><%=rs.getString("redg")%></p>
            <p class="mb-0"><strong class="pr-1">Course:</strong>B.Tech</p>
            <p class="mb-0"><strong class="pr-1">Branch:</strong><%=rs.getString("branch")%></p>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          <div class="card-body pt-0">
            <table class="table table-bordered">
              <tr>
                <th width="30%">Name</th>
                <td width="2%">:</td>
                <td><%=rs.getString("name")%></td>
              </tr>
              <tr>
                <th width="30%">Academic Year</th>
                <td width="2%">:</td>
                <td><%=rs.getString("ayear")%></td>
              </tr>
              <tr>
                <th width="30%">Year</th>
                <td width="2%">:</td>
                <td><%=rs.getString("year")%></td>
              </tr>
              <tr>
                <th width="30%">Contact</th>
                <td width="2%">:</td>
                <td><%=rs.getString("phone")%></td>
              </tr>
              <tr>
                <th width="30%">Location</th>
                <td width="2%">:</td>
                <td><%=rs.getString("location")%></td>
              </tr>
            </table>
          </div>
        </div>
        <br>
        <br>
        <div>
          <center><button><a href="outingform.html"><b>Apply for Outing</b></a></button></center>
        </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- partial -->
           
    		</div>
		</div>
    </div>
</section>
     
<center><font size="18px">
<%
Statement stm1=con.createStatement();
ResultSet rs1 = stm1.executeQuery("select * from outings where redg='" + redg + "'");
if(rs1.next()){
  String k=rs1.getString("approval");
  String m=rs1.getString("wapproval");
  if(k.equals("yes") && m.equals("review")){
    out.println("Your application was accepted by HOD");
  }
  else if(k.equals("no")){
    out.println("Your application was rejected by HOD");
  }
  else if(k.equals("yes") && m.equals("yes")){
    out.println("Your Outing Application was Accepted by HOD and Warden");
  }
  else if(k.equals("yes") && m.equals("no")){
    out.println("Your Outing Application was rejected by Warden");
  }
  else if(k.equals("yes") && m.equals("review")){
    out.println("Sorry! Your Outing Application was Rejected by HOD");
  }
  else{
    out.println("Your Outing Application was under Review");
  }
}
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</font></center>
    <!-- Analytics -->

	</body>
</html>