package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.MeetApp;
import com.doogwal.coffee.vo.Meeting;
import com.doogwal.coffee.vo.WaitingMeetingCrewsJson;

public class MeetAppsDAO {


	//박형우 start -----------------------------------------------------------------------
	//20210114 start
		//모임에 참석하는 유저를 가져오는
		public static List<Meeting> weApplymeetingList(int no) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.selectList("meetApps.weApplymeetingList",no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return null;
		}
	//20210114 end
//20210117 start
	
		//밋팅 데려오기 하는
		public static int bringMeeting(MeetApp meetApp) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.update("meetApps.bringMeeting", meetApp);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return 0;
		}
		
	//20210117 end
	//20210122 start
	
	//밋팅대기하는 크루 리스트 가져오는
	public static List<WaitingMeetingCrewsJson> selectWatingMeetingCrews(int no){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
		
			return session.selectList("meetApps.selectWatingMeetingCrews", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end 
		return null;
	}
	
	//20210122 end
	//20210125 start
	
	//밋팅신청 수락하는
	public static int updateAcceptMeetingApp(int no){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
		
			return session.update("meetApps.updateAcceptMeetingApp", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end 
		return -1;
	}
	
	//밋팅신청 수락한 후 나머지 크루들 거절시키는
	public static int updateAcceptMeetingAppAfter(int no){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
		
			return session.update("meetApps.updateAcceptMeetingAppAfter", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end 
		return -1;
	}
	
	//밋팅신청 거절하는
	public static int updateRejectMeetingApp(int no){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
		
			return session.update("meetApps.updateRejectMeetingApp", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end 
		return -1;
	}
	
	//20210125 end

	//박형우 end ----------------------------------------------------------------------- 

	
}
