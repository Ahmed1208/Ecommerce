package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import org.example.entity.User;
import org.example.entity.UserProductCart;
import org.example.service.CartService;

import java.io.IOException;
import java.util.List;
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory)req.getServletContext().getAttribute("emf");
        CartService cartService=new CartService(entityManagerFactory.createEntityManager());
        HttpSession session =req.getSession(false);
        if(session!=null){
            User user= (User) req.getSession(false).getAttribute("user");
            if (user!=null&&user.getId()!=null){
                List<UserProductCart> cartProducts = cartService.getUserCartProducts(user);
                req.setAttribute("cart", cartProducts);
                req.getRequestDispatcher("cart.jsp").forward(req, resp);
                //req.getSession().setAttribute("cart",cartProducts);
            }else{
                resp.sendRedirect("login.jsp");
            }
        }else {
            resp.sendRedirect("login.jsp");
        }


    }
}
