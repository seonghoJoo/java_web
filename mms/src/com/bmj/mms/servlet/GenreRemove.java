package com.bmj.mms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.GenresDAO;
import com.bmj.mms.vo.Genre;

// 주소와 servlet간 맵핑이 끝남 더이상 web.xml은 안써도 됨
@WebServlet("/genreRemove.mms")
public class GenreRemove extends HttpServlet{
	
	// get 방식 차용
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// 파라미터 받기
		String noStr = req.getParameter("no");
		
		// 형변환 하기
		int no = Integer.parseInt(noStr);
		
		// delete 구문 수행
		int result = GenresDAO.delete(no);
		System.out.println(result+"개 삭제");
		// /genres.jsp로 리다이렉트
		resp.sendRedirect("/genres.jsp");
	}
	
}
