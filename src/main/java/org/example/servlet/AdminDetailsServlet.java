package org.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AdminDetailsServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("i am here at adminDashboard servlet");

        request.setAttribute("giftToFilter", "aaaaaaaa");  // just to test the filter
        request.setAttribute("errorMessage", "Welcome Back!");
        request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
//            response.sendRedirect("/ecommerce/adminDashboard.jsp");
        request.getRequestDispatcher("/adminInfo.jsp").forward(request, response);
    }
}
