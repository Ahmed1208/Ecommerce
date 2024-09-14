package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.entity.Order;
import org.example.entity.PAYMENT;
import org.example.entity.Product;
import org.example.entity.STATUS;
import org.example.service.AdminService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public class OrdersServletAPI extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession httpSession = request.getSession(false);
//        if (httpSession == null || httpSession.getAttribute("role") == null) {
//            request.setAttribute("errorMessage", "Error, sign-in first, bro");
//            request.getRequestDispatcher("/login.jsp").forward(request, response);
//        } else {

        int pageNumber = 1;
        int pageSize = 10;

        String pageNum = request.getParameter("pageNumber");
        if(pageNum != null && !pageNum.isEmpty())
            pageNumber = Integer.parseInt(pageNum);

        // Retrieve min and max price
        Double minPrice = null;
        Double maxPrice = null;

        String minPriceParam = request.getParameter("minPrice");
        if (minPriceParam != null && !minPriceParam.isEmpty()) {
            minPrice = Double.parseDouble(minPriceParam);
        }

        String maxPriceParam = request.getParameter("maxPrice");
        if (maxPriceParam != null && !maxPriceParam.isEmpty()) {
            maxPrice = Double.parseDouble(maxPriceParam);
        }


        // Retrieve sortByPrice flags
        boolean sortByPrice = false;
        String sortByPriceParam = request.getParameter("sortByPrice");

        if (sortByPriceParam != null) {
            sortByPrice = Boolean.parseBoolean(sortByPriceParam);  // Defaults to false if parsing fails
        }

        // Retrieve payment flags
        PAYMENT payment = null;
        String pay = request.getParameter("payment");

        if (pay != null && !pay.isEmpty()) {
            payment = PAYMENT.valueOf(pay);  // Defaults to false if parsing fails
        }

        // Retrieve status flags
        STATUS status = null;
        String sta = request.getParameter("status");

        if (sta != null && !sta.isEmpty()) {
            status = STATUS.valueOf(sta);  // Defaults to false if parsing fails
        }


            EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

            AdminService adminService = new AdminService(emf.createEntityManager());

            try {
                // Call the service method, which returns a Map<Integer, List<Product>>
                Map<Integer, List<Order>> ordersMap = adminService.getOrders(pageNumber,pageSize,minPrice,maxPrice,sortByPrice,payment,status);

                // Extract the total product count (key) and the paginated list of products (value)
                int totalProductCount = ordersMap.keySet().iterator().next(); // This gives you the total number of products
                List<Order> orders = ordersMap.get(totalProductCount);   // This gives you the list of products for the current page

                long totalOrders = totalProductCount;
                int totalPages = (int) Math.ceil((double) totalOrders / pageSize);

                request.setAttribute("orders", orders);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageNumber);


                request.getRequestDispatcher("/ordersDashboard.jsp").forward(request,response);

            } catch (Exception e) {
                request.setAttribute("errorMessage", "Error," + e.getMessage());
                request.getRequestDispatcher("/ordersDashboard.jsp").forward(request, response);
            }

        }


//    }
}
