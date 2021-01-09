package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Crew;
import com.doogwal.coffee.vo.CrewMember;

public class CrewMembersDAO {
	public static List<CrewMember> selectOwnList(int no) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("crewMembers.selectOwnList",no);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
}
