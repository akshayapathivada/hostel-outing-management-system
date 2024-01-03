<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
<title>Student Details</title>
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
    <center><h1>UPDATE STUDENT OUT STATUS</h1></center>
    <div class="container" style="margin-top:50px">
        <form method="GET" action="SearchDelete.jsp">
        <center><input class="search" type="text" name="rollNumber" placeholder="Roll number of student" style="height:35px;border-radius:5px;">
<button type="submit" value="view" style="border-radius:5px;background-color:rgb(64, 241, 64);width:50px;height:35px">Search</button></center>
</form>

    <%-- Check if the rollNumber parameter is present in the request --%>
    <% String rollNumber = request.getParameter("rollNumber");
    if (rollNumber != null && !rollNumber.isEmpty() && !rollNumber.equals("null") && !rollNumber.equals("") && !(request.getParameter("reset") != null && request.getParameter("reset").equals("true"))) {
           try {
               Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false&allowPublicKeyRetrieval=true", "root", "Gaya@123$");

               // Search for the student in the outings table based on the roll number
               PreparedStatement searchStm = con.prepareStatement("SELECT * FROM outings WHERE redg = ? and approval='yes' and wapproval='yes' and status='IN' ");
               searchStm.setString(1, rollNumber);
               ResultSet rs = searchStm.executeQuery();

               // Display the student details if found
               if (rs.next()) {
                   %>
                   <form method="POST" action="SearchDelete.jsp">
                        <div class="child" id="c1"><input type="hidden" name="rollNumber" value="<%= rollNumber %>" /><br><%= rollNumber %>
                            <button class="button" type="submit" name="action" value="update" style="margin-left:500px">OUT</button>
                            </div>
                   </form>
                   <%
               } 
               else {
                out.println("<p>No student found with the provided roll number.</p>");
            }
               con.close();
           } catch (Exception e) {
               e.printStackTrace();
           }
       }
    %>

    <%-- Process the delete action --%>
    <% String action = request.getParameter("action");
       if (action != null && action.equals("update")) {
           String rollNumberToUpdate = request.getParameter("rollNumber");
           if (rollNumberToUpdate != null && !rollNumberToUpdate.isEmpty()) {
               try {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root", "Gaya@123$");

                   // Delete the student from the outings table based on the roll number
                   PreparedStatement deleteStm = con.prepareStatement("update outings set status='OUT' WHERE redg = ?");
                   deleteStm.setString(1, rollNumberToUpdate);
                   int rowsAffected = deleteStm.executeUpdate();

                   if (rowsAffected > 0) {
                    out.println("<p>Updated Status Successfully</p>");
                       response.sendRedirect("SearchDelete.jsp?reset=true");
                   } else {
                       out.println("<p>Updation failed. No student found with the provided roll number.</p>");
                   }

                   con.close();
               } catch (Exception e) {
                   e.printStackTrace();
               }
           }
       }
    %>

</div>
</body>
</html>
