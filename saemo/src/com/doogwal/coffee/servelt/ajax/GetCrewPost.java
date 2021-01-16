package com.doogwal.coffee.servelt.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doogwal.coffee.dao.CrewMembersDAO;
import com.doogwal.coffee.dao.CrewPostsDAO;
import com.doogwal.coffee.dao.LikesDAO;
import com.doogwal.coffee.dao.PostImgsDAO;
import com.doogwal.coffee.dao.RepliesDAO;
import com.doogwal.coffee.vo.CrewMember;
import com.doogwal.coffee.vo.CrewPost;
import com.doogwal.coffee.vo.Like;
import com.doogwal.coffee.vo.PageVO;
import com.doogwal.coffee.vo.PostImg;
import com.doogwal.coffee.vo.Reply;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/ajax/getCrewPost.json")
public class GetCrewPost extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("application/json; charset=UTF-8");

		PrintWriter out = resp.getWriter();
		
		String crewNoStr = req.getParameter("crewNo");
		String startStr = req.getParameter("start");
		String endStr = req.getParameter("end");
		//String userCrewsStr = req.getParameter("userCrews");
		
		int crewNo = Integer.parseInt(crewNoStr);
		int start = Integer.parseInt(startStr);
		int end = Integer.parseInt(endStr);
		//int userCrews = Integer.parseInt(userCrewsStr);
		
		PageVO pageVO = new PageVO(start, end, crewNo);		
		List<CrewPost> list = CrewPostsDAO.selectPostDetailList(pageVO);
		
		SimpleDateFormat sdf = new SimpleDateFormat( "yy년 MM월 dd일 HH:mm:ss" , Locale.KOREA );
		
		for(CrewPost cp : list) {
			cp.setUserMember(CrewMembersDAO.selectCrewMemberOneByNo(cp.getMemberNo()));
			cp.setDateTime(sdf.format(cp.getRegdate().getTime()));
			Map<String,Object> map = new ConcurrentHashMap<String, Object>();
			System.out.println("postNo: " +cp.getNo() + "crewMemberNo: " + cp.getMemberNo());
			map.put("postNo",cp.getNo());
			map.put("crewMemberNo",cp.getMemberNo());
			cp.setReplies(RepliesDAO.selectReplyList(map));
			for(Reply reply : cp.getReplies()) {
				System.out.println("reply : "+reply.getReply());
			}
			cp.setPostImgs(PostImgsDAO.selectImageList(cp.getNo()));
			for(PostImg postImg: cp.getPostImgs()) {
				System.out.println("postImgs: "+ postImg.getImage());
			}
			
			cp.setLikeMembers(LikesDAO.selectLikesList(map));
			for(Like like: cp.getLikeMembers()) {
				System.out.println("like : " + like.getLikerNo());
			}
			
		}// for end
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(list);
		out.print(json);
	} 
		

}
