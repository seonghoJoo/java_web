package com.bmj.model1.servlet.ajax;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.model1.dao.RepliesDAO;
import com.bmj.model1.vo.Member;
import com.bmj.model1.vo.Reply;



@WebServlet("/ajax/writeReply.json")
public class WriteReply extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		String noStr = request.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		String contents = request.getParameter("contents");
				
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		int memberNo =loginMember.getNo(); 

		Reply reply = new Reply(memberNo,no,contents);

		int result = RepliesDAO.insert(reply);

		System.out.println((result==1));
				
		out.print("{\"result\":"+(result==1)+"}");
		
	}

}
