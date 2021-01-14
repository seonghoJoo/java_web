package com.doogwal.coffee.servelt.ajax;

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

@WebServlet(value="/ajax/UploadCrewImage.json")
public class CrewUploadImage extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		// multipart/form-data로 넘기면 req.getParameter로 못받음
		// cos 라이브러리의 MultiprtRequest 객체를 이용해야함
		String type = req.getParameter("type");
		System.out.println(type);
		
		// WAS 기본 경로 = ServletContext
		ServletContext application = req.getServletContext();
		
		// 톰캣 경로
		String root = application.getRealPath("/");
		
		// upload 폴더 경로
		String uploadPath = root + "crew" + File.separator;
		System.out.println(uploadPath);
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
				uploadPath,
				1024 * 1024 * 100, // 100메가
				"UTF-8",
				new DefaultFileRenamePolicy()
				); 
		
		// FormData의 append 부분과 동일
		// 파일 이름 파라미터 명
		String imageName = mr.getFilesystemName("profile");
		
		//2) json으로 응답
		resp.setContentType("appliction/json; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		out.print("{\"profileName\" : \""+imageName+"\"}");
	}
	
}
