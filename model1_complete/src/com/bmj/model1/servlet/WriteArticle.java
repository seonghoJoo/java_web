package com.bmj.model1.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.model1.dao.BoardDAO;
import com.bmj.model1.vo.Article;
import com.bmj.model1.vo.Member;

@WebServlet("/write.bmj")
public class WriteArticle extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//title, contents, memberNo
		
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		System.out.println(title);
		System.out.println(contents);
		
		//멤버번호를 session의 
		// loginMember라는
		//attribute에서 얻어옴
		
		//세션얻기
		HttpSession session = 
				req.getSession();
		
		//로그인된 멤버객체 얻기
		Member loginMember = 
				(Member)session.getAttribute(Member.LOGIN);
		
		int memberNo = loginMember.getNo();
		
		System.out.println("memberNo:" + memberNo);
		
		Article article = 
			new Article(memberNo,title,contents); 
//		article.setTitle(title);
//		article.setMemberNo(memberNo);
//		article.setContents(contents);
		
		System.out.println("전:"+article.getNo());
				
		int result = BoardDAO.insert(article);
		
		System.out.println("후:"+article.getNo());
		
		System.out.println(result);
		
		resp.sendRedirect("/article.jsp?no="+article.getNo());
		
	}
	
}
