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

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        if (role.equals("User")) {
            UserService userService = new UserService(emf.createEntityManager());
            try {
                User user = userService.loginCheck(email, password);
                if (user != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", user);
                    session.setAttribute("role", role);
                    response.sendRedirect("/ecommerce");
//                } else {
//                    request.setAttribute("error", "Invalid email or password");
//                    request.getRequestDispatcher( "/login.jsp").include(request, response);
//
//                   // response.sendRedirect();
                }

            } catch (RuntimeException e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher( "/login.jsp").include(request, response);

            }
        }
    }
}
