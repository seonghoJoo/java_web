package org.bmj.guestbook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bmj.guestbook.dao.GuestbookDAO;
import org.bmj.guestbook.vo.Guest;

@WebServlet("/write.guest")
public class Write extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//현업에서 사용하는 방법 log찍기
		System.out.println("POST /write.guest");
		
	
		// 1) POST 방식의 한글처리
		req.setCharacterEncoding("UTF-8");
		
		// 2) 파라미터 얻기
		char emotion = req.getParameter("emotion").charAt(0);
		String writer = req.getParameter("writer");
		String contents = req.getParameter("contents");
		
		// 2.5) ip 얻기
		String ip = req.getRemoteAddr();
		
		// 3) 형변환
		
		// 4) insert 수행
		Guest guest = new Guest(emotion,writer,contents,ip);
		int result = GuestbookDAO.insert(guest);
		System.out.println("POST /write.guest GuestbookDAO.insert(guest)"+result + "개 insert 되었습니다.");
		// 5) 리다이렉트 방식 // 포워드 방식 있지만 나중에 설명 
		resp.sendRedirect("/index.jsp");
		
	}//doPost() end
}//Write end
