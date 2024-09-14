package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.User;
import org.example.entity.UserProductCart;
import org.example.service.CartService;
import org.example.service.OrderService;

import java.io.IOException;
import java.util.List;

public class orderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManagerFactory entityManagerFactory=(EntityManagerFactory) req.getServletContext().getAttribute("emf");
        OrderService orderService=new OrderService(entityManagerFactory.createEntityManager());
        CartService cartService=new CartService(entityManagerFactory.createEntityManager());
        User user=(User) req.getSession().getAttribute("user");
        List<UserProductCart> cart=cartService.getUserCartProducts(user);
        String paymentType=req.getParameter("paymentType");
        Double bill=Double.valueOf(req.getParameter("bill"));
        Double payedFromBalance=Double.valueOf(req.getParameter("payedFromBalance"));
        System.out.println("bill="+bill+" paymentType="+paymentType+" cart= "+cart +" user= "+user+" PayedFromBalance="+payedFromBalance);
        if (user!=null && paymentType!=null && bill!=null && cart!=null&&payedFromBalance!=null) {
            try {
               orderService.placeOrder(user,cart,paymentType,bill,payedFromBalance);
                resp.setContentType("text/plain");
                resp.setStatus(HttpServletResponse.SC_OK);
                resp.getWriter().print("Order placed successfully");
            }catch (Exception e){
                resp.setContentType("text/plain");
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().print(e.getMessage());
            }

        }

    }
}
