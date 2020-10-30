package com.bmj.phonebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.phonebook.dao.PhonebookDAO;

@WebServlet("/delete.bmj")
public class Delete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터를 얻기
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		int result = PhonebookDAO.delete(no);
		
		resp.sendRedirect("/index.jsp");
		
	}
}