package com.doogwal.coffee.dao;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Post;

public class PostsDAO {
	public static Post selectPostDetailOne(int no) {
		Post post;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			post = session.selectOne("posts.selectPostDetailOne",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}//selectCheckNickname() end
}
