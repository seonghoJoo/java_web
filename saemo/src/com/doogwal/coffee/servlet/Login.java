package com.doogwal.coffee.servlet;

import java.util.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doogwal.coffee.dao.CrewMembersDAO;
import com.doogwal.coffee.dao.CrewsDAO;
import com.doogwal.coffee.dao.UsersDAO;
import com.doogwal.coffee.vo.Crew;
import com.doogwal.coffee.vo.CrewMember;
import com.doogwal.coffee.vo.User;


@WebServlet("/login.do")
public class Login extends HttpServlet {
	// .do
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
				
		//우선 세션 얻고
		HttpSession session = req.getSession();
		
		//아이디와 비밀번호 받기
		String id = req.getParameter("loginId");
		String password = req.getParameter("loginPassword");
		
		System.out.println(id);
		System.out.println(password);
		
		//유저 객체 생성
		User user = new User();
		user.setEmail(id);
		user.setPassword(password);
		
		//유저가 맞는지 확인
		User loginUser = UsersDAO.selectLogin(user);
		
		// 유저의 진행중인 crew 가져오기
		List<Crew> ownCrewList = CrewsDAO.selectOwnList(loginUser.getNo());
		System.out.println("onwCrewList 사이즈:" + ownCrewList.size());	
		if(loginUser!=null) {
			session.setAttribute(User.LOGIN, loginUser);
			int idx=0;
			if(ownCrewList !=null) {
				for(Crew crew: ownCrewList) {
					session.setAttribute("userCrewList"+ (idx++), crew);
				}
			}
			System.out.println("성공");
			resp.sendRedirect("/index.jsp");
		}else {
			session.setAttribute("fail", "true");
			System.out.println("실패");
			resp.sendRedirect("/loginForm.jsp");
		}//if~else end
	}

	
}