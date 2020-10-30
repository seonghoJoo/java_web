package com.bmj.phonebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bmj.phonebook.util.SqlSessionUtil;
import com.bmj.phonebook.vo.PageVO;
import com.bmj.phonebook.vo.Phone;

public class PhonebookDAO {

	public static List<Phone> selectList(PageVO pageVO){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("phonebook.selectList",pageVO);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return null;
	}//selectList() end
	
	
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
		}//try catch finally end
		return -1;
	}//selectTotal() end
	
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
		}//try catch finally end
		return -1;
	}//delete(int no) end
		
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
		}//try catch finally end
		return -1;
	}//insert(Phone phone) end
	
	public static Phone selectOne(int no){
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
		}//try catch finally end
				
		return null;
	}//selectList() end
	
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
		}//try catch finally end
		return -1;
	}//update(Phone phone) end
	
}
