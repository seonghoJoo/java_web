package com.doogwal.coffee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/createCrew.do")
public class CreateCrew extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String categoryNoStr = req.getParameter("category_no");
		int categoryNo = Integer.parseInt(categoryNoStr);
		String name = req.getParameter("name");
		String coverImg = req.getParameter("cover_img");
		String intro = req.getParameter("intro");
		String olderYearStr = req.getParameter("olderYear");
		String youngerYearStr = req.getParameter("youngerYear");
		String maxPopStr = req.getParameter("max_pop");
		
		
		
	}
	
}
