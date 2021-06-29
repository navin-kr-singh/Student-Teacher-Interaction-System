
package sti.servlets;

import sti.classes.*;
import sti.DatabaseOperations.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.lang.Integer;

public class HomepageServlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        
        Vector<String>groupnames = new Vector<String>();
        Vector<Integer>groupids = new Vector<Integer>();
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Database db = new Database();
        ResultSet rs = db.RetrieveUser(user.getId(), user.getType());
        String username = null;
        try
        {
            rs.next();
            username = rs.getString("name");
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("homepageservlet: cannot get user information");
        }
        DatabaseUtil.closeResultSet(rs);
        
        if(user.getType().equals("Student"))
        {
            ResultSet memberships = db.RetrieveMemberships(user.getId());
            try
            {
                while(memberships.next())
                {
                    groupnames.add(memberships.getString("groupname"));
                    groupids.add(memberships.getInt("groupid"));
                }
            }
            catch(SQLException se)
            {
                System.out.println(se);
                System.out.println("homepageservlet: could not retrieve memberships");
            }
            DatabaseUtil.closeResultSet(memberships);
        }
        else
        {
            ResultSet groups = db.Retrievegroups(user.getId());
            try
            {
                while(groups.next())
                {
                    groupnames.add(groups.getString("name"));
                    groupids.add(groups.getInt("id"));
                }
            }
            catch(SQLException se)
            {
                System.out.println(se);
                System.out.println("homepageservlet: could not retrieve groups");
            }
            DatabaseUtil.closeResultSet(groups);
        }
            
        request.setAttribute("username", username);
        request.setAttribute("groupnames", groupnames);
        request.setAttribute("groupids", groupids);
        db.closedatabase();
        getServletContext().getRequestDispatcher("/homepage.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        doPost(request, response);
    }
}
