package com.bmj.model1.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
	
	private static SqlSessionFactory factory;
	
	static {
		
		try {
			
			Reader reader = 
				Resources.getResourceAsReader("com/bmj/model1/config/mybatis-config.xml");
			// SqlSessionFactoryBuilder객체 생성
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();

			// SqlSessionFactory객체
			factory = builder.build(reader);
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try~catch end
		
	}//static 
	
	public static SqlSession getSession() throws Exception {
		
		return factory.openSession(true);
		
	}

}
