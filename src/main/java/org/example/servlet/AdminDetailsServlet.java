package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.entity.Admin;
import org.example.entity.Product;
import org.example.entity.User;
import org.example.service.AdminService;
import org.example.service.ProductService;
import org.example.service.UserService;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class AdminDetailsServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession httpSession = request.getSession(false);
        if(httpSession == null || httpSession.getAttribute("role") == null)
        {
            request.setAttribute("errorMessage", "Error, sign-in first, bro");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
        else
        {
            request.setAttribute("errorMessage", "Welcome Back!");
            request.getRequestDispatcher("/adminDashboard.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession httpSession = request.getSession(false);
        if(httpSession == null || httpSession.getAttribute("role") == null)
        {
            request.setAttribute("errorMessage", "Error, sign-in first, bro");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
        else
        {
            Admin admin = (Admin) request.getAttribute("adminBean");

            System.out.println(admin.getEmail());

            EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

            AdminService adminService = new AdminService(emf.createEntityManager());

            try {
                adminService.updateAdmin(admin);

                request.getSession(false).setAttribute("admin", admin);

                response.sendRedirect("/ecommerce/adminDashboard.jsp");

            }catch (RuntimeException e)
            {
                request.setAttribute("errorMessage", "Error," + e.getMessage());
                request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
            }

        }

    }

}

