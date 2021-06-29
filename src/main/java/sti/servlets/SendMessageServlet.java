package sti.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sti.DatabaseOperations.Database;
import sti.DatabaseOperations.DatabaseUtil;
import sti.classes.Message;
import sti.classes.User;

public class SendMessageServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        Database db = new Database();
        
        
        String groupid = (String)session.getAttribute("groupid");
        String username = null;
        ResultSet userinfo = db.RetrieveUser(user.getId(), user.getType());
        try
        {
          userinfo.next();
          username = userinfo.getString("name");
          DatabaseUtil.closeResultSet(userinfo);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("SendMessageServlet: error");
        }
        
        String content = request.getParameter("message");
        
        Message msg = new Message(groupid, user.getId(), username, content);
        
        String display = "message not sent";
        
        if(db.CreateRecord(msg)>0)
            display = "message sent";
        
        response.setHeader("refresh", "2;URL=groupmessages");
        PrintWriter pw = response.getWriter();
        pw.print(display);
        pw.close();
    }  
}
