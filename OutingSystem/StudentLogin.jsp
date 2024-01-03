<%@page import="java.sql.*"%>
<html>
<body>
<%! String user,pwd;
%>
<%
user=request.getParameter("studentUsername");
pwd=request.getParameter("studentPassword");
session.setAttribute("redg",user);
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false&allowPublicKeyRetrieval=true","root","Gaya@123$");
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select * from students where redg='"+user+"' and password='"+pwd+"'");
if (rs.next())
{
response.sendRedirect("studentprofile.jsp");
}
else{
out.println("<html><b><center><h1>Invalid User</h1></center></b></html>");
}
con.close();
}
catch(Exception e){
out.println(e.getMessage());
}
%>
</body>
</html>