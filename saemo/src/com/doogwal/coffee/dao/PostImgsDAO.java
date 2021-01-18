package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.PostImg;

public class PostImgsDAO {
	public static List<PostImg> selectImageList(int postNo) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("postImgs.selectImageList",postNo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
	
	public static int insertPostImages(PostImg postImage) {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("postImgs.insertPostImages",postImage);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		return -1;
	}
	
	
}
