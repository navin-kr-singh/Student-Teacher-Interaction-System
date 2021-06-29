package sti.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sti.DatabaseOperations.Database;
import sti.classes.User;


public class LoginServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        HttpSession session;
        String url;
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        System.out.println("homepage servlet: "+id+" "+password+" "+type);
        User user = new User(id, password, type);
        Database db = new Database();
        boolean valid = db.isUserValid(user);
        if(!valid)
        {
            PrintWriter pw = response.getWriter();
            pw.println("Check Your Login Credentials");
        }
        else
        {
            url = "/homepage";
            session = request.getSession();
            session.setAttribute("user", user);
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }
        
    }
    
}
