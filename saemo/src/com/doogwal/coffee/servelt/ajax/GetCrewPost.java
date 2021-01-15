package com.doogwal.coffee.servelt.ajax;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doogwal.coffee.dao.CrewPostsDAO;
import com.doogwal.coffee.dao.LikesDAO;
import com.doogwal.coffee.dao.PostImgsDAO;
import com.doogwal.coffee.dao.RepliesDAO;
import com.doogwal.coffee.vo.CrewMember;
import com.doogwal.coffee.vo.CrewPost;
import com.doogwal.coffee.vo.Like;
import com.doogwal.coffee.vo.PostImg;
import com.doogwal.coffee.vo.Reply;

@WebServlet("/ajax/getCrewPost.json")
public class GetCrewPost extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String crewNoStr = req.getParameter("crewNo");
		//String userCrewsStr = req.getParameter("userCrews");
		
		int crewNo = Integer.parseInt(crewNoStr);
		//int userCrews = Integer.parseInt(userCrewsStr);
//		int crewMemberNo=0;
//		System.out.println(crewNo);
//		HttpSession session = req.getSession();
//		CrewMember crewMember= (CrewMember)session.getAttribute("userCrewList"+userCrews);
//		System.out.println("crewNo: "+crewMember.getCrewNo());
		
		List<CrewPost> list = CrewPostsDAO.selectPostDetailList(crewNo);
		
		
		for(CrewPost cp : list) {
			Map<String,Object> map = new ConcurrentHashMap<String, Object>();
			System.out.println("postNo: " +cp.getNo() + "crewMemberNo: " + cp.getMemberNo());
			map.put("postNo",cp.getNo());
			map.put("crewMemberNo",cp.getMemberNo());
			cp.setReplies(RepliesDAO.selectReplyList(map));
			cp.setLikeMembers(LikesDAO.selectLikesList(map));
			cp.setPostImgs(PostImgsDAO.selectImageList(cp.getNo()));
			for(Reply reply : cp.getReplies()) {
				System.out.println("reply : "+reply.getReply());
			}
			for(PostImg postImg: cp.getPostImgs()) {
				System.out.println("postImgs: "+ postImg.getImage());
			}
			for(Like like: cp.getLikeMembers()) {
				System.out.println("like : " + like.getLikerNo());
			}
		}
		
	} 
		

}
