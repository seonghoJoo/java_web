package com.bmj.model1.servlet.ajax;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.model1.dao.RepliesDAO;


@WebServlet(value="/ajax/deleteReply.json")
public class DeleteReply extends HttpServlet{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 593134480785154478L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println(no);
		
		int result = RepliesDAO.delete(no);

		System.out.println((result==1));
		
		out.print("{\"result\":"+(result==1)+"}");
		
	}

}
