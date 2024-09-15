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
            System.out.println("i am here at adminDashboard servlet");

            request.setAttribute("giftToFilter","aaaaaaaa");  // just to test the filter
            request.setAttribute("errorMessage", "Welcome Back!");
            request.getRequestDispatcher("/adminDashboard.jsp").forward(request,response);
//            response.sendRedirect("/ecommerce/adminDashboard.jsp");
            request.getRequestDispatcher("/adminInfo.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

            Admin admin = (Admin) request.getAttribute("adminBean");

            System.out.println(admin.getEmail());

            EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

            AdminService adminService = new AdminService(emf.createEntityManager());

            try {
                adminService.updateAdmin(admin);

                request.getSession(false).setAttribute("admin", admin);

                request.setAttribute("errorMessage","Successfully Updated!");
                request.getRequestDispatcher("/adminInfo.jsp").forward(request, response);

            }catch (RuntimeException e)
            {
                request.setAttribute("errorMessage", "Error," + e.getMessage());
                request.getRequestDispatcher("/adminInfo.jsp").forward(request, response);
            }

        }

    }

}

