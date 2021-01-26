package com.doogwal.coffee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doogwal.coffee.dao.MeetAppsDAO;
import com.doogwal.coffee.dao.MeetingsDAO;

@WebServlet("/acceptMeeting.doo")
public class AcceptMeeting extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//기본셋팅
		HttpSession session = req.getSession();
		
		//밋팅신청번호랑 밋팅번호 얻어오고
		int meetingAppNo = Integer.parseInt(req.getParameter("meetingAppNo"));
		int meetingNo = Integer.parseInt(req.getParameter("meetingNo"));
		
		//밋팅 수락하고
		int result1 = MeetAppsDAO.updateAcceptMeetingApp(meetingAppNo);
		System.out.println("result1 : "+result1);
		int result2 = MeetingsDAO.updateAcceptMeetingApp(meetingNo);
		System.out.println("result2 : "+result2);
		int result3 = MeetAppsDAO.updateAcceptMeetingAppAfter(meetingNo);
		System.out.println("result3 : "+result3);
	}
}
