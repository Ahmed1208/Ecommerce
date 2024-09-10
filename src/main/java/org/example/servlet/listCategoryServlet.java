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

public class listCategoryServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");
        CategoryService categoryService = new CategoryService(emf.createEntityManager());
        request.setAttribute("ParentCategories", categoryService.getParentCategories());
        request.getRequestDispatcher("listCategories.jsp").forward(request, response);

    }
}