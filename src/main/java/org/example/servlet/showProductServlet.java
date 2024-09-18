package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Product;
import org.example.entity.User;
import org.example.service.ProductService;
import org.example.service.UserService;

import java.io.IOException;
import java.util.List;

public class showProductServlet extends HttpServlet {



    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");

        System.out.println("This id is from doGet showProductServlet: " + id);

        if(id == null || id.isEmpty())
        {
            System.out.println("This id is from doGet showProductServlet: " + id);

            response.sendRedirect("/ecommerce/shop-page");
            return;
        }

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        ProductService productService = new ProductService(emf.createEntityManager());

        try {
            Product product = productService.findProductById(Integer.parseInt(id));

            List<Product> relatedProducts = productService.findProductsBySubcategory(product.getCategory().getId());

            request.setAttribute("product", product);
            request.setAttribute("relatedProducts", relatedProducts);


            request.getRequestDispatcher("/product-details.jsp").forward(request, response);

        }catch (RuntimeException e)
        {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/product-details.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
