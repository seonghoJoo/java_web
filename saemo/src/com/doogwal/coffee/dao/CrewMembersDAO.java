package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Crew;
import com.doogwal.coffee.vo.CrewMember;

public class CrewMembersDAO {

	
	/*
		2021 01 11 주성호 start
		header.jsp 크루 이미지
	*/
	public static String selectPresentImgOne(int no) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("crewMembers.selectPresentImgOne",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
	/*2021 01 11 주성호 end*/
	/*
		2021 01 12 주성호 start
		no로 부터 크루원 이름얻기
	 */
	public static String selectMemberName(int no) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("crewMembers.selectMemberName",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}

	//--------------------------------------------------------------------------------------------------------
	
	//정진하 0110 09:02
	//myPage.jsp에서 해당 유저가 속한 크루명 및 프로필 사진을 가져오기 위함
	public static List<CrewMember> selectJoinedCrewList(int userNo) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("crewMembers.selectList",userNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end 
		return null;
	}

}
