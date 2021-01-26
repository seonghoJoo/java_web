package com.doogwal.coffee.dao;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Crew;
import com.doogwal.coffee.vo.MeetApp;


public class MeetAppsDAO {
	
	//정진하 20210123 일별일정에서 상대크루 정보 가져오기 위해 작성함
	public static Crew selectCrewInteractingWith(int meetingNo){
		
		Crew crew = null;
		SqlSession session = null;
		
		try {
			session=SqlSessionUtil.getSession();
			crew = session.selectOne("meetApps.selectCrewInteractingWith",meetingNo);			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			   if(session!=null) session.close();
			}
		
		return crew;
	}

	
}
