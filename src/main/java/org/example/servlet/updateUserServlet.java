package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.entity.User;
import org.example.service.UserService;

import java.io.IOException;


public class updateUserServlet extends HttpServlet {

    @Override
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        User user = (User) request.getAttribute("userDetailes");

        //System.out.println("printing user id inside log from updateUserServlet " + user.getId());

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        UserService userService = new UserService(emf.createEntityManager());
        System.out.println("entity manager created");

        try {
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
