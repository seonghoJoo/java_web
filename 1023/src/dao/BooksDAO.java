package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import util.SqlSessionUtil;

import vo.Book;
import vo.PageVO;

public class BooksDAO {
	
	public static List<Book> selectList(PageVO pageVO){
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("books.selectList",pageVO);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
		
		return null;
	}// selectList()
	
	public static int selectTotal(){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			// Integer형으로 넘어오는데 int형임 언박싱이 일어남
			return session.selectOne("books.selectTotal");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}//try catch finally end
		
		return 0;
	}// selectTotal()
	
}
