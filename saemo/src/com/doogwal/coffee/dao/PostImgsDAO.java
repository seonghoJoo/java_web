package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;

public class PostImgsDAO {
	public static List<String> selectImageList(int no) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("postImages.selectImageList",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
}
