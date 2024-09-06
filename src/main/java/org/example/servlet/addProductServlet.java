package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Product;
import org.example.entity.User;
import org.example.service.ProductService;
import org.example.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;

public class addProductServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf=(EntityManagerFactory) request.getServletContext().getAttribute("emf");
        ProductService prductService=new ProductService(emf.createEntityManager());
        request.setAttribute("subCategories",prductService.getSubCategories());
        request.getRequestDispatcher("addProduct.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = (Product) request.getAttribute("productBean");

        EntityManagerFactory emf=(EntityManagerFactory) request.getServletContext().getAttribute("emf");
        ProductService prductService=new ProductService(emf.createEntityManager());


        prductService.addNewProduct(product);

       // User u=  userService.registerNewUser(name, email, password, street, city, country, phone, dob, gender);

    }


}
