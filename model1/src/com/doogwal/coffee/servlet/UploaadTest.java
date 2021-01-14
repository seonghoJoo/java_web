package com.doogwal.coffee.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/uploadTest.bmj")
public class UploaadTest extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// WAS 기본 경로 = ServletContext
		ServletContext application = req.getServletContext();
		
		// 톰캣 경로
		String root = application.getRealPath("/");
		
		// upload 폴더 경로
		String uplodPath = root + "upload" + File.separator;
		
		// multiprt/form-data는 
		// req.getParameter로 처리 불가
		// cos 라이브러리의 MultipartRequest 객체를 이용
		
		// 인자 5개
		// 1) HttpServletRequset 객체
		// 2) 저장할 경로
		// 3) 사이즈
		// 4) 파라미터의 인코딩 방식
		// 5) 파일명이 중복되었을 경우 처리를 위한 FileRenamePolicy(파일 이름 정책)객체
		MultipartRequest mr = new MultipartRequest(req,
				uplodPath,
				1024 * 1024 * 100, // 100메가
				"UTF-8",
				new DefaultFileRenamePolicy()
				); 
		
		resp.setContentType("text/html;charset=UTF-8");
		String id = mr.getParameter("id");
		String fileName = mr.getFilesystemName("test");
		PrintWriter out = resp.getWriter();
		out.print("<h1>" + id + "</h1>");
		out.print("<img src=\'/upload/" +fileName+"'>");

		
	}
	
}
