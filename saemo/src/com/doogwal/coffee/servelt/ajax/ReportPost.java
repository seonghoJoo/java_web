package com.doogwal.coffee.servelt.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.ReportsDAO;
import com.doogwal.coffee.vo.Report;

@WebServlet("/ajax/insertReport.json")
public class ReportPost extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String postNoStr = req.getParameter("postNo");
		String reporterMemberNoStr = req.getParameter("reporterMemberNo");
		String writerMemberNoStr = req.getParameter("writerMemberNo");
		
		int postNo = Integer.parseInt(postNoStr);
		int reporterMemberNo = Integer.parseInt(reporterMemberNoStr);
		int writerMemberNo = Integer.parseInt(writerMemberNoStr);
		
		Report report = new Report(postNo, writerMemberNo, reporterMemberNo, type);
		
		int result = ReportsDAO.insertReport(report)
		
		
	}
	
}
