package com.bmj.phonebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.phonebook.dao.IPDAO;
import com.bmj.phonebook.vo.IP;


@WebServlet("/ipIncrease.bmj")
public class IPIncrease extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			//현업에서 사용하는 방법 log찍기
			System.out.println("GERT /ipIncrease.do");

			// 2.5) ip 얻기
			String ip = req.getRemoteAddr();
			
			// 4) insert 수행
			int result = IPDAO.insert(ip);
			System.out.println("POST /ipIncrease.do  IPDAO.insert(ip)"+result + "개 insert 되었습니다.");
			// 5) 리다이렉트 방식 // 포워드 방식 있지만 나중에 설명 
			resp.sendRedirect("/increase.jsp");
	
	}
	
}
