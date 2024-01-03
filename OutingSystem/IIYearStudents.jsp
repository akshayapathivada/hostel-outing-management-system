<%@page import="java.sql.*"%>
<html>
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="searchstyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  button {
  color : white;
 text-align: center;
 padding: 8px 8px;
 border: none;
 border-radius: 6px;
 display:flex;
 cursor:pointer;
 margin-bottom : 10px;
 margin-top : 10px;
 }
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #1593b7;
  margin-top:50px;
  margin-left:1px;
  margin-right:1px;
  border-radius:20px;
}
.curved-table {
  border-collapse: collapse;
  border-radius: 10px; 
}

th, td {
  text-align: left;
  padding: 8px;
}
th{
    background-color:lightcoral;
}
tr:nth-child(even){background-color:lightblue}
</style>
</head>

<body style="margin-inline: 10px;">
</div>
    <div style="overflow-x:auto;">
        <table>
          <tr>
            <th>Name</th>
            <th>Roll Number</th>
            <th>Year</th>
            <th>Phone Number</th>
            <th>Parent Number</th>
            <th>Out Date</th>
            <th>Approval</th>
            <th>Approval</th>
          </tr>
    <%
    String redg1=request.getParameter("redg1");
    String wapproval=request.getParameter("wapproval");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false","root","Gaya@123$");
Statement stm=con.createStatement();
if (redg1 != null && wapproval != null) {
  String updateQuery = "UPDATE outings SET wapproval='" + wapproval + "' WHERE redg='" + redg1 + "'";
  stm.executeUpdate(updateQuery);
}
ResultSet rs = stm.executeQuery("select * from outings where status='IN' and year='2' and approval='yes' and wapproval='review'");
while(rs.next()){
    String redg=rs.getString("redg");
%>
      <tr>
        <td><%=rs.getString("name")%></td>
        <td><%=redg%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=rs.getString("phone")%></td>
        <td><%=rs.getString("parentphone")%></td>
        <td><%=rs.getString("outdate")%></td>
        <td><a href="IIYearStudents.jsp?redg1=<%= redg %>&wapproval=yes" style="text-decoration: none;"><button style="background-color: green;">Accept</button></a></td>
        <td><a href="IIYearStudents.jsp?redg1=<%= redg %>&wapproval=no" style="text-decoration: none;"><button style="background-color: red;">Reject</button></a></td>
      </tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>