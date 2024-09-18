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

public class DeleteProductServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");
        ProductService productService = new ProductService(emf.createEntityManager());
        String productId = request.getParameter("product");

        try {
            productService.deleteproduct(Integer.parseInt(productId));
            request.setAttribute("errorMessage", "Product deleted successfully");
            request.getRequestDispatcher("/admin-products").forward(request, response);

        } catch (RuntimeException e) {
            request.setAttribute("errorMessage", "Error," + e.getMessage());
            request.getRequestDispatcher("/admin-products").forward(request, response);
        }

    }

}
