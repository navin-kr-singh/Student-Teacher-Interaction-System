package sti.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sti.DatabaseOperations.*;
import java.io.File;
import java.io.PrintWriter;


public class DeleteGroupServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String groupid = request.getParameter("groupid");
        String message;
        Database db = new Database();
        
        if(db.DeleteGroup(groupid)>0)
            message = "Group deleted";
        else
            message = "Group could not be deleted";
        
        String groupfolderpath = "D:/STI/GroupFolders/"+groupid;
        File gorupfolder = new File(groupfolderpath);
        boolean folderdeleted = deletedirectory(gorupfolder);
        
        if(folderdeleted)
            System.out.println(message+"group folder deleted");
        
        response.setHeader("refresh", "2;URL=homepage");
        PrintWriter pw = response.getWriter();
        pw.println(message);
        pw.close();
    }
    
    protected static boolean deletedirectory(File folder)
    {
        for(File subfile: folder.listFiles())
        {
            if(subfile.isDirectory())
                deletedirectory(subfile);
            else
                subfile.delete();
        }
        return folder.delete();
    }
}
