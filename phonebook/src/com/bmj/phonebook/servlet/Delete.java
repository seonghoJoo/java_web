package com.bmj.phonebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.phonebook.dao.PhonebookDAO;

@WebServlet("/delete.bmj")
public class Delete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터를 얻기
		String noStr = req.getParameter("no");
		int no = Integer.parseInt(noStr);
		String name = req.getParameter("name");
		
		int result = PhonebookDAO.delete(no);
		if(result == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("msg",name+"님을 전화번호부에서 잘 삭제하였습니다.");
		}
		
		resp.sendRedirect("/index.jsp");
		
	}
}