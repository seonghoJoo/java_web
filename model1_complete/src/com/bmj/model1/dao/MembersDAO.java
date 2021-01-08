package com.bmj.model1.dao;

import org.apache.ibatis.session.SqlSession;

import com.bmj.model1.util.SqlSessionUtil;
import com.bmj.model1.vo.Member;

public class MembersDAO {
	
	public static int insert(Member member) {
		int result = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("members.insert",member);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}
 	
	
	
	public static Member selectLogin(Member member) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			return session.selectOne("members.selectLogin",member);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	
	
	public static int selectCheckId(String id) {
		int cnt = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("members.selectCheckId",id);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}//selectCheckId() end
	
	public static int selectCheckNickname(String nickname) {
		int cnt = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("members.selectCheckNickname",nickname);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}//selectCheckNickname() end

}
