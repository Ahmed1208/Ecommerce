package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Admin;
import org.example.service.AdminService;

import java.io.IOException;

public class AdminDetailsServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("i am here at adminDashboard servlet");

        request.setAttribute("giftToFilter", "aaaaaaaa");  // just to test the filter
        request.setAttribute("errorMessage", "Welcome Back!");
       // request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
//            response.sendRedirect("/ecommerce/adminDashboard.jsp");
        request.getRequestDispatcher("/adminInfo.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin =(Admin) request.getAttribute("adminBean");
        EntityManagerFactory entityManagerFactory=(EntityManagerFactory) request.getServletContext().getAttribute("emf");
        AdminService adminService=new AdminService(entityManagerFactory.createEntityManager());
        adminService.updateAdmin(admin);
        request.getSession().setAttribute("admin",admin);
        response.sendRedirect("/ecommerce/adminDashboard");
    }
}
