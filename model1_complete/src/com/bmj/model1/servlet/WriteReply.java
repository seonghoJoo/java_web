package com.bmj.model1.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.model1.dao.RepliesDAO;
import com.bmj.model1.vo.Member;
import com.bmj.model1.vo.Reply;

@WebServlet("/writeReply.bmj")
public class WriteReply extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션
		HttpSession session = req.getSession();
		
		Member loginMember = 
				(Member)session.getAttribute(Member.LOGIN);
		
		int memberNo = loginMember.getNo();
		
		String boardNoStr = 
				req.getParameter("boardNo");
		
		int boardNo = Integer.valueOf(boardNoStr);
		
		String contents = 
				req.getParameter("contents");
		
		Reply reply = 
				new Reply(memberNo,boardNo,contents);
		
		int result = RepliesDAO.insert(reply);
		
		System.out.println(result);
		
		resp.sendRedirect("/article.jsp?no="+boardNo);
		
	}
	
	
}
