package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Question;

public class QuestionsDAO {
	
	
	/*
	 * 	2014 01 14 주성호 start
	 *  질문 넣기
	 * */
	public static int insertQuestion(Question question) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.insert("questions.insertQuestion",question);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}
	/*
	 * 	2014 01 14 주성호 end
	 *  질문 넣기
	 * */
	
	/*
	 * 	2014 01 14 주성호 start
	 *  질문 리스트 얻기
	 * */
	public static List<Question> selectQuestionList(int crewNo) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("questions.selectQuestionList",crewNo);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return null;
	}
	/*
	 * 	2014 01 14 주성호 end
	 *  질문 리스트 얻기
	 * */
	//- ------------------------------------------------------------------
}
