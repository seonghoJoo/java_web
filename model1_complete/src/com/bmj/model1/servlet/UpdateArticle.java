package com.bmj.model1.servlet;




import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.model1.dao.BoardDAO;
import com.bmj.model1.vo.Article;


@WebServlet(value="/update.bmj")
public class UpdateArticle extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		int no = Integer.parseInt(request.getParameter("no"));
		
		
		System.out.println(title);
		System.out.println(contents);
		System.out.println(no);
		
		
		//순서 다름(입력과 수정)
		Article article = new Article(title,contents,no);
		
		System.out.println(article.getContents());
		System.out.println(article.getTitle());
		System.out.println(article.getNo());
		

		int result = BoardDAO.update(article);

		System.out.println("result:"+result);

		response.sendRedirect("article.jsp?no="+no);
		
	}

}
