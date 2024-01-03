<%@page import="java.sql.*"%>
<html>
<head>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #fdf5d5;
        }

        h1 {
            margin-top: 20px;
            color: rgba(20, 90, 90, 0.9);
            margin-bottom: 8px;
            font-family: sans-serif;
        }

        .container {
            margin: 60px auto;
            width: 600px;
            background-color: #ffdd80;
            padding: 20px;
            border-radius: 10px;
            border: 2px solid black;
        }

        .side {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 50px;
            margin-bottom: 10px;
        }

        .child {
            padding-top: 13px;
            font-size: 20px;
            font-weight: bolder;
            color: rgb(20, 90, 90);
            margin-right: 10px; 
        }

        .button {
            margin-top: 7px;
            padding: 5px 10px;
            font-weight: bolder;
            width: 60px;
            border-radius: 10px;
            cursor: pointer;
            background-color: rgb(156, 217, 156);
            border: none;
            font-family: 'Courier New', Courier, monospace;
            font-size: 15px;
            color:black;
            text-decoration:none;
        }

        .button:hover {
            background: rgb(196, 236, 196);
            color: rgb(4, 118, 4);
        }
    </style>
</head>

<body>
    <div style="text-align: right;margin-right: 50px;margin-top: 30px">
        <button onclick="location.href='home.html'" style="background-color: crimson; color: white; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">LOGOUT</button>
      </div>
    <div class="container">
        <form>
        <h1><center>Students Outing Applications</center></h1>
        <hr>
    <%
    String redg1=request.getParameter("redgg");
    String value=request.getParameter("value");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false&allowPublicKeyRetrieval=true","root","Gaya@123$");
Statement stm=con.createStatement();
if(redg1!=null && value!=null){
    PreparedStatement stm1=con.prepareStatement("update outings set approval=? where redg=? "); 
stm1.setString(1,value);
stm1.setString(2,redg1);
int x=stm1.executeUpdate();
}
ResultSet rs = stm.executeQuery("select * from outings where approval='review'");
while(rs.next()){
    String redg=rs.getString("redg");
%>
        <div class="side">
            <div class="child" id="c1"><%= redg %></div>
            <div class="child" id="c2">
                <a class="button" href="ViewStudents.jsp?redg=<%= redg %>">OPEN</a>
            </div>
        </div>
<%
}
con.close();
} catch (Exception e) {
out.println(e);
}
%>
</div>
</form>
</body>

</html>