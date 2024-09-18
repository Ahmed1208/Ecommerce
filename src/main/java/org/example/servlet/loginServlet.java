package org.example.servlet;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import org.example.bean.CartItemBean;
import org.example.entity.Admin;
import org.example.entity.GENDER;
import org.example.entity.User;
import org.example.service.AdminService;
import org.example.service.CartService;
import org.example.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

public class loginServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String email = request.getParameter("email");
        String password = request.getParameter("password");




        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

            EntityManager entityManager = emf.createEntityManager();
            UserService userService = new UserService(entityManager);
            AdminService adminService = new AdminService(entityManager);

        try {
                User user = userService.loginCheck(email, password);
                Admin admin = adminService.checkAdmin(email,password);

            if (user != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", user);
                    session.setAttribute("role", "User");

                //////////////////////////// cart from local storage ///////////////
                System.out.println(request.getParameter("cartSize"));
                String objectDataJson = request.getParameter("cart");
                if(objectDataJson!=null && !objectDataJson.isEmpty()&&!objectDataJson.equals("null")) {
                    // Remove surrounding quotes and unescape if necessary
                    if (objectDataJson != null && objectDataJson.startsWith("\"") && objectDataJson.endsWith("\"")) {
                        objectDataJson = objectDataJson.substring(1, objectDataJson.length() - 1);
                        objectDataJson = objectDataJson.replace("\\\"", "\"");
                    }
                    System.out.println(objectDataJson);
                    // Create ObjectMapper instance
                    ObjectMapper objectMapper = new ObjectMapper();
                    // Deserialize JSON array into List<CartItemBean>
                    List<CartItemBean> cartItems = objectMapper.readValue(objectDataJson, new TypeReference<List<CartItemBean>>() {
                    });
                    for (CartItemBean c : cartItems) {
                        System.out.println("productId : " + c.getProductId() + " quantity : " + c.getQuantity());

                        //add items to user cart
                        CartService cartService = new CartService(entityManager);
                        cartService.addProductToCart(user.getId(), c.getProductId());
                    }

                }
                ///////////////////////////////////////////////////////
                int cartSize = new CartService(entityManager).cartProductsCount(user.getId());
                session.setAttribute("cartSize",cartSize);

                System.out.println("User added to session: " + session.getAttribute("user"));
                response.sendRedirect("/ecommerce");

            }else if (admin!=null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("admin", admin);
                session.setAttribute("role", "Admin");
                response.sendRedirect("/ecommerce/adminInfo.jsp");
            }else {
                HttpSession session = request.getSession();
                session.invalidate();
                request.setAttribute("errorMessage", "Error wrong email or password");
                request.getRequestDispatcher( "/login.jsp").forward(request, response);
            }

        } catch (RuntimeException e) {
                System.out.println("Error in login : " + e.getMessage());
                HttpSession session = request.getSession();
                session.invalidate();
                request.setAttribute("errorMessage","Error"+ e.getMessage());
                request.getRequestDispatcher( "/login.jsp").forward(request, response);

            }




    }
}
