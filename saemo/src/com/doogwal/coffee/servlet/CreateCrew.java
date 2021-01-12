package com.doogwal.coffee.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.CrewsDAO;
import com.doogwal.coffee.dao.UsersDAO;
import com.doogwal.coffee.vo.Crew;
import com.doogwal.coffee.vo.CrewMember;
import com.doogwal.coffee.vo.User;

@WebServlet("/createCrew.do")
public class CreateCrew extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name = req.getParameter("name");
		String coverImg = req.getParameter("cover_img");
		String intro = req.getParameter("intro");
		
		String userNoStr = req.getParameter("userNo");
		String categoryNoStr = req.getParameter("category_no");
		String olderYearStr = req.getParameter("olderYear");
		String youngerYearStr = req.getParameter("youngerYear");
		String maxPopStr = req.getParameter("max_pop");
		int userNo = Integer.parseInt(userNoStr);
		int categoryNo = Integer.parseInt(categoryNoStr);
		int minAge = Integer.parseInt(olderYearStr);
		int maxAge = Integer.parseInt(youngerYearStr);
		int maxPop = Integer.parseInt(maxPopStr);
		
		String[] mtpQuest = req.getParameterValues("mtp_quest");
		String[] mtpAnswer = req.getParameterValues("mtp_answer");
		String[] subQuest = req.getParameterValues("subj_quest");
		String[] subAnswer = req.getParameterValues("subj_answer");
		String[] fileQuest = req.getParameterValues("file_quest");
		
		User user = UsersDAO.selectUserOne(userNo); 
		Date d=new Date();  
        int year=d.getYear();  
        int age=year+1900-user.getBirthYear();  
		char gender = user.getGender();
		
		int no=1;
		Crew crew;
		if(gender=='f' || gender=='F') {
			crew = new Crew(minAge, maxAge, maxPop,1, categoryNo, 30000, age, 0, name, coverImg, intro);
		}else {
			crew = new Crew(minAge, maxAge, maxPop,1, categoryNo, 30000, age, 1, name, coverImg, intro);
		}
		int resultCrew = CrewsDAO.insertCrew(crew);
		
		
		CrewMember crewMember = new CrewMember(crewNo, userNo, 0, 'C', 'A', "default.jpg",null) 
		
		
		String url = "/crewDetail.jsp?no="+no;
		
	}
	
}
