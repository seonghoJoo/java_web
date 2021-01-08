package com.bmj.model1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.model1.util.SqlSessionUtil;
import com.bmj.model1.vo.PageVO;
import com.bmj.model1.vo.Reply;

public class RepliesDAO {
	
	public static int delete(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("replies.delete",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//delete() end
	
	public static List<Reply> selectList(PageVO pageVO) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("replies.selectList" , pageVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return null;
		
	}//selectList() end
	
	public static int deleteByArticleNo(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("replies.deleteByArticleNo",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//deleteByArticleNo() end
	
	public static int insert(Reply reply) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("replies.insert" , reply);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return 0;
		
	}//selectList() end
	
	public static int selectTotal(int boardNo) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("replies.selectTotal" , boardNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return 0;
		
	}//selectList() end

}
