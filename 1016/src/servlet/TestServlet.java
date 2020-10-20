package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
				out.println("<h1>주성호의 웹서비스</h1>");
				out.println("<h1> 안녕하세요? 테스트 페이지 입니다.</h1>");
				out.println("</body>");
				
				out.println("</html>");
	}
	
}
