package com.bmj.mms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.GenresDAO;
import com.bmj.mms.vo.Genre;

@WebServlet("/genreUpdate.mms")
public class GenreUpdate extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 한글깨짐 방지 doPost 방식
		req.setCharacterEncoding("UTF-8");
		// 파라미터 얻기
		String noStr = req.getParameter("no");
		String name = req.getParameter("name");
		
		// 형 변환
		int no = Integer.parseInt(noStr);
		Genre genre = new Genre();
		genre.setNo(no);
		genre.setName(name);
		
		// 업데이트 실행
		int result = GenresDAO.update(genre);
		
		// 리다이렉트
		resp.sendRedirect("/genres.jsp");
		//http session 에서 배울 수 있다. 그건 로그인 처리에서 배우면 됨
		
	}
}
