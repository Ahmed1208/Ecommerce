package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Product;
import org.example.service.CartService;
import org.example.service.ProductService;

import java.io.IOException;

public class AddToCartServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        System.out.println("here, from AddToCartServlet");

        // Extract productId and userId from the request
        String productId = request.getParameter("id");   // This corresponds to the productId
        String userId = request.getParameter("userId");  // This corresponds to the userId

        EntityManagerFactory emf=(EntityManagerFactory) request.getServletContext().getAttribute("emf");

        CartService cartService = new CartService(emf.createEntityManager());

        try {

            cartService.addProductToCart(Integer.parseInt(userId), Integer.parseInt(productId));

        }catch (RuntimeException e)
        {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/products.jsp").forward(request, response);
        }

    }

}
