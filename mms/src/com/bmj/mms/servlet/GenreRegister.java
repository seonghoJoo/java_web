package com.bmj.mms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.GenresDAO;

@WebServlet("/genreRegister.mms")
public class GenreRegister extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// post 방식의 한글처리
		// req.setCharacterEncoding("UTF-8");
		
		// 파라미터 얻기
		String name = req.getParameter("name");
		
		//입력
		int result = GenresDAO.insert(name);
		System.out.println(result+ "개 입력됬습니다.");
		
		// 리다이렉트
		resp.sendRedirect("/genres.jsp");
		
	}// doPost() end
	
}//GenreRegister end
