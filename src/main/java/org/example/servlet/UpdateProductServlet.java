package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bean.ProductBean;
import org.example.dao.ProductDao;
import org.example.entity.Category;
import org.example.entity.Product;
import org.example.mapper.ProductMapper;
import org.example.service.CartService;
import org.example.service.CategoryService;
import org.example.service.ProductService;

import java.io.IOException;
import java.util.List;

public class UpdateProductServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {

        // Retrieve parameters from the URL
        String productId = request.getParameter("productid");
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String categoryName = request.getParameter("categoryname");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        // Set parameters as attributes to be used in the JSP
        request.setAttribute("productid", productId);
        request.setAttribute("productName", productName);
        request.setAttribute("description", description);
        request.setAttribute("categoryname", categoryName);
        request.setAttribute("price", price);
        request.setAttribute("quantity", quantity);


        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");
        CategoryService categoryService = new CategoryService(emf.createEntityManager());
        request.setAttribute("ParentCategories", categoryService.getParentCategories());

        // Forward request to JSP
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf = (EntityManagerFactory) request.getServletContext().getAttribute("emf");

        // Retrieve form parameters
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String categoryName = request.getParameter("subCategories");
        System.out.println("Product Name: " + productName);
        System.out.println("Description: " + description);
        System.out.println("Category Name: " + categoryName);


        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Product ID: " + id);
        System.out.println("Quantity: " + quantity);
        System.out.println("Price: " + price);

        // Process the parameters as needed (e.g., update the product in the database)

        // Example: Print parameters (for debugging purposes)



        ProductService productService= new ProductService( emf.createEntityManager());
        productService.updateProduct(id,productName,description,quantity,price,categoryName);
        response.sendRedirect("/ecommerce/admin-products");



        }


    }



