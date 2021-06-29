package sti.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sti.DatabaseOperations.Database;
import sti.DatabaseOperations.DatabaseUtil;

public class FileInfoServlet extends HttpServlet 
{   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String fileid = request.getParameter("fileid");
        Database db = new Database();
        System.out.println("fileinfoservlet: fileid = "+fileid);
        ResultSet rs = db.RetrieveFile(fileid);
        try
        {
            rs.next();
            String filename = rs.getString("filename");
            String senderid = rs.getString("senderid");
            String sendername = rs.getString("sendername");
            
            request.setAttribute("filename", filename);
            request.setAttribute("senderid", senderid);
            request.setAttribute("sendername", sendername);
            request.setAttribute("fileid", fileid);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("fileinfoservlet: problem in getting sender info");
        }
        DatabaseUtil.closeResultSet(rs);
        db.closedatabase();
        getServletContext().getRequestDispatcher("/fileinfo.jsp").forward(request, response);
    }
}
