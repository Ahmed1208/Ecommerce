package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bean.ProductBean;
import org.example.entity.Category;
import org.example.entity.Product;
import org.example.mapper.ProductMapper;
import org.example.service.CategoryService;
import org.example.service.ProductService;

import java.io.IOException;
import java.util.List;

public class getProductAdmin extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");
        CategoryService categoryService = new CategoryService(emf.createEntityManager());

        try {
            request.setAttribute("ParentCategories", categoryService.getParentCategories());
            request.getRequestDispatcher("/all-products").include(request, response);
            request.getRequestDispatcher("/productsDashboard.jsp").forward(request, response);

        } catch (RuntimeException e) {
            request.setAttribute("errorMessage", e.getMessage());

        }

    }

}
