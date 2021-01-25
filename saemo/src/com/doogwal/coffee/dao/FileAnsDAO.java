package com.doogwal.coffee.dao;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.FileAns;
import com.doogwal.coffee.vo.SubjAns;
import com.doogwal.coffee.vo.UserAns;

public class FileAnsDAO {
	public static int insertFileAns(FileAns fileAns) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("fileAns.insertFileAns",fileAns);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return -1;
	}
}
