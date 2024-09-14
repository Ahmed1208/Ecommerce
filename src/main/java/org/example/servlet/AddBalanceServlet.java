package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.User;
import org.example.service.BalanceLogsService;
import org.example.service.UserService;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/addBalance")

public class AddBalanceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManagerFactory entityManagerFactory= (EntityManagerFactory) req.getServletContext().getAttribute("emf");
        UserService userService=new UserService(entityManagerFactory.createEntityManager());
        User user = (User) req.getSession().getAttribute("user");
        String amount=req.getParameter("amount");
        if(user!=null){
            try {
                double amountDouble=Double.parseDouble(amount);
                int userid=user.getId();
                Optional<User> u= userService.AddBalanceToUser(userid,amountDouble);
                req.getSession().setAttribute("user", u.get());
                resp.setStatus(HttpServletResponse.SC_OK);
            }catch (Exception e) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }

        }else {
            resp.sendRedirect("login.jsp");
        }

    }
}
