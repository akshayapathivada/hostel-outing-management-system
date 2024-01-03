import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class ApplyOuting extends HttpServlet{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        res.setContentType("text/html");
        PrintWriter pw=res.getWriter();
        String name=req.getParameter("name");
        String year=req.getParameter("year");
        String redg=req.getParameter("redg");
        String reason=req.getParameter("reason");
        String phone=req.getParameter("phone");
        String parentPhone=req.getParameter("pphone");
        String outdate=req.getParameter("outdate");
        String indate=req.getParameter("indate");
        String branch=req.getParameter("branch");
        String place=req.getParameter("place");
        String status="IN";
        String approval="review";
        String wapproval="review";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false&allowPublicKeyRetrieval=true","root","Gaya@123$");
            String q="insert into outings values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm=con.prepareStatement(q);
            stm.setString(1,name);
            stm.setString(2,redg);
            stm.setString(3,year);
            stm.setString(4,phone);
            stm.setString(5,parentPhone);
            stm.setString(6,outdate);
            stm.setString(7,indate);
            stm.setString(8,reason);
            stm.setString(9,status);
            stm.setString(10,branch);
            stm.setString(11,place);
            stm.setString(12,approval);
            stm.setString(13,wapproval);
            int x=stm.executeUpdate();
            System.out.println("Data updated successfully.."+x);
            if(x>0){
               pw.println("<html>");
                pw.println("<script>");
                pw.println("alert('Applied Successfully.');");
                pw.println("window.location.href='studentprofile.jsp';"); 
                pw.println("</script>");
                pw.println("</html>");
            }
            else{
                pw.println("<html>Register not successful</html>");
            }
            con.close();
        }catch(Exception e){
            pw.println(e.getMessage());
        }
    }
}