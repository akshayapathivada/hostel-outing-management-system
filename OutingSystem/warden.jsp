<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
    String rollNumber = request.getParameter("box");
    String statusMessage = "";

    if (rollNumber != null && !rollNumber.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root", "Gaya@123$");
            Statement stm = con.createStatement();

            ResultSet rs = stm.executeQuery("SELECT status FROM outings WHERE redg='" + rollNumber + "' and status='OUT'");
            if (rs.next()) {
                String status = rs.getString("status");
                if (status.equalsIgnoreCase("IN")) {
                    statusMessage = "Student is Inside the College.";
                } else if (status.equalsIgnoreCase("OUT")) {
                    statusMessage = "Student is Outside the College.";
                }
            } else {
                ResultSet rs1 = stm.executeQuery("SELECT * FROM students WHERE redg='" + rollNumber + "'");
                if(rs1.next()){
                statusMessage = "Student is Inside the College";
                }
                else{
                    statusMessage="Invalid Student Roll Number";
                }
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<html lang="en">
    <head>
        <title>Warden Page
        </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="searchstyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    *{
        margin:0;
        padding: 0;
    }
    body{
        background-color: #fdf5d5;
    }
    h1{
        margin-top: 20px;
        color: rgba(155, 87, 4, 0.995);
        margin-bottom: 8px;
        font-family: sans-serif;
    }
    
    .side{
        margin-top: 60px;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-content: space-between;
        margin-left: 450px;
        width:590px;
        background-color: #ffcb00;
        height: 50px;
        border:2px solid black;
        border-radius: 10px;
        border: none;
    }
    #c1{
        padding-top: 13px;
        font-size: 20px;
        font-weight: bolder;
       
        color:rgb(155, 87, 4);
    
    }
    button{
        margin-top: 7px;
        padding: 7px;
        font-weight: bolder;
        width:60px;
        border-radius: 10px;
        cursor:hover;
        background-color: rgb(95, 225, 95);
        border: none;
        font-family: 'Courier New', Courier, monospace;
        font-size: 15px;
    }
    button:hover{
        background: rgb(179, 237, 179);
        color:rgb(4, 118, 4);
    }
</style>
</head>
<body>
    <div style="text-align: right;margin-right: 50px">
        <button onclick="location.href='home.html'" style="background-color: crimson; color: white; padding: 10px 70px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">LOGOUT</button>&nbsp;&nbsp;&nbsp;
      </div>
    <div class="container">
        <form>
            <center><input class="search" type="text" name="box" placeholder="Roll number of student">
    <input type="submit" value="view" style="border-radius:5px;background-color:rgb(64, 241, 64);width:50px;height:35px"></center>
</form>
<br>
<center><span><%=statusMessage%></span></center>
</div>
        <h1><center>Outings approved By College</center></h1><hr>
        <div class="side">
        <div class="child"id="c1">I YEAR Students List</div>
        <div class="child"id="c2"><a href="IYearStudents.jsp"><button >OPEN</button></a></div>
        </div>
        <div class="side">
            <div class="child"id="c1">II YEAR Students List</div>
            <div class="child"id="c2"><a href="IIYearStudents.jsp"><button >OPEN</button></a></div>
            </div>
            <div class="side">
                <div class="child"id="c1">III YEAR Students List</div>
                <div class="child"id="c2"><a href="IIIYearStudents.jsp"><button >OPEN</button></a></div>
                </div>
                <div class="side">
                <div class="child"id="c1">IV YEAR Students List</div>
                <div class="child"id="c2"><a href="IVYearStudents.jsp"><button >OPEN</button></a></div>
                </div>
    </body>
</html>
