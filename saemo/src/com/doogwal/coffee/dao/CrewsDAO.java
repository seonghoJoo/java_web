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

	/*
	 	2021 01 14 주성호 start
	 	크루 생성
	 * */
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
	/*
 	2021 01 14 주성호 end
 	크루 생성
 * */
	
	/*
 	2021 01 14 주성호 start
 	크루 이름으로 번호 받기
	 * */
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
	/*
 	2021 01 14 주성호 end
 	크루 이름으로 번호 받기
	 * */
}
