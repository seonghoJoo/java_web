package com.bmj.model1.servlet.ajax;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.model1.dao.LikesDAO;
import com.bmj.model1.vo.Like;
import com.bmj.model1.vo.Member;


@WebServlet(value="/ajax/like.json")
public class LikeContents extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2896438363169635195L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		int no = Integer.parseInt(request.getParameter("no"));
		String type = request.getParameter("type");

		Member loginMember = (Member) session.getAttribute("loginMember");

		Like searchLike = new Like(loginMember.getNo(), no, type);

		Like like = LikesDAO.selectOne(searchLike);

		if (like == null) {
			LikesDAO.insert(searchLike);
		} else {
			LikesDAO.delete(like);
		} // if~else end

		int count = LikesDAO.selectTotal(searchLike);
		
		out.print("{\"flag\":"+(like==null)+",\"count\":"+count+"}");

	}

}
