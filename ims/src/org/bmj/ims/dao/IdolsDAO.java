package org.bmj.ims.dao;

import java.util.List;

//import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;
import org.bmj.ims.util.SqlSessionUtil;
import org.bmj.ims.vo.Group;
import org.bmj.ims.vo.Idol;
import org.bmj.ims.vo.PageVO;


public class IdolsDAO {
	
	public static List<Idol> selectList(){
		
		List<Idol> idols = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			idols = session.selectList("idols.selectList");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return idols;
	}// selectList() end
	
public static List<Idol> selectList(PageVO pageVO){
		
		List<Idol> idols = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			idols = session.selectList("idols.selectPageList", pageVO);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return idols;
	}// selectList() end
	
	public static int insert(Idol idol) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("idols.insert",idol);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return result;
	}//insert() end
	public static List<Idol> selectListByGroupId(int groupId){
		List<Idol> idols = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			idols = session.selectList("idols.selectListByGroupId",groupId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return idols;
	}
	
	public static Idol selectOne(int idolId) {
		Idol idol = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			idol = session.selectOne("idols.selectOne",idolId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return idol;
	}//selectOne() end
	public static int selectTotal() {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("idols.selectTotal");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return -1;
	}//selectOne() end
	
	public static int delete(int idolId) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.delete("idols.delete",idolId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return 0;
	}//delete()
	
	public static int update(Idol idol) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("idols.update",idol);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
				
		return result;
	}//update
	
}//IfolsDAO
