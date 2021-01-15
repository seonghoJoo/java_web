package com.doogwal.coffee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doogwal.coffee.dao.BoardDAO;
import com.doogwal.coffee.vo.Article;
import com.doogwal.coffee.vo.Member;

@WebServlet("/write.bmj")
public class Write extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//title, contents 파라미터가 넘어옴
		
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");

		HttpSession session = req.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		int memberNo = loginMember.getNo();
		Article article = new Article(memberNo, title, contents);
		
		int result = BoardDAO.insert(article);
		
		if(result==1) {
			System.out.println("입력 했다~!");
		}
		else {
			System.out.println("실패했다");
		}
		
		resp.sendRedirect("/index.jsp");
	}
}
