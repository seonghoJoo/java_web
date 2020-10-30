package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Group;
import vo.PageVO;

public class GroupsDAO {

	public static List<Group> selectList(){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("groups.selectList");
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
			return session.selectOne("groups.selectTotal");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
		return -1;
	}//selectList() end
}
