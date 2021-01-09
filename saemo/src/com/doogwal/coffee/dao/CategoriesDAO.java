package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Category;

public class CategoriesDAO {
	public static List<Category> selectList() {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("categories.selectList");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
}
