package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 상속을 해야 Servlet으로 인정가능함
// LifeCycleServlet 주소 맵핑을 어디서 하냐? 
public class LifeCycleServlet extends HttpServlet {
	
	public LifeCycleServlet() {
		System.out.println("LifeCycleServlet() 생성자 호출 태어남");
	}
	@Override
	public void init() throws ServletException {
		System.out.println("init() 서비스 준비중");
	}
	
	//doPost doGet 전에 service라는 메소드가 호출됨
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String ip = req.getRemoteAddr();
		System.out.println(ip);
		//get 방식이면 doGet
		//post 방식이면 doPost
		System.out.println("service() 메소드 호출 service -> html 만들어");
		
		//test/html 이라고 하면 다운로드가 됨
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html lang='ko' />");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title>라이프</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>서블릿의 인생</h1>");
		out.println("</body>");
		out.println("</html>");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy() 죽었어");
	}
	
	
}//LifeCycleServlet end
