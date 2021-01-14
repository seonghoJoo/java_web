package com.doogwal.coffee.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.CrewMembersDAO;
import com.doogwal.coffee.dao.CrewsDAO;
import com.doogwal.coffee.dao.MtpQuestsDAO;
import com.doogwal.coffee.dao.QuestionsDAO;
import com.doogwal.coffee.dao.UsersDAO;
import com.doogwal.coffee.vo.Crew;
import com.doogwal.coffee.vo.CrewMember;
import com.doogwal.coffee.vo.MtpQuest;
import com.doogwal.coffee.vo.Question;
import com.doogwal.coffee.vo.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/createCrew.do")
public class CreateCrew extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name = req.getParameter("name");
		String coverImg = req.getParameter("cover_img");
		
		// WAS 기본 경로 = ServletContext
		ServletContext application = req.getServletContext();
		
		// 톰캣 경로
		String root = application.getRealPath("/");
		
		// upload 폴더 경로
		String uplodPath = root + "upload" + File.separator;
		
		MultipartRequest mr = new MultipartRequest(req,
				uplodPath,
				1024 * 1024 * 100, // 100메가
				"UTF-8",
				new DefaultFileRenamePolicy()
				); 

		
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
		
		// 크루장 번호 얻기
		User user = UsersDAO.selectUserOne(userNo); 
		Date d=new Date();  
        int year=d.getYear();  
        System.out.println(year);
        // 크루장 나이 얻기
        int age=year+1900-user.getBirthYear();
        // 크루장 성별 얻기
		char gender = user.getGender();
		int no=1;
		Crew crew;
		if(gender=='F') {
			crew = new Crew(minAge, maxAge, maxPop,1, categoryNo, 30000, age, 0, name, coverImg, intro);
		}else {
			crew = new Crew(minAge, maxAge, maxPop,1, categoryNo, 30000, age, 1, name, coverImg, intro);
		}
		int resultCrew = CrewsDAO.insertCrew(crew);
		System.out.println("result: "+  resultCrew);
		
		// 크루 이름으로 부터 번호 얻기
		int crewNo = CrewsDAO.selectCrewByName(name);
		
		System.out.println("crewNo:" +crewNo);
		
		String[] mtpQuests = req.getParameterValues("mtp_quest");
		String[] mtpAnswers = req.getParameterValues("mtp_answer");
		
		
		
		int mtpNumIndex=0;
		int ansLen=0;
		Question q;
		MtpQuest mtpQ;
		String[] types = req.getParameterValues("type");
		String[] mtpNums = req.getParameterValues("mtp_num");
		for(int i=0; i<mtpNums.length;i++) {
			System.out.println("mtpNums :" +Integer.parseInt(mtpNums[i]));
		}
		for(int i=0;i<types.length;i++) {
			if(types[i].equals("M")) {
				// insert Questoin
				q = new Question(crewNo, 'M', mtpQuests[i]);
				
				int qResult = QuestionsDAO.insertQuestion(q);
				
				// get Question no by crewNo
				List<Question> qNoList = QuestionsDAO.selectQuestionList(crewNo); 
				
				int qNo = qNoList.get(mtpNumIndex).getNo();
				int mtpNum = Integer.parseInt(mtpNums[mtpNumIndex++]);
				if(mtpQuests.length>0) {
					// 6 3 1
					// 123456 789 10
					for(int j=ansLen;j<ansLen+mtpNum;j++) {
						System.out.println(mtpAnswers[j]);
						mtpQ = new MtpQuest(crewNo, qNo, mtpAnswers[j]);
						int mtpQResult = MtpQuestsDAO.insertMtpQuests(mtpQ);
						if(mtpQResult==1) {
							System.out.println("mtpQresult 입력 완료");
						}else {
							System.out.println("mtpQresult 입력 실패");
						}
					}
				}
				ansLen += mtpNum;
			}
			else if(types[i].equals("S")) {
				// insert Questoin
				q = new Question(crewNo, 'S', mtpQuests[i]);
				int qResult = QuestionsDAO.insertQuestion(q);
			}else if(types[i].equals("F")) {
				// insert Questoin
				q = new Question(crewNo, 'F', mtpQuests[i]);
				int qResult = QuestionsDAO.insertQuestion(q);
			}
		}
		
		// 크루 삽입
		CrewMember crewMember = new CrewMember(crewNo, userNo, 0, 'C', 'A', "default.jpg",null);
		int crewMemberResult = CrewMembersDAO.insertCrewMember(crewMember);
		// 질문과 정답 얻기
		System.out.println("크루 insert:" + crewMemberResult);
		
		resp.sendRedirect("/index.jsp");
		
	}
	
}
