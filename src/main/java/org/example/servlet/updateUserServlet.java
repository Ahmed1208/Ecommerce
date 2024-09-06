package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.User;
import org.example.service.UserService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class updateUserServlet extends HttpServlet {

    @Override
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        User user = (User) request.getAttribute("userBean");

        //need to delete this line
        user.setDateOfBirth(new Date(2012,05,6));

        System.out.println("printing user id inside log from updateUserServlet " + user.getId());

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        UserService userService = new UserService(emf.createEntityManager());
        System.out.println("entity manager created");

        try {
            userService.updateUser(user);
            request.getRequestDispatcher("/userDetails.jsp").forward(request, response);

        }catch (RuntimeException e)
        {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/userDetails.jsp").forward(request, response);
        }

    }
}
