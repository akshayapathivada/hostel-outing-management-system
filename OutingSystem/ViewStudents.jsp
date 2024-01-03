<%@page import="java.sql.*"%>
<!DOCTYPE html>
<head>
<title>Student Details</title>
<style>
* { 
margin: 0; 
padding: 0; 
} 
#t { 
font-size: 30px; 
} 
.fir { 
border: 3px solid #2f4858; 
margin: 25px auto; 
padding: 10px 60px; 
border-radius: 5px; 
background-color: #f2e9e4; 
box-shadow: 5px 5px 5px #bbb; 
max-width: 500px; 
text-align: center; 
} 
body { 
background-color: #f9d9cb; 
} 
#hi { 
font-size: 25px; 
color: #a66951; 
} 
#y { 
font-family: 'Times New Roman', Times, serif; 
font-weight: bold; 
} 
.j { 
margin: 20px; 
} 
button { 
padding: 10px; 
border-radius: 10px; 
font-weight: bold; 
font-size: 20px; 
margin-bottom: 20px; 
cursor: pointer; 
} 
#h { 
margin-left: 30px; 
background-color: #ff524b; 
border: none; 
color: white; 
} 
#hlo { 
background-color: green; 
border: none; 
color: white; 
} 
</style>
</head>
<body>
    <%
    String redg=request.getParameter("redg");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false","root","Gaya@123$");
PreparedStatement stm = con.prepareStatement("SELECT * FROM outings WHERE redg=?");
            stm.setString(1, redg);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                %>
<center><h1 class="j"><font color="#2f4858">Student Details</font></h1></center>
<hr>
<div class="fir"><center>
<table cellspacing="8" cellpadding="20">
<tr> <td colspan="2"><h1 id="t"><font 
color="#ff524b"><%= redg %></font></h1></td></tr>
<tr><td colspan="2"><img src="avatar.jpg" width="150px" height="150px" 
alt=""></td></tr>
<tr><td id="y"><b id="hi">Reason:</b></td><td><b><font size="4px" 
color="#a66951"><%=rs.getString("reason")%></font></b></p></td></tr>
<tr><td id="y"><b id="hi">Out Date:</b></td> <td><b><font size="4px" 
color="#a66951"><%=rs.getString("outdate")%></font></b></td></tr>
<tr><td id="y"><b id="hi">In Date:</b></td><td><b><font size="4px" 
color="#a66951"><%=rs.getString("indate")%></font></b></td></tr>
<tr><td id="y"><b id="hi">Parent Mobile No:</b></td><td><b><font size="4px" 
color="#a66951"><%=rs.getString("parentphone")%></font></b></td></tr>
<tr><td id="y"><b id="hi">Place:</b></td><td><b><font size="4px" 
color="#a66951"><%=rs.getString("place")%></font></b></td></tr>
</table></center>
<br>
<a href="StudentList.jsp?redgg=<%= redg %>&value=yes"><button type="button" id="hlo">Accept</button></a>
<a href="StudentList.jsp?redgg=<%= redg %>&value=no"><button type="button" id="h">Decline</button></a>
</div>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>  