package sti.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sti.DatabaseOperations.Database;
import sti.DatabaseOperations.DatabaseUtil;

public class GroupFilesServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String groupid = request.getParameter("groupid");
        System.out.println("groupfilesservlet: groupid = "+groupid);
        Database db = new Database();
        ResultSet rs = db.RetrieveGroupFiles(groupid);
        Vector<String>filenames = new Vector<String>();
        Vector<String>fileids = new Vector<String>();
        try
        {
            while(rs.next())
            {
                filenames.add(rs.getString("filename"));
                fileids.add(rs.getString("id"));
                System.out.println("groupinfoservlet: "+rs.getString("id"));
            }
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("groupfilesservlet: could not retrieve files");
        }
        db.closedatabase();
        DatabaseUtil.closeResultSet(rs);
        request.setAttribute("filenames", filenames);
        request.setAttribute("fileids", fileids);
        request.setAttribute("groupid", groupid);
        getServletContext().getRequestDispatcher("/groupfiles.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        doPost(request, response);
    }
}
