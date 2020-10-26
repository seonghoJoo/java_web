package com.bmj.phonebook.dao;

import org.apache.ibatis.session.SqlSession;
import com.bmj.phonebook.util.SqlSessionUtil;

public class IPDAO {
	
	public static int selectTotal(){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("ip.selectTotal");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return -1;
	}//selectTotal()
	public static int insert(String ip){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("ip.insert",ip);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return -1;
	}//selectTotal()
}
