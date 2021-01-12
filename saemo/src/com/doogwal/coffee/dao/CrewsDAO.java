package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Crew;

public class CrewsDAO {
	public static List<Crew> selectOwnList(int no) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("crews.selectOwnList",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
	
	public static int selectCheckCrewname(String name) {
		int cnt = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("crews.selectCheckName",name);
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}//selectCheckNickname() end
	
	public static int insertCrew(Crew crew) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.insert("crews.insertCrew",crew);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}
	
	public static int selectCrewByName(String name) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("crews.selectCrewByName",name);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}
}
