package com.bmj.model1.dao;

import org.apache.ibatis.session.SqlSession;

import com.bmj.model1.util.SqlSessionUtil;
import com.bmj.model1.vo.Like;

public class LikesDAO {
	
	public static int delete(Like like) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("likes.delete",like.getNo());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//delete() end
	
	public static int deleteByArticleNo(int boardNo) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("likes.deleteByArticleNo",boardNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//delete() end
	
	public static int insert(Like like) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("likes.insert",like);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//insert() end
	
	public static Like selectOne(Like like) {
		Like result = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("likes.selectOne",like);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//selectOne() end
	
	public static int selectTotal(Like like) {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("likes.selectTotal",like);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return count;
	}//selectTotal() end

}
