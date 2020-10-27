package com.bmj.mms.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.MoviesDAO;
import com.bmj.mms.util.ResizeImageUtil;
import com.bmj.mms.vo.Movie;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			
			ServletContext application = req.getServletContext();
			
			// 루트 경로 servlet Context -> 웹서비스 그 자체를 의미 application 내장 객체
			String root = application.getRealPath("/");
			
			// 업로드(원본) 경로
			String uploadPath = root + "upload";
			
			// profile 폴더 경로
			String posterPath = root + "poster";
			
			// MultipartRequest 객체 생성(파일 업로드)
			MultipartRequest mr = new MultipartRequest(req,uploadPath,1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
			
			// 실제 파일명 얻기
			String poster = mr.getFilesystemName("poster");
			
			String source = uploadPath + File.separator+poster;
			String target = posterPath + File.separator+poster;
			
			// 이미지를 리사이즈
			ResizeImageUtil.resize(source,target, 160,234);
			
			// req.setCharacterEncoding("UTF-8");
			
			// 파라미터 얻기
			String name = mr.getParameter("name");
			String director = mr.getParameter("director");
			String audienceNumStr = mr.getParameter("audienceNum");
			String genreStr = mr.getParameter("genre");
			String year = mr.getParameter("year");
			String month = mr.getParameter("month");
			String date = mr.getParameter("date");
			String endDateStr = mr.getParameter("endDate");
			
			
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
			movie.setPosterImage(poster);
			
			
			//입력
			int result = MoviesDAO.insert(movie);
			System.out.println(result+ "개 입력됬습니다.");
			
			// 리다이렉트
			resp.sendRedirect("/movie.jsp?no="+movie.getNo());
		}
	
}
