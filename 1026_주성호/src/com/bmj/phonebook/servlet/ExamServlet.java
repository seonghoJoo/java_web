package com.bmj.phonebook.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ExamServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("ExamServelet doGet ");
			// 응답 컨텐츠 설정
			// content-type response로 오지 않음
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html lang='ko'>");
			
			out.println("<head>");
			out.println("<meta charset='UTF-8'>");
			out.println("<title>헬로 서블릿</title>");
			out.println("</head>");
			
			out.println("<body>");
			out.println("<h2> 안녕하세요?</h2>");
			out.println("<a href='/index.jsp'>메인페이지로</a>");
			out.println("</body>");
			
			out.println("</html>");
			System.out.println("ExamServelet doGet ");
	}	
	
}
