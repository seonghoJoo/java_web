package org.bmj.guestbook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit.guest")
public class Edit extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		System.out.println("GET /edit.guest" + req.getParameter("no"));
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		
		resp.sendRedirect("/index.jsp");
		
	}//doPost() end
}//Write end
