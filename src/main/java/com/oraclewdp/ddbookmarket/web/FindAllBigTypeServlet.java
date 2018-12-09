package com.oraclewdp.ddbookmarket.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.oraclewdp.ddbookmarket.biz.BigTypeBiz;
import com.oraclewdp.ddbookmarket.biz.impl.BigTypeBizImpl;
import com.oraclewdp.ddbookmarket.model.BigType;


@WebServlet(value = "/findAllBigType",name = "FindAllBigTypeServlet")
public class FindAllBigTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FindAllBigTypeServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	//1
		String callBack=request.getParameter("callback");
		//2
		BigTypeBiz bigTypeBiz=new BigTypeBizImpl();
		List<BigType>  ls=bigTypeBiz.findAllBigType();
		//js
		//1.1 告诉客户端发送是Js
		response.setContentType("text/javascript;charset=UTF-8");
		PrintWriter out=response.getWriter();
		JSONArray jsonArray=new JSONArray(ls);
		//服务器返回的js调用客户端的某个，用JSON格式填充
		//jsonp
		out.println(callBack+"("+jsonArray.toString()+")");
		out.flush();
		
	}

}
