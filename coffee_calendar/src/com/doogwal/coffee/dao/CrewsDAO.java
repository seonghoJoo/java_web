package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Crew;

public class CrewsDAO {
/*
	2021 01 11 주성호 start
	가입된 크루 3개 보여주기
*/
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
	/*
	크루이름 겹치는지 확인
*/
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
/*
	2021 01 11 주성호 end
*/
//-------------------------------------------------------------------------------------------------
/*
	2021 01 17 정진하 start
	메인에서 모집중인 크루 가져오기!!
*/
	public static List<Crew> selectCrewsRecruiting() {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("crews.selectCrewsRecruiting");
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
	
		return null;
	}//selectCrewsRecruiting() end 
	
	public static String selectNameByCrewNo(int CrewNo) {
		String crewName = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			crewName = session.selectOne("crews.selectNameByCrewNo",CrewNo);
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return crewName;
	}//selectCheckNickname() end
}
