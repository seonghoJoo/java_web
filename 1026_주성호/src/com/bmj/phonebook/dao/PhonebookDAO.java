package com.bmj.phonebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.phonebook.util.SqlSessionUtil;
import com.bmj.phonebook.vo.PageVO;
import com.bmj.phonebook.vo.Phone;

public class PhonebookDAO {
	public static List<Phone> selectPageList(PageVO pageVO){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("phonebook.selectPageList",pageVO);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return null;
	}//selectTotal()
	
	public static int insert(Phone phone){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("phonebook.insert",phone);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return -1;
	}//insert()
	
	public static int update(Phone phone){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.update("phonebook.update",phone);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return -1;
	}//update(phone)
	
	
	
	public static Phone selectOne(int no) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("phonebook.selectOne",no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return null;
	}//selectOne()
	
	
	public static int delete(int no){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.delete("phonebook.delete",no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try~catch~finally end
		
		return -1;
	}//delete(no)
	
	public static int selectTotal(){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("phonebook.selectTotal");
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
