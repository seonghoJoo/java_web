package com.bmj.model1.servlet;




import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.model1.dao.MembersDAO;
import com.bmj.model1.vo.Member;


@WebServlet("/join.bmj")
public class JoinMember extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String password = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		String profile = request.getParameter("profile");

		Date birthDate = Date.valueOf(year+"-"+month+"-"+date);

		Member member = 
		new Member(id,password,nickname,birthDate,profile);

		int result = MembersDAO.insert(member);

		System.out.println(result);

		response.sendRedirect("index.jsp");
	}

}
