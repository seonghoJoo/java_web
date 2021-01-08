package com.bmj.model1.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.model1.dao.BoardDAO;
import com.bmj.model1.dao.LikesDAO;
import com.bmj.model1.dao.RepliesDAO;

@WebServlet(value="/delete.bmj")
public class DeleteArticle extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));

		RepliesDAO.deleteByArticleNo(no);
		
		LikesDAO.deleteByArticleNo(no);
		
		int result = BoardDAO.delete(no);
		
		String referer = request.getHeader("referer");

		String url = "/index.jsp?page=1";

		if(referer!=null) {
			url = referer;
		}//if end

		response.sendRedirect(url);
		
	}

}
