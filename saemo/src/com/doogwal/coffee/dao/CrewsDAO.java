package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Crew;

public class CrewsDAO {
	public static List<Crew> selectOwnList(int no) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("crews.selectOwnList",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
}
