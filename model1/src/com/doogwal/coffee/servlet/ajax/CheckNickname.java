package com.doogwal.coffee.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.MembersDAO;


@WebServlet(value="/ajax/checkNickname.json")
public class CheckNickname extends HttpServlet{
	
	//jsp 입장에서 값을 얻어온다면 get방식이 맞음
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 넘어온 파라미터 id를 얻음
		String nickname = req.getParameter("nickname");

		// Content-Type 지정
		// 응답 content type을 지정
		resp.setContentType("application/json; charset=UTF-8");
		//out.print("크크크크킄"); -> parsererror 파싱에러
		// 핸드폰이에요 하면서 물병을 준거임... 
		PrintWriter out = resp.getWriter();
		
		int cnt = MembersDAO.selectNicknameCheck(nickname);
		
		
		out.print("{\"result\":"+cnt+"}");
		
	}
}
