
package sti.servlets;


import sti.DatabaseOperations.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


public class SearchMemberServlet extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String groupid = request.getParameter("groupid");
        String memberinfo = request.getParameter("memberinfo");
        Vector<String>membernames = new Vector<String>();
        Vector<String>memberids = new Vector<String>();
        Database db = new Database();
        ResultSet rs = db.SearchGroupMembers(groupid, memberinfo);
        try
        {
            while(rs.next())
            {
                membernames.add(rs.getString("membername"));
                memberids.add(rs.getString("memberid"));
            }
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("searchmemberservlet: member could not be searched");
        }
        DatabaseUtil.closeResultSet(rs);
        db.closedatabase();
        request.setAttribute("membernames", membernames);
        request.setAttribute("memberids", memberids);
        request.setAttribute("memberinfo", memberinfo);
        getServletContext().getRequestDispatcher("/searchmember.jsp").forward(request, response);
    }
}
