package com.bmj.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.mms.util.SqlSessionUtil;
import com.bmj.mms.vo.Movie;

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
	
	
}//MoviesDAO
