package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Admin;
import org.example.entity.Order;
import org.example.entity.User;
import org.example.service.OrderService;

import java.io.IOException;
import java.util.Optional;
@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManagerFactory entityManagerFactory= (EntityManagerFactory) request.getServletContext().getAttribute("emf");
        OrderService orderService= new OrderService(entityManagerFactory.createEntityManager());
        User user= (User) request.getSession().getAttribute("user");
        Admin admin= (Admin) request.getSession().getAttribute("admin");
        if (user==null&& admin==null){
            response.sendRedirect("/ecommerce/profile");
            return;
        }
        String orderIdParam = request.getParameter("orderid");
        String action = request.getParameter("action");
        // Check if orderIdParam is not null or empty
        if (orderIdParam == null || orderIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid order ID");
            return;
        }

        try {
            // Convert orderIdParam to an integer (assuming it's a valid integer)
            int orderId = Integer.parseInt(orderIdParam);
            if (action == null) {
                // Fetch the order details using the orderId (you may need to use a service or DAO here)
                Optional<Order> order=orderService.getOrderById(orderId);
                // Check if the order exists
                if (!order.isPresent()) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
                    return;
                }
                // Set the order in the request scope
                request.setAttribute("order", order.get());
                request.setAttribute("products", order.get().getOrderProductList());

                // Forward to the JSP page to display order details
                RequestDispatcher dispatcher = request.getRequestDispatcher("orderDetails.jsp");
                dispatcher.forward(request, response);
            }else{
                if (action.equals("cancel")) {
                    Optional<Order> order = orderService.cancelOrder(orderId);
                    request.setAttribute("order", order.get());
                    request.setAttribute("products", order.get().getOrderProductList());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("orderDetails.jsp");
                    dispatcher.forward(request, response);
                }
                if (action.equals("approve")) {
                    Optional<Order> order = orderService.approveOrder(orderId);
                    request.setAttribute("order", order.get());
                    request.setAttribute("products", order.get().getOrderProductList());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("orderDetails.jsp");
                    dispatcher.forward(request, response);
                }
            }



        } catch (NumberFormatException e) {
            // Handle the case where orderId is not a valid integer
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID format");
        }

    }
}
