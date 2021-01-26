package com.doogwal.coffee.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.ReportsDAO;
import com.doogwal.coffee.vo.Report;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/ajax/reportCrewMemberPost.json")
public class ReportCrewMemberPost extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int crewMemberNo = Integer.parseInt(req.getParameter("crewMemberNo"));
		
		List<Report> reports = ReportsDAO.selectReportList(crewMemberNo);
		
		int oldPostNo = reports.get(0).getPostNo();
		
		for(int i=1;i<reports.size();i++) {
			
			int newPostNo = reports.get(i).getPostNo();
			if(oldPostNo == newPostNo) {
				
			}
		}
		
		resp.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(reports);
		out.print(json);
		
	}
}
