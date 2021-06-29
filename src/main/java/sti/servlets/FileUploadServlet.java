package sti.servlets;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import sti.DatabaseOperations.*;
import sti.classes.User;
import sti.classes.Files;
import java.io.File; 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 
public class FileUploadServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String groupid = (String)session.getAttribute("groupid"); 
        String username = getusername(user.getId(), user.getType());
        String message = "file not uploaded";
        
        System.out.println("FileUploadServlet: groupid = "+groupid);
        String filepath = "D:/STI/GroupFolders/"+groupid+"/";
        String filename = uploadfile(request, filepath);
       
        if(filename!=null)
            message = "file uploaded";
        
        Files f = new Files(filename, user.getId(), groupid, username);
        int fileinserted = insertdb(f);
        
        if(fileinserted > 0)
            System.out.println(message+"\nfile recorded in database");
        
        response.setHeader("refresh", "2;URL=groupfiles");
        try (PrintWriter pw = response.getWriter()) 
        {
            pw.print(message);
            pw.close();
        }
        
    }

    protected static String getusername(String userid, String type)
    {
        Database db = new Database();
        ResultSet userinfo = db.RetrieveUser(userid, type);
        String username = null;
        try
        {
          userinfo.next();
          username = userinfo.getString("name");
          return username;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("fileupload servlet: getusername method - error in user information retrieval");
            return null;
        }
        finally
        {
            DatabaseUtil.closeResultSet(userinfo);
            db.closedatabase();
        }
    }
    
    protected static int insertdb(Files file)
    {
        Database db = new Database();
        try
        {
            return db.CreateRecord(file);
        }
        finally
        {
            db.closedatabase();
        }
    }
    
    protected static String uploadfile(HttpServletRequest request, String path)
    {
        try
       {
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> files = sf.parseRequest(request);
            String filename = null; 
            for(FileItem f : files)
            {
               filename  = f.getName();
               f.write(new File(path+filename));
            }
            System.out.println("File Upload Servlet: uploadfile method - filename = "+filename);
            return filename;
       }
       catch(FileUploadException fe)
       {
           System.out.println(fe);
           System.out.println("File Upload Servlet: uploadfile method - fileupload error");
           return null;
       } 
       catch (Exception e) 
       {
            System.out.println(e);
            System.out.println("File Upload Servlet: uploadfile method - file error");
            return null;
       }
    }
}
