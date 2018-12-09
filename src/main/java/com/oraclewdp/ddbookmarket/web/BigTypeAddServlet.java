package com.oraclewdp.ddbookmarket.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oraclewdp.ddbookmarket.biz.BigTypeBiz;
import com.oraclewdp.ddbookmarket.biz.impl.BigTypeBizImpl;


@WebServlet(value="/bigTypeAdd",name = "BigTypeAddServlet")
public class BigTypeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    public BigTypeAddServlet() {
        super();
       
    }	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if (request.getSession().getAttribute("hasLogined")==null||!(Boolean) request.getSession().getAttribute("hasLogined")){
//			response.sendRedirect("login.jsp");
//			return;
//		}
    	//把用户填写大类名存到数据库
		//1.1 获取用户输入值
		String name=request.getParameter("name");
		//2 调用业务层
		BigTypeBiz bigTypeBiz=new BigTypeBizImpl();
		boolean  ret=bigTypeBiz.save(name);
		//3 返回合适的视图
		if (ret) {
			response.sendRedirect("main.jsp");
		} else {
           request.setAttribute("name", name);
           request.getRequestDispatcher("/bigTypeAdd.jsp").forward(request, response);
		}
	}

}
