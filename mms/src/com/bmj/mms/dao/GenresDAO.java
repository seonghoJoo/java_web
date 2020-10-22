package com.bmj.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.mms.util.SqlSessionUtil;
import com.bmj.mms.vo.Genre;

public class GenresDAO {
	
	public static List<Genre> selectList(){
		List<Genre> genres = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			genres = session.selectList("genres.selectList");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return genres;
	}//selectList() end
	
	public static int delete(int no) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.delete("genres.delete",no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return -1;
	}//delete() end
	
	public static int insert(String name) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("genres.insert",name);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return -1;
	}//insert() end
	
	public static int update(Genre genre) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("genres.update",genre);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return -1;
	}//insert() end
	
	public static Genre selectOne(int no){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("genres.selectOne",no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return null;
	}//selectOne() end
	
}// GenresDAO end
