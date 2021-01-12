package com.doogwal.coffee.servelt.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.CrewMembersDAO;
import com.doogwal.coffee.dao.CrewsDAO;
import com.doogwal.coffee.dao.PostImgsDAO;
import com.doogwal.coffee.dao.PostsDAO;
import com.doogwal.coffee.vo.CrewMember;
import com.doogwal.coffee.vo.Post;
import com.doogwal.coffee.vo.PostImg;

@WebServlet(value="/ajax/match_history.json")
public class PostPop extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String noStr = request.getParameter("no");
		int no = Integer.parseInt(noStr);
		
		//3초후에 응답
		//Thread.sleep(3000);
		
		// post 번호 받기
		Post post = PostsDAO.selectPostDetailOne(no);
		
		// 이미지 불러오기
		List<String> postImgs = PostImgsDAO.selectImageList(no);
		
		
		// 크루원 번호로 부터 크루 이름 얻기
		String name = CrewMembersDAO.selectMemberName(post.getMemberNo());
		
		// ObjectMapper
		
		
		out.print("{\"count\":"+cnt+"}");
		
	}
}
