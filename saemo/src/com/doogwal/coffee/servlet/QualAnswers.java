package com.doogwal.coffee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doogwal.coffee.dao.CrewAppsDAO;
import com.doogwal.coffee.dao.CrewMembersDAO;
import com.doogwal.coffee.dao.FileAnsDAO;
import com.doogwal.coffee.dao.SubjAnsDAO;
import com.doogwal.coffee.dao.UserAnsDAO;
import com.doogwal.coffee.vo.CrewApp;
import com.doogwal.coffee.vo.CrewMember;
import com.doogwal.coffee.vo.FileAns;
import com.doogwal.coffee.vo.SubjAns;
import com.doogwal.coffee.vo.User;
import com.doogwal.coffee.vo.UserAns;

@WebServlet("/qualAnswers.do")
public class QualAnswers extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 자기소개
		String introduce = req.getParameter("introduce");
		
		// 프로필
		String profile = req.getParameter("profile");
		
		// 질문 타입
		String[] types = req.getParameterValues("type");
		
		// 질문 번호 ex) P.K : 5039
		String[] qNoStrs = req.getParameterValues("qNo");
		for(String qNoStr : qNoStrs) {
			System.out.println("qNoStr: " + qNoStr);
		}
		
		// 객관식 질문 번호
		String[] mtpChoiceNoStrs = req.getParameterValues("mtpChoiceNo");
		int mtpChoiceIndex=0;
		
		// 유저 세션 얻기
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute(User.LOGIN);
		
		// 유저 번호
		int userNo = user.getNo();
		System.out.println("userNo: "+ userNo);
		/* 크루 신청 하기*/
		// 크루 번호 얻기
		int crewNo = Integer.parseInt(req.getParameter("crewNo"));
		System.out.println("crewNo: "+ crewNo);
		
		
		CrewApp crewApp = new CrewApp(crewNo, userNo);
		
		// 크루 신청 번호
		int crewAppsNo = CrewAppsDAO.insertCrewApp(crewApp);
		
		/* 크루원 넣기*/
		CrewMember crewMember = new CrewMember(crewNo, userNo, 0, 'M', 'W', profile, introduce);
		
		int crewMemberResult = CrewMembersDAO.insertCrewMember(crewMember);
		
		System.out.println("crewAppsNo: " + crewAppsNo + " crewMemberResult: " + crewMemberResult);
		
		// 답변 집어 넣기
		for(int i=0;i<types.length;i++) {
			char type = types[i].charAt(0);
			int qNo = Integer.parseInt(qNoStrs[i]);
			System.out.println("qNo: "+qNo);
			if(type=='M') {
				// 객관식 답변
					int mtpChoiceNo = Integer.parseInt(mtpChoiceNoStrs[mtpChoiceIndex++]);
					System.out.println("mtpChoiceNo: " + mtpChoiceNo);
					UserAns userAns = new UserAns(qNo, crewAppsNo, mtpChoiceNo);
					int userAnsResult = UserAnsDAO.insertuserAns(userAns);
					System.out.println("userAnsResult :" + userAnsResult);
			}else if(type=='S') {
				// 주관식 답변
				String answer = req.getParameter("answer"+i);
				System.out.println("answer:" + answer );
				SubjAns subjAns = new SubjAns(qNo, crewAppsNo, answer);
				int subjAnsResult = SubjAnsDAO.insertSubjAns(subjAns);
				System.out.println("subjAnsResult :" + subjAnsResult);
			}else if(type=='F') {
				
				// 파일첨부 답변
				String answer = req.getParameter("answer"+i);
				System.out.println("answer:" + answer );
				FileAns fileAns = new FileAns(qNo, crewAppsNo, answer);
				int fileAnsResult = FileAnsDAO.insertFileAns(fileAns);
				System.out.println("fileAnsResult :" + fileAnsResult);
			}// if~elseif~elseif end
		}//for i end
		
		resp.sendRedirect("/index.jsp");
	}
}
