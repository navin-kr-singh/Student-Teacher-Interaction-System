package sti.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sti.DatabaseOperations.*;
import sti.classes.Group;
import sti.classes.User;
import java.sql.ResultSet;
import java.io.File;
import java.sql.SQLException;

public class CreateGroupServlet extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String groupname = request.getParameter("groupname");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Group grp = new Group(groupname, user.getId());
        String message;
        int groupinserted = insertdb(grp);
        
        if(groupinserted>0)
            message = "group created successfully";
        else
            message = "group could not be created";
        
        String dirname = getlastgroupid(user.getId()); 
        String path;
        
        if(dirname!=null)
        {
            path = "D:/STI/GroupFolders/"+dirname;
            if(makefolder(path))
                System.out.println(message + "\nfolder created");
            else
                System.out.println(message + "\nfolder not created");
        }
        
        response.setHeader("refresh", "2;URL=homepage");
        try (PrintWriter pw = response.getWriter()) 
        {
            pw.print(message);
            pw.close();
        }
              
    } 
    
    protected static int insertdb(Group grp)
    {
        Database db = new Database();
        try
        {
            return db.CreateRecord(grp);
        }
        finally
        {
            db.closedatabase();
        }

    }
    
    protected static String getlastgroupid(String ownerid)
    {
        Database db = new Database();
        ResultSet rs = db.RetrieveLastGroupid(ownerid);
        String groupid = null;
        try
        {
            if(rs.next())
                groupid = String.valueOf(rs.getInt("id"));
            
            return groupid;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("create group servlet: getlastgroupid method - error");
            return null;
        }
        finally
        {
            DatabaseUtil.closeResultSet(rs);
            db.closedatabase();
        }
    }
    
    protected static boolean makefolder(String path)
    {
        if(path!=null)
        {
            File dir = new File(path);
            return dir.mkdir();
        }
        return false;
    }
}
