package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.dao.OrderDao;
import org.example.entity.BalanceLogs;
import org.example.entity.Order;
import org.example.entity.User;
import org.example.service.BalanceLogsService;
import org.example.service.OrderService;

import java.io.IOException;
import java.util.List;

public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManagerFactory entityManagerFactory=(EntityManagerFactory) req.getServletContext().getAttribute("emf");
        BalanceLogsService balanceLogsService=new BalanceLogsService(entityManagerFactory.createEntityManager());
        OrderService orderService=new OrderService(entityManagerFactory.createEntityManager());
        HttpSession session = req.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");

          //  resp.getWriter().println(user.toString());
            if (user != null) {
                List<BalanceLogs> balanceLogs=balanceLogsService.getUserBalanceLogs(user.getId());
                List<Order> orders=orderService.getOrdersByUserId(user.getId());
                req.setAttribute("balanceLogs", balanceLogs);
                req.setAttribute("orders", orders);
                req.getRequestDispatcher("userDashboard.jsp").forward(req, resp);
            }else {
                resp.sendRedirect(getServletContext().getContextPath() + "/login.jsp");
            }

        }else {
            resp.sendRedirect(getServletContext().getContextPath() + "/login.jsp");
        }

    }

}
