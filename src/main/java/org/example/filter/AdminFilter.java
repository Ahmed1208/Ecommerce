package org.example.filter;


import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        //before filter
        HttpServletRequest req = (HttpServletRequest) request;

        HttpSession httpSession = (HttpSession) req.getSession(false);

        if (httpSession != null && "Admin".equals(httpSession.getAttribute("role")))
        {
            chain.doFilter(request,response);
            System.out.println(request.getAttribute("giftToFilter"));
            System.out.println("*********** back to response from the filter ************");
//            return;          //if the servlet contains sednRedirect()
        }

        request.setAttribute("errorMessage", "Error, sign-in first, bro");
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }

}
