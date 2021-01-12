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
		
		String[] mtpQuests = req.getParameterValues("mtp_quest");
		String[] mtpAnswers = req.getParameterValues("mtp_answer");
		String[] subQuests = req.getParameterValues("subj_quest");
		String[] subAnswers = req.getParameterValues("subj_answer");
		String[] fileQuests = req.getParameterValues("file_quest");
		
		if(mtpQuests!=null) {
			for(String mtpQuest:mtpQuests)
			{
				System.out.println(mtpQuest);
			}
		}
		if(mtpAnswers!=null) {
		for(String mtpQuest:mtpAnswers)
			{
				System.out.println(mtpQuest);
			}
		}
		if(subQuests!=null) {
			for(String mtpQuest:subQuests)
			{
				System.out.println(mtpQuest);
			}
		}
		if(subAnswers!=null) {
		for(String mtpQuest:subAnswers)
			{
				System.out.println(mtpQuest);
			}
		}
		if(fileQuests!=null) {
			for(String mtpQuest:fileQuests)
			{
				System.out.println(mtpQuest);
			}
		}
		
		User user = UsersDAO.selectUserOne(userNo); 
		Date d=new Date();  
        int year=d.getYear();  
        System.out.println(year);
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
		System.out.println("result: "+  resultCrew);
		// 크루 번호 얻기
		int crewNo = CrewsDAO.selectCrewByName(name);
		// 크루 삽입
		CrewMember crewMember = new CrewMember(crewNo, userNo, 0, 'C', 'A', "default.jpg",null);
		
		
		// 질문과 정답 얻기
		System.out.println(crewMember.getNo());
		
		
		
		String url = "/crewDetail.jsp?no="+no;
		
	}
	
}
