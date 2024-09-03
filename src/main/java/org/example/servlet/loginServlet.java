package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import org.example.entity.GENDER;
import org.example.entity.User;
import org.example.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class loginServlet extends HttpServlet {

    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        UserService userService = new UserService(emf.createEntityManager());


        try {
            userService.loginCheck(email,password);
            out.println("DONEEEEEEEEEEEEEEEEEEEEE");
        }
        catch (RuntimeException e)
        {
            out.println(e);
        }






    }




}
