package org.bmj.guestbook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bmj.guestbook.util.SqlSessionUtil;
import org.bmj.guestbook.vo.Guest;
import org.bmj.guestbook.vo.PageVO;

public class GuestbookDAO {
	
	public static int insert(Guest guest) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("guestbook.insert",guest);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return -1;
	}// insert() end
	
	public static List<Guest> selectList(PageVO pageVO) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("guestbook.selectList",pageVO);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return null;
	}//selectList();
	public static int selectTotal(){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("guestbook.selectTotal");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return -1;
	}//selectTotal()
	
	public static int delete(int no) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.delete("guestbook.delete",no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return -1;
	}// delete() end
	
	public static Guest selectOne(int no) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("guestbook.selectOne",no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return null;
	}//selectList();
	
}
