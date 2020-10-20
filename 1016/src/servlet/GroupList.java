package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GroupList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
		// 응답 컨텐츠 설정
		// content-type response로 오지 않음
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>그룹목록</title>");
		out.println("</head>");
		
		out.println("<body>");
		out.println("<h1>그룹목록</h1>");
		out.println("<ul>");
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","test","1111");
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT group_id,name,debut_date FROM groups ORDER BY 1");
			while(rs.next()) {
				out.print("<li>");
				out.println(rs.getInt(1)+") " + rs.getNString(2) + " " + rs.getDate(3));
				out.print("</li>");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
			}catch(Exception e) {
				
			}
			try {
				if(stmt!=null) stmt.close();
			}catch(Exception e) {
				
			}
			try {
				if(con!=null) con.close();
			}catch(Exception e) {
				
			}
		}
		
		
		
		out.println("</ul>");
		
		out.println("</body>");
		
		out.println("</html>");
	}
	
}
