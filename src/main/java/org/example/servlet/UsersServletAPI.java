package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Order;
import org.example.entity.PAYMENT;
import org.example.entity.STATUS;
import org.example.entity.User;
import org.example.service.AdminService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public class UsersServletAPI extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int pageNumber = 1;
        int pageSize = 15;

        String pageNum = request.getParameter("pageNumber");
        if(pageNum != null && !pageNum.isEmpty())
            pageNumber = Integer.parseInt(pageNum);
        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        AdminService adminService = new AdminService(emf.createEntityManager());

        try {
            // Call the service method, which returns a Map<Integer, List<Product>>
            Map<Integer, List<User>> usersMap = adminService.getUsers(pageNumber,pageSize);

            // Extract the total product count (key) and the paginated list of products (value)
            int totalProductCount = usersMap.keySet().iterator().next(); // This gives you the total number of products
            List<User> users = usersMap.get(totalProductCount);   // This gives you the list of products for the current page

            long totalUsers = totalProductCount;
            int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

            request.setAttribute("users", users);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", pageNumber);


            request.getRequestDispatcher("/usersDashboard.jsp").forward(request,response);

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error," + e.getMessage());
            request.getRequestDispatcher("/usersDashboard.jsp").forward(request, response);
        }

    }

}
