package com.bmj.model1.servlet.ajax;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.model1.dao.MembersDAO;


@WebServlet(value="/ajax/checkNickname.json")
public class CheckNickname extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String nickname = request.getParameter("nickname");

		//3초후에 응답
		//Thread.sleep(3000);

		int cnt = MembersDAO.selectCheckNickname(nickname);

		out.print("{\"count\":"+cnt+"}");
		
	}

}
