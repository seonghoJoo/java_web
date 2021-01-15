package com.doogwal.coffee.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.MembersDAO;
import com.doogwal.coffee.vo.Member;



@WebServlet("/join.bmj")
public class Join extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//한글처리 필터로
		
		String id = req.getParameter("id");
		String password = req.getParameter("pwd");
		
		String profile = req.getParameter("profile");
		String nickname = req.getParameter("nickname");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		
		Date birthDate = 
			Date.valueOf(year+'-'+month+'-'+date);
		
		Member member = 
				new Member(id,
						password, 
						nickname, 
						profile,
						birthDate);
		
		MembersDAO.insert(member);
		
		resp.sendRedirect("/index.jsp");
		
//		System.out.println(id);
//		System.out.println(password);
//		System.out.println(profile);
//		System.out.println(year);
//		System.out.println(month);
//		System.out.println(date);
//		System.out.println(nickname);
		
	}//doPost() end

}
