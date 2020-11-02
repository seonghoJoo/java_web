package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.do")
public class Login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("password");
		
		System.out.println("id: " + id + " pwd : " + pwd);
		
		/*
		 * 	원래는 데이터베이스와 연동하여 
		 * 	실제 그 아이디에 그 패스워드가 있는 경우에만 
		 * 	로그인 가능
		 * 
		 * */
		
		if(id.equals("test") && pwd.equals("1234")) {
			HttpSession session = req.getSession();
			
			//세션에 loginUser를 세팅
			session.setAttribute("loginUser", "테스터");
			
		}//if end
		
		//index.jsp로 리다이렉트
		resp.sendRedirect("/index.jsp");
	}
	
}
