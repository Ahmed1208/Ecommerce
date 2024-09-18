package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Order;
import org.example.entity.PAYMENT;
import org.example.entity.STATUS;
import org.example.entity.User;
import org.example.service.AdminService;
import org.example.service.UserService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

public class UserDetailsServlet extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession httpSession = request.getSession(false);
//        if (httpSession == null || httpSession.getAttribute("role") == null) {
//            request.setAttribute("errorMessage", "Error, sign-in first, bro");
//            request.getRequestDispatcher("/login.jsp").forward(request, response);
//        } else {

        String userId = request.getParameter("userId");

        if(userId != null && !userId.isEmpty())
        {
            doPost(request, response);
            return;
        }
        request.getRequestDispatcher("/userDetails.jsp").forward(request, response);
}


@Override
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String id = request.getParameter("userId");

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        UserService userService = new UserService(emf.createEntityManager());

        try {
            User user = userService.findUserById(Integer.parseInt(id));

            request.setAttribute("user", user);


            request.getRequestDispatcher("/userDetails.jsp").forward(request, response);
        }catch (RuntimeException e)
        {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/userDetails.jsp").forward(request, response);
        }
    }
}
