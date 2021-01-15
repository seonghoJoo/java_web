package com.doogwal.coffee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Like;

public class LikesDAO {

	public static List<Like> selectLikesList(Map<String,Object> map) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("likes.selectLikesList",map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
}
