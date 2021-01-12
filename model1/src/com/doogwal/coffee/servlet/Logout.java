package com.doogwal.coffee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("logout.bmj")
public class Logout extends HttpServlet{

	//a 요소 클릭은 doGet
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 세션 얻어옴
		HttpSession session = req.getSession();
		
		// 세션 비활성화
		session.invalidate();
		
		// 페이지 이동
		resp.sendRedirect("/index.jsp");
	}
}
