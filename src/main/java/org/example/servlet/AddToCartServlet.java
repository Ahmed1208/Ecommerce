package org.example.servlet;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
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
        String productId = request.getParameter("productId");   // This corresponds to the productId
        String userId = request.getParameter("userId");  // This corresponds to the userId

        EntityManagerFactory emf=(EntityManagerFactory) request.getServletContext().getAttribute("emf");

        EntityManager entityManager = emf.createEntityManager();
        CartService cartService = new CartService(entityManager);

        response.setContentType("text/plain");

        try {

            cartService.addProductToCart(Integer.parseInt(userId), Integer.parseInt(productId));

            HttpSession session = request.getSession(false);
            if (session != null)
            {
                int cartSize = new CartService(entityManager).cartProductsCount(Integer.parseInt(userId));
                session.setAttribute("cartSize",cartSize);
            }

            entityManager.close();
            // Send the message as plain text
            response.getWriter().write("Product added successfully");
        }
        catch (RuntimeException e)
        {
            String message = e.getMessage();
            // Send the message as plain text
            response.getWriter().write(message);
        }

    }

}
