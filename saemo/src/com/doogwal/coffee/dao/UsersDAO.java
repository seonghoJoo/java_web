package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.User;


public class UsersDAO {
	/* 2021 01 12 주성호 header jsp start*/
	//로그인시 로그인할 수 있는 유저가 맞는지 확인하는
	public static User selectLogin(User user) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("users.selectLogin",user);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	/* 2021 01 12 주성호 header jsp end*/
	
	/* 2021 01 12 주성호 crew_create start*/
	public static User selectUserOne(int no) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("users.selectUserOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	/* 2021 01 12 주성호 crew_create end*/
	//--------------------------------------------------------------------
}
