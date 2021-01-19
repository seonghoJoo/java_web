package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.CrewPost;
import com.doogwal.coffee.vo.PageVO;
import com.doogwal.coffee.vo.Post;

public class CrewPostsDAO {
	
	public static List<CrewPost> selectPostDetailList(PageVO pageVO) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("posts.selectPostDetailList",pageVO);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
	
	public static CrewPost selectPostDetailOne(int no) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("posts.selectPostDetailOne",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}//selectCheckNickname() end
	

}
