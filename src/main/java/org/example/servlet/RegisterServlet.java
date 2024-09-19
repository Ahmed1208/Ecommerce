package org.example.servlet;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.bean.CartItemBean;
import org.example.entity.User;
import org.example.service.CartService;
import org.example.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        UserService userService = new UserService(emf.createEntityManager());
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String dob = req.getParameter("dob");
        String street = req.getParameter("street");
        String city = req.getParameter("city");
        String country = req.getParameter("country");
        String phone = req.getParameter("phone");
        try {
            User u = userService.registerNewUser(name, email, password, street, city, country, phone, dob, gender);
            if (u != null) {
                HttpSession session = req.getSession(true);
                session.setAttribute("user", u);
                //////////////////////////// cart from local storage ///////////////
                System.out.println(req.getParameter("cartSize"));
                String objectDataJson = req.getParameter("cart");
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
                        CartService cartService = new CartService(emf.createEntityManager());
                        cartService.addProductToCart(u.getId(), c.getProductId());
                    }

                }
                ///////////////////////////////////////////////////////
                int cartSize = new CartService(emf.createEntityManager()).cartProductsCount(u.getId());
                session.setAttribute("cartSize",cartSize);

                resp.sendRedirect("/ecommerce");
            }

        } catch (Exception e) {
            req.setAttribute("errormsg", e.getMessage());
            req.getRequestDispatcher("/register.jsp").include(req, resp);

        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        UserService userService = new UserService(emf.createEntityManager());
        String email = req.getParameter("email");
        resp.setContentType("text/plain");
        PrintWriter out = resp.getWriter();

        if (userService.checkIfEmailExist(email)) {
            out.println("error");
        }


    }
}
