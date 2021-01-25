package com.doogwal.coffee.dao;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.CrewApp;

public class CrewAppsDAO {
	
	public static int insertCrewApp(CrewApp crewApp) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("crewApps.insertCrewApp",crewApp);
			return crewApp.getNo();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return -1;
	}
	
}
