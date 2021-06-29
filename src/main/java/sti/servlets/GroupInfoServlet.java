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
import javax.servlet.http.HttpSession;


public class GroupInfoServlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession session = request.getSession();
        String groupid1 = (String)session.getAttribute("groupid");
        String groupid = request.getParameter("groupid");
        System.out.println("groupinfoservlet: groupid = "+groupid);
        Database db = new Database();
        
        if(groupid==null)
            groupid = groupid1;
        session.setAttribute("groupid", groupid);
        
        ResultSet rs = db.RetrieveGroupMembers(groupid);
        Vector<String>membernames = new Vector<String>();
        Vector<String>memberids = new Vector<String>();
        try
        {
            while(rs.next())
            {
                membernames.add(rs.getString("membername"));
                memberids.add(rs.getString("memberid"));
                System.out.println("groupinfoservlet: "+rs.getString("memberid"));
            }
            ResultSet rs2 = db.RetrieveGroup(groupid);
            if(rs2.next())
            {
                String groupname = rs2.getString("name");
                session.setAttribute("groupname", groupname);
                System.out.println("groupinfoservlet: "+groupname);
            }
            DatabaseUtil.closeResultSet(rs2);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("groupinfoservlet: could not retrieve memebers");
        }
        db.closedatabase();
        DatabaseUtil.closeResultSet(rs);
        request.setAttribute("membernames", membernames);
        request.setAttribute("memberids", memberids);
        request.setAttribute("groupid", groupid);
        getServletContext().getRequestDispatcher("/groupinfo.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        doPost(request, response);
    }
}
