 
package sti.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sti.DatabaseOperations.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TeacherInfoServlet extends HttpServlet 
{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //String userid = request.getParameter("userid");
        //String usertype = request.getParameter("type");
        String groupid = request.getParameter("groupid");
        System.out.println("teacherinfo servlet: groupid = "+groupid);
        Database db = new Database();
        ResultSet rs = db.getGroupOwner(groupid);
        try
        {
            rs.next();
            System.out.println("teacherinfoservlet: teacher record retrieved");
            request.setAttribute("teachername", rs.getString("name"));
            request.setAttribute("department", rs.getString("department"));
            request.setAttribute("designation", rs.getString("designation"));
            String hrefvalue = "mailto:"+rs.getString("email");
            request.setAttribute("hrefvalue", hrefvalue);
            request.setAttribute("teacherid", rs.getString("id"));
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("teacherinfo servlet: problem in getting teacher info");
        }
        getServletContext().getRequestDispatcher("/teacherinfo.jsp").forward(request, response);
    }
}
