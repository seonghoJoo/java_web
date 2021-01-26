package com.doogwal.coffee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Meeting;
import com.doogwal.coffee.vo.OngoingMeeting;

public class RulesDAO {
	//박형우 start -----------------------------------------------------------------------
	//20210123 end
	
		//밋팅 규칙 추가하는
		public static int insertMeetingRule(Map<String, Object> map) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.insert("rules.insertMeetingRule", map);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return -1;
		}
	//20210123 end
	//박형우 end -----------------------------------------------------------------------
}


