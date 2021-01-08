package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Employee;

public class EmployeesDAO {

	public static List<Employee> selectList() {

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("employees.selectList");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		
		return null;
	}
	
}
