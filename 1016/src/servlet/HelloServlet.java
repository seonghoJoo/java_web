package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 응답 컨텐츠 설정
		// content-type response로 오지 않음
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>huhu</title>");
		out.println("</head>");
		
		out.println("<body>");
		out.println("<h1> 성호의멋진 웹서비스</h1>");
		out.println("<img src='img/a.gif'/>");
		out.println("</body>");
		
		out.println("</html>");
	}

	
	
	/*
	 * 		Server Applet 의 줄임말
	 * 		Applet은 클라이언트에서 작동함(플래쉬 같이)
	 * 		(서버프로그램)
	 * 
	 * 		- HttpServlet을 상속받으면 됨
	 * 
	 * 		Servlet은 자바에 html을 삽입
	 * 		JSP html에 자바코드를 삽입
	 */
	
	
	
	
}
