package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Product;
import org.example.service.ProductService;

import java.io.IOException;
import java.util.List;

public class TestServlet extends HttpServlet {



    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        ProductService productService = new ProductService(emf.createEntityManager());

        String pn = request.getParameter("pageNumber");

        if(pn == null || pn.isEmpty())
            pn = "1";

        int pageNumber = Integer.parseInt(pn); // Example: Current page number (can be obtained from request parameters)
        int pageSize = 9;  // Number of products per page

        List<Product> products = productService.getProductsByPage(pageNumber);
        long totalProducts = productService.getTotalProductCount();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        request.setAttribute("products", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", pageNumber);

        request.getRequestDispatcher("/test.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
