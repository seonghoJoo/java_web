package com.doogwal.coffee.dao;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Member;

public class MembersDAO {
	
	public static Member selectLogin(Member loginUser) {
		
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("members.selectLogin",loginUser);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//커넥션 풀에 반환하기
			session.close();
		}//try~catch~finally end
		
		
		return null;
	}
	
	
}
