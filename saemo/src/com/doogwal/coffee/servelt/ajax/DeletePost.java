package com.doogwal.coffee.servelt.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.PostsDAO;

@WebServlet("/ajax/deletePost.json")
public class DeletePost extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String postNoStr = req.getParameter("postNo");
		int postNo = Integer.parseInt(postNoStr);
		
		int result = PostsDAO.deletePost(postNo);
		
		System.out.println("result : " + result);
	}
}
