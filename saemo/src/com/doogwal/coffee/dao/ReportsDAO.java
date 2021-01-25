package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Report;

public class ReportsDAO {
	
	// 주성호 2021 01 25 start------------------------------
	// 신고 하기
	public static int insertReport(Report report) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.insert("reports.insertReport",report);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}
	
	// 신고 불러오기
	public static List<Report> selectReportList(int crewMemberNo) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("reports.selectReportList",crewMemberNo);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
	// 주성호 2021 01 25 end------------------------------
	
}
