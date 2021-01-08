package com.bmj.model1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.model1.util.SqlSessionUtil;
import com.bmj.model1.vo.Article;
import com.bmj.model1.vo.Member;
import com.bmj.model1.vo.PageVO;

public class BoardDAO {
	
	public static int update(Article article) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("board.update",article);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//update() end
	
	public static int delete(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("board.delete",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//delete() end

	public static List<Article> selectList(PageVO pageVO) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();

			return session.selectList("board.selectList",pageVO);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}
	
	public static int updateHit(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("board.updateHit",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//selectList() end

	public static int insert(Article article) {

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();

			return session.insert("board.insert",article);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return -1;
	}
	
	public static int selectTotal() {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			return session.selectOne("board.selectTotal");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return -1;
	}
	
	public static int selectPageNo(int no) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			return session.selectOne("board.selectPageNo",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return -1;
	}
	
	public static Article selectOne(int no) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			return session.selectOne("board.selectOne",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

}
