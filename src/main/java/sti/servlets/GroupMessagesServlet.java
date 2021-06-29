
package sti.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sti.DatabaseOperations.Database;
import sti.DatabaseOperations.DatabaseUtil;

public class GroupMessagesServlet extends HttpServlet 
{    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        HttpSession session = request.getSession();
        String groupid = (String)session.getAttribute("groupid");
        Vector<String>messages = new Vector<String>();
        Vector<String>sendernames = new Vector<String>();
        Vector<String>senderids = new Vector<String>();
        
        Database db = new Database();
        ResultSet rs = db.RetrieveGroupMessages(groupid);
        try
        {
            while(rs.next())
            {
                messages.add(rs.getString("content"));
                sendernames.add(rs.getString("sendername"));
                senderids.add(rs.getString("senderid"));
            }
            request.setAttribute("messages", messages);
            request.setAttribute("sendernames", sendernames);
            request.setAttribute("senderids", senderids);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("GroupMessagesServlet: error");
        }
        DatabaseUtil.closeResultSet(rs);
        db.closedatabase();
        request.setAttribute("groupid", groupid);
        getServletContext().getRequestDispatcher("/groupmessages.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        doPost(request, response);
    }
}
