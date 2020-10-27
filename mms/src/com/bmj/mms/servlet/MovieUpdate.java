package com.bmj.mms.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.MoviesDAO;
import com.bmj.mms.vo.Movie;

@WebServlet("/movieUpdate.mms")
public class MovieUpdate extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 한글깨짐
		// req.setCharacterEncoding("UTF-8");
		
		//파라미터 얻기
		String noStr = req.getParameter("no");
		String name = req.getParameter("name");
		String director = req.getParameter("director");
		String audienceNumStr = req.getParameter("audienceNum");
		String genreStr = req.getParameter("genre");
		String yearRelease = req.getParameter("yearRelease");
		String monthRelease = req.getParameter("monthRelease");
		String dateRelease = req.getParameter("dateRelease");
		String endDateStr = req.getParameter("endDate");
		System.out.println("end : "+endDateStr);
		
		//형변환
		int no = Integer.parseInt(noStr);
		int audienceNum = Integer.parseInt(audienceNumStr);
		int genre = Integer.parseInt(genreStr);
		Date releaseDate = Date.valueOf(yearRelease+"-"+monthRelease+"-"+dateRelease);
		Date endDate = null;
		if(endDateStr!=null) {
			endDate = Date.valueOf(endDateStr);
		}
		Movie movie = new Movie(no,audienceNum,genre,name,director,releaseDate,endDate);
		
		//update 구문 실행
		int result = MoviesDAO.update(movie);
		System.out.println(result+"개 업데이트 완료!!@@!");
		// 리다이렉트
		resp.sendRedirect("/movie.jsp?no="+no);
	}
}
