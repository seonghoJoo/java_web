package com.bmj.model1.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.model1.dao.MembersDAO;
import com.bmj.model1.vo.Member;

@WebServlet("/login.bmj")
public class Login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션 얻기
		HttpSession session = req.getSession();
		
		//넘어온 파라미터 얻기
		String id = req.getParameter("id");
		
		String password = req.getParameter("password");
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		
		Member loginMember = MembersDAO.selectLogin(member);
		
		
		if(loginMember!=null) {
			session.setAttribute(Member.LOGIN,loginMember);
		}else {
			session.setAttribute("msg", "아이디나 비밀번호가 틀렸습니다.");
		}//if~else end
		
		//request의 header에 존재하는 referer로
		//리다이렉트
		String referer = 
				req.getHeader("referer");
		
		System.out.println(referer);
		
		resp.sendRedirect(referer);
		
	}
	

}
