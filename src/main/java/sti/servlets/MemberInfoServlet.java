 
package sti.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sti.DatabaseOperations.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberInfoServlet extends HttpServlet 
{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String memberid = request.getParameter("memberid");
        Database db = new Database();
        System.out.println(memberid);
        ResultSet rs = db.RetrieveUser(memberid, "Student");
        try
        {
            rs.next();
            String hrefvalue = "mailto:"+rs.getString("parentemail");
            String studentname = rs.getString("name");
            String department = rs.getString("department");
            String semester = String.valueOf(rs.getInt("semester"));
            request.setAttribute("hrefvalue", hrefvalue);
            request.setAttribute("studentname", studentname);
            request.setAttribute("department", department);
            request.setAttribute("semester", semester);
            request.setAttribute("memberid", memberid);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("memberinfoservlet: problem in getting member info");
        }
        DatabaseUtil.closeResultSet(rs);
        db.closedatabase();
        getServletContext().getRequestDispatcher("/memberinfo.jsp").forward(request, response);
    }
}
