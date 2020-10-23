package com.bmj.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.mms.util.SqlSessionUtil;
import com.bmj.mms.vo.Movie;
import com.bmj.mms.vo.PageVO;

public class MoviesDAO {
	public static List<Movie> selectList(){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("movies.selectList");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return null;
	}//selectList() end
	
	public static List<Movie> selectList(PageVO pageVO){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("movies.selectPageList",pageVO);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return null;
	}//selectList() end
	
	public static int selectTotal(){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("movies.selectTotal");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return -1;
	}//selectList() end
	
	
	public static Movie selectOne(int no){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("movies.selectOne",no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return null;
	}//selectOne() end
	
	public static int delete(int no) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.delete("movies.delete",no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		//-1은 에러  0은 에러는 안났지만 안지워짐 
		return -1;
	}//delete() end
	
	public static int insert(Movie movie) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("movies.insert",movie);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		//-1은 에러  0은 에러는 안났지만 안지워짐 
		return -1;
	}//insert() end
	
	
	public static int update(Movie movie) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.update("movies.update",movie);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		//-1은 에러  0은 에러는 안났지만 안지워짐 
		return -1;
	}//update() end
	
}//MoviesDAO
