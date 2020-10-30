package com.bmj.mms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.mms.dao.MoviesDAO;
import com.bmj.mms.vo.Movie;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/getMovies.mms")
public class GetMovies extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//json 뷰
		resp.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		List<Movie> movies = MoviesDAO.selectList();
		
		//ObjectMapper 객체
		// 우리가 객체를 만들면 라이브러리 프레임워크는 그냥 있음
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(movies);
		
		out.println(json);
	}
}
