package com.oraclewdp.ddbookmarket.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AuthorFilter",urlPatterns = "/*")
public class AuthorFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request= (HttpServletRequest) req;
        HttpServletResponse response= (HttpServletResponse) resp;
        System.out.println(request.getRequestURI());
        //看到表单页面，给提交登录表单的机会
        if (request.getRequestURI().endsWith("/login.jsp")||request.getRequestURI().contains("/bower_components/")||request.getRequestURI().endsWith("/login")||request.getRequestURI().endsWith("/vcode.png")){
            chain.doFilter(req,resp);
            return;
        }
        //判断是否认证过
        if (request.getSession().getAttribute("hasLogined")==null||!(Boolean) request.getSession().getAttribute("hasLogined")){
            response.sendRedirect("login.jsp");
            return;
        }
        //其它情况就是合法用户
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
