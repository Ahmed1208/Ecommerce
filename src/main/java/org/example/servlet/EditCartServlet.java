package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.UserProductCart;
import org.example.service.CartService;

import java.io.IOException;

public class EditCartServlet extends HttpServlet {
    EntityManagerFactory entityManagerFactory;
    CartService cartService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("userid");
        String productid = request.getParameter("itemid");
        if(userid != null && productid != null && !userid.isEmpty() && !productid.isEmpty()) {

            int userID = Integer.parseInt(userid);
            int productID = Integer.parseInt(productid);
            if(cartService.deleteProductFromCart(userID, productID)) {
                response.sendRedirect("/ecommerce/cart.jsp");
            }
        }



    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userid = request.getParameter("userid");
        String productid = request.getParameter("itemid");
        String quantity = request.getParameter("quantity");
        if(userid != null && productid != null && !userid.isEmpty() && !productid.isEmpty() && !quantity.isEmpty()) {
            int userID = Integer.parseInt(userid);
            int productID = Integer.parseInt(productid);
            int newQuantity = Integer.parseInt(quantity);
            try {
                cartService.updateProductQuantity(userID, productID, newQuantity);
                response.setStatus(HttpServletResponse.SC_OK);

            }catch(Exception e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            }

        }

    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext servletContext = config.getServletContext();
        entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("emf");
        cartService=new CartService(entityManagerFactory.createEntityManager());
    }
}
