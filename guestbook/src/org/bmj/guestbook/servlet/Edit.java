package org.bmj.guestbook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bmj.guestbook.dao.GuestbookDAO;
import org.bmj.guestbook.vo.Guest;

@WebServlet("/edit.guest")
public class Edit extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		System.out.println("POST /edit.guest" + req.getParameter("no"));
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		String emotionStr = req.getParameter("emotion");
		String writer = req.getParameter("writer");
		String contents = req.getParameter("contents");
		char emotion = emotionStr.charAt(0);
		String ip = req.getRemoteAddr();
		System.out.println(no+ " / " + emotion + " / " + writer + " / " + contents);
		Guest guest = new Guest(no,emotion, writer, contents, ip);
		
		int result = GuestbookDAO.update(guest);
		
		
		resp.sendRedirect("/index.jsp");
		
	}//doPost() end
}//Write end
