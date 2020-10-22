package com.bmj.mms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.MoviesDAO;
import com.bmj.mms.vo.Movie;

@WebServlet("/movieRegister.mms")
public class MovieRegister extends HttpServlet{

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("while(true){alert('잘못된접근')}");
			out.println("</script>");
			
		}
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// post 방식의 한글처리
			req.setCharacterEncoding("UTF-8");
			
			// 파라미터 얻기
			String name = req.getParameter("name");
			String director = req.getParameter("director");
			String audienceNumStr = req.getParameter("audienceNum");
			String genreStr = req.getParameter("genre");
			String year = req.getParameter("year");
			String month = req.getParameter("month");
			String date = req.getParameter("date");
			String endDateStr = req.getParameter("endDate");
			
			System.out.println(audienceNumStr + " / " + year + month+ date + " genre: " + genreStr);
			// 형변환
			int audienceNum = Integer.parseInt(audienceNumStr);
			int genre = Integer.parseInt(genreStr);
			Date releaseDate = Date.valueOf(year+"-"+month+"-"+date);
			
			// 고오오급 예외처리
			Date endDate = null;
			try {
				endDate = Date.valueOf(endDateStr);
			}catch(Exception e) {
				
			}
			
			Movie movie = new Movie();
			movie.setAudienceNum(audienceNum);
			movie.setGenre(genre);
			movie.setName(name);
			movie.setDirector(director);
			movie.setReleaseDate(releaseDate);
			movie.setEndDate(endDate);
			
			//입력
			int result = MoviesDAO.insert(movie);
			System.out.println(result+ "개 입력됬습니다.");
			
			// 리다이렉트
			resp.sendRedirect("/movie.jsp?no="+movie.getNo());
		}
	
}
