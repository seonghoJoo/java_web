package com.doogwal.coffee.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Post;

public class PostsDAO {
	public static Post selectPostDetailOne(int no) {
		Post post;
		
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
	
	
	
	public static int postPushLike(int no) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.update("posts.postPushLike",no);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}
	
	public static int postUnPushLike(int no) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.update("posts.postUnPushLike",no);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}

	public static int insertPost(Post post) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.insert("posts.insertPost",post);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}
	
	public static int deletePost(int no) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.delete("posts.deletePost",no);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return cnt;
	}
	
	public static int selectpostNo() {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("posts.selectpostNo");
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return -1;
	}
	
	public static Post selectPostUpdateOne(int no) {
		Post post;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("posts.selectPostUpdateOne",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}//selectCheckNickname() end
	
}
