package sti.servlets;

import java.io.FileInputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import sti.DatabaseOperations.Database;
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sti.DatabaseOperations.DatabaseUtil;

public class FileDownloadServlet extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {               
        String fileid = request.getParameter("fileid");
        String filename = getfilename(fileid);
        String groupid = getgroupid(fileid);
        PrintWriter pw = response.getWriter();
        FileInputStream fileInputStream;
        
        if(filename!=null && groupid!=null)
        {
            String path = "D:/STI/GroupFolders/"+groupid+"/"+filename;
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\""+ filename + "\"");
 
            fileInputStream = new FileInputStream(path);
            int i;
            while ((i = fileInputStream.read()) != -1) 
            {
                pw.write(i);
            }
            fileInputStream.close();
            pw.close();
        }   
    }
    
    protected static String getfilename(String fileid)
    {
        Database db = new Database();
        ResultSet rs = db.RetrieveFile(fileid);
         try
        {
            rs.next();
            String filename = rs.getString("filename");
            return filename;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("filedownloadservlet:  getfilename method - error");
            return null;
        }
         finally
         {
             DatabaseUtil.closeResultSet(rs);
             db.closedatabase();
         }
    }
    
    protected static String getgroupid(String fileid)
    {
        Database db = new Database();
        ResultSet rs = db.RetrieveFile(fileid);
         try
        {
            rs.next();
            String groupid = rs.getString("groupid");
            return groupid;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("filedownloadservlet:  getgroupid method - error");
            return null;
        }
         finally
         {
             DatabaseUtil.closeResultSet(rs);
             db.closedatabase();
         }
    }
}
