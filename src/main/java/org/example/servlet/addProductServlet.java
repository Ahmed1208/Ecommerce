package org.example.servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.example.bean.ProductBean;
import org.example.entity.Product;
import org.example.mapper.ProductMapper;
import org.example.service.ProductService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig
public class addProductServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

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
//        ProductBean productbean = (ProductBean) request.getAttribute("productBean");
//
//        EntityManagerFactory emf=(EntityManagerFactory) request.getServletContext().getAttribute("emf");
//        ProductService prductService=new ProductService(emf.createEntityManager());
//
//        prductService.addNewProduct(productbean);

        Product product = (Product) request.getAttribute("productBean");

        EntityManagerFactory emf=(EntityManagerFactory) request.getServletContext().getAttribute("emf");
        ProductService prductService=new ProductService(emf.createEntityManager());

        prductService.addNewProduct(product);

        response.sendRedirect("/ecommerce/show-product?id="+product.getId());
    }

}
