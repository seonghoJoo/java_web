package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class Logout extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//HttpSession 객체 얻어옴
		HttpSession  session = req.getSession();
		
		// session 만료
		session.invalidate();
		
		// index.jsp 리다이렉트
		resp.sendRedirect("/index.jsp");
	
	}
}
