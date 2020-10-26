package com.bmj.phonebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.phonebook.dao.PhonebookDAO;

@WebServlet("/delete.bmj")
public class DeleteServlet extends HttpServlet{
//no=<%=phone.getNo(
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		int result = PhonebookDAO.delete(no);
		
		System.out.println("GET /delete.bmj  Phonebook.update(phone)"+result + "개 update 되었습니다.");
		resp.sendRedirect("/index.jsp");
	}
	
}
