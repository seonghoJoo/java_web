package com.bmj.phonebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.phonebook.dao.MembersDAO;
import com.bmj.phonebook.vo.Member;


@WebServlet("/login.bmj")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//넘어온 파라미터 얻기
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		
		Member member = new Member(id,password);
		
		Member loginMember = MembersDAO.selectLogin(member);
		
		// 세션객체 얻기
		HttpSession session = req.getSession();
		if(loginMember == null) {
			session.setAttribute("msg", "아이디나 비밀번호가 틀렸습니다.");
			resp.sendRedirect("/index.jsp");
		}else {
			// 세션객체에 속성 세팅
			session.setAttribute("loginMember", loginMember);
		
			// index로 리다이렉트
			resp.sendRedirect("/main.jsp");
		}
	}
}
