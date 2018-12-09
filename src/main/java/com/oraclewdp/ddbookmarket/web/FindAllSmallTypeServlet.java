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

import com.oraclewdp.ddbookmarket.biz.SmallTypeBiz;
import com.oraclewdp.ddbookmarket.biz.impl.SmallTypeBizImpl;
import com.oraclewdp.ddbookmarket.model.SmallType;

/**
 * Servlet implementation class FindAllSmallTypeServlet
 */
@WebServlet(value = "/findAllSmallType",name = "FindAllSmallTypeServlet")
public class FindAllSmallTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindAllSmallTypeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1获取大类id
		String strBid = request.getParameter("bid");
		int bid = Integer.parseInt(strBid);
		String callBack = request.getParameter("callback");
		//
		SmallTypeBiz smallTypeBiz = new SmallTypeBizImpl();
		List<SmallType> ls = smallTypeBiz.findAllByBid(bid);
		// js
		// 1.1 告诉客户端发送是Js
		response.setContentType("text/javascript;charset=UTF-8");
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = new JSONArray(ls);
		// 服务器返回的js调用客户端的某个，用JSON格式填充
		// jsonp
		out.println(callBack + "(" + jsonArray.toString() + ")");
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
