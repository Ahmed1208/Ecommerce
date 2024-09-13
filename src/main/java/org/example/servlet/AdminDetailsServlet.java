package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.entity.Product;
import org.example.service.ProductService;

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
            request.setAttribute("error", "sign-in first, bro");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
        else
        {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

}

