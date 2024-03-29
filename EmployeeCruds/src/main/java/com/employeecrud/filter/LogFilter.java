package com.employeecrud.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class LogFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        System.out.println("LogFilter: Request received at " + System.currentTimeMillis());
        chain.doFilter(request, response);
        System.out.println("LogFilter: Response sent at " + System.currentTimeMillis());
    }
    @Override
    public void destroy() {
    }
}