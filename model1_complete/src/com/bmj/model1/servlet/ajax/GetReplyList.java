package com.bmj.model1.servlet.ajax;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmj.model1.dao.RepliesDAO;
import com.bmj.model1.util.PaginateUtil;
import com.bmj.model1.vo.PageVO;
import com.bmj.model1.vo.Reply;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(value="/ajax/getReplyList.json")
public class GetReplyList extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		
		String pageNoStr = request.getParameter("page");
		
		String noStr = request.getParameter("no");
		
		int no = Integer.valueOf(noStr);
		
		int pageNo = Integer.valueOf(pageNoStr);
		
		int numPage = 5;
		
		PageVO pageVO = new PageVO(pageNo,numPage,no);
		
		List<Reply> list = RepliesDAO.selectList(pageVO);
		
		int total = RepliesDAO.selectTotal(no);
		
		int numBlock = 3;
		
		String url = "/article.jsp";
		String param = "no="+no+"&page=";				
					
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
		
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		
		modelMap.put("replyList", list);
		modelMap.put("paginate",paginate);
		modelMap.put("total",total);
		
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(modelMap);
		
		out.print(json);
		
	}
	
	

}
