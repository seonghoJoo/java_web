package com.doogwal.coffee.dao;

import org.apache.ibatis.session.SqlSession;


public class AttendancesDAO {
	
		//2021 01 21 정진하 일정캘린더에서 참가자 수 뽑아오기 위함
		public static int selectTotalParticipants(int scheduleNo) {
		
		SqlSession session = null;
		
		try {
			session = com.doogwal.coffee.util.SqlSessionUtil.getSession();
			return session.selectOne("attendances.selectTotalParticipants",scheduleNo);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(session!=null) session.close();
			
		}//try~catch~finally end 
		
		return 0;
	}
		//2021 01 21 정진하 일정캘린더에서 불참가자 수 뽑아오기 위함
		public static int selectTotalNonParticipants(int scheduleNo) {
			
			SqlSession session = null;
			
			try {
				session = com.doogwal.coffee.util.SqlSessionUtil.getSession();
				return session.selectOne("attendances.selectTotalNonParticipants",scheduleNo);
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				if(session!=null) session.close();
				
			}//try~catch~finally end 
			
			return 0;
		}

}
