package com.doogwal.coffee.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doogwal.coffee.dao.MembersDAO;
import com.doogwal.coffee.vo.Member;

// @WebServlet(value="/login.bmj")써도 됨
@WebServlet("/login.bmj")
public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1) 유저가 입력해서 넘어온 id, password 파라미터를 얻음
		String id = req.getParameter("id");
		String pwd = req.getParameter("password");
		//System.out.println(id+" / " + pwd); 
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(pwd);
		// 2) 
		Member loginMember = MembersDAO.selectLogin(member);
		
		HttpSession session = req.getSession();
		
		session.setAttribute("loginMember", loginMember);
		
		
		// json 뷰
		// 야 이거 html이야 혹은 json이야 알려줌
		// resp.setContentType("application/json");
		
		
		// 응답을 html로 하는것
		// PrintWriter out= resp.getWriter();
		// out.println("{<html><head></head>}");
		
		
		// 
		
	}
}
