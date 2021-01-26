package com.doogwal.coffee.dao;


import org.apache.ibatis.session.SqlSession;


import com.doogwal.coffee.util.SqlSessionUtil;


public class MeetingsDAO {
	//20210123 정진하 일정에서 포인트 정보 필요해서 작성함 
	public static int selectMeetingPoint(int scheduleNo){
		int point = 0;
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			point = session.selectOne("meetings.selectMeetingPoint",scheduleNo);			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			   if(session!=null) session.close();
			}
		
		return point;
	}
	
			

}
