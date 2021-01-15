package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Article;
import com.doogwal.coffee.vo.Member;
import com.doogwal.coffee.vo.PageVO;

public class BoardDAO {

	public static int insert(Article article) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.insert("boards.insert",article);
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//커넥션 풀에 반환하기
			session.close();
		}//try~catch~finally end
		return -1;
	}
	
	
	public static List<Article> selectList(PageVO pageVO) {
		
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("boards.selectList",pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//커넥션 풀에 반환하기
			session.close();
		}//try~catch~finally end
		
		return null;
	}
	
	public static int selectTotal() {
		
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("boards.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//커넥션 풀에 반환하기
			session.close();
		}//try~catch~finally end
		return -1;
	}
	
	
	
}
