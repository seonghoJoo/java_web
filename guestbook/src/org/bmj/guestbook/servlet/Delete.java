package org.bmj.guestbook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bmj.guestbook.dao.GuestbookDAO;

@WebServlet("/delete.guest")
public class Delete extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("GET /delete.guest" + req.getParameter("no"));
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		int result = GuestbookDAO.delete(no);
		System.out.println("POST /delete.guest GuestbookDAO.delete(no)"+result + "개 delete 되었습니다.");
		
		resp.sendRedirect("/index.jsp");
	}
}
