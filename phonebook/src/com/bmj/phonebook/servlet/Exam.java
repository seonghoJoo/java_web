package com.bmj.phonebook.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello.bmj")
public class Exam extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//mime 타입 클라이언트에게 
		//주타입/부타입
		// 주타입 text , image, audio...
		// 부타입 확장자명
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out =  resp.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>헬로 서블릿!</title>");
		out.println("</head>");
		
		out.println("<body>");
		out.println("<h1> 안녕하세요? </h1>");
		out.println("<a href='/index.jsp' >인덱스로</a>");
		out.println("</body>");
		
		out.println("</html>");
		
		
	}
	
	
}
