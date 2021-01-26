package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Meeting;
import com.doogwal.coffee.vo.OngoingMeeting;

public class MeetingsDAO {
	//박형우 start -----------------------------------------------------------------------
	//20210116 start
	
		//진행중인 미팅을 가져오는
		public static List<OngoingMeeting> selectOngoingMeetings(int no) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.selectList("meetings.selectOngoingMeetings",no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return null;
		}
		
	//20210116 end
	//20210123 end
	
		//진행중인 미팅을 가져오는
		public static int insertMakingMeeting(Meeting meeting) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.insert("meetings.insertMakingMeeting", meeting);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return -1;
		}
	//20210123 end
	//20210125 start
	
		//밋팅신청 수락하는
	public static int updateAcceptMeetingApp(int no){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
		
			return session.update("meetings.updateAcceptMeetingApp", no);
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


