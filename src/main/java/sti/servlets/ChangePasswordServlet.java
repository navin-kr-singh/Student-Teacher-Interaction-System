
package sti.servlets;

import sti.classes.User;
import sti.DatabaseOperations.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePasswordServlet extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String password = request.getParameter("password");
        System.out.println(user.getId()+ " "+password+" "+user.getType());
        String newpassword = request.getParameter("newpassword");
        String renewpassword = request.getParameter("renewpassword");
        String message;
        if(!newpassword.equals(renewpassword))
            message = "New Passwords Do Not Match";
        else
        {
            Database db = new Database();
            if(!password.equals(user.getPassword()))
                message = "Check Your current Password";
            else
            {
                if(db.UpdatePassword(user, newpassword)>0)
                {
                    message = "Password Changed Successfully";
                    user.setPassword(newpassword);
                }
                else
                    message = "Could Not Change The Password!!! Try Sometime Later";
            }
        }
        response.setHeader("refresh", "2;URL=homepage");
        PrintWriter pw = response.getWriter();
        pw.print(message);
        pw.close();
    }
}
