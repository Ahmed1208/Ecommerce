package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.entity.User;
import org.example.service.UserService;

import java.io.IOException;
import java.util.HashSet;


public class updateUserServlet extends HttpServlet {

    @Override
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        User user = (User) request.getAttribute("userDetailes");


        System.out.println("printing user balance inside log from updateUserServlet " + user.getBalance());

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        UserService userService = new UserService(emf.createEntityManager());
        System.out.println("entity manager created");

        try {
            //  This line because the reciceved user already don't contain the data from database
            //  just from the session and you can't depend on the session to retrive your data
            user.setInterests(new HashSet<>(userService.findUserById(user.getId()).getInterests()));
            ///////////////////////////////////////////////////////////////////////////////////////

            userService.updateUser(user);
            request.getSession(false).setAttribute("user", user);
            response.sendRedirect("/ecommerce/profile");

        }catch (RuntimeException e)
        {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/userDashboard.jsp").forward(request, response);
        }

    }
}
