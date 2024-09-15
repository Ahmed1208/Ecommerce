package org.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;
@WebFilter(urlPatterns = "/home.jsp")
public class HomeFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        request.getRequestDispatcher("/all-products").include(request, response);
        chain.doFilter(request, response);
    }
}
