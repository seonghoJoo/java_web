package com.bmj.model1.servlet.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmj.model1.util.ResizeImageUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ajax/uploadImage.json")
public class UploadImage extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//ServletContext
		ServletContext application 
		= req.getServletContext();
		
		//파일업로드의 경로
		String rootPath = 
			application.getRealPath("/");
		
		System.out.println(rootPath);
		
		String uploadPath = 
				rootPath+"upload"+File.separator;
		
		//프로필 사진 모아놓는 폴더 경로
		String profilePath = rootPath+"profile"+File.separator;
		
		System.out.println(uploadPath);
		
		//MultipartRequest객체를 생성
		MultipartRequest mr 
		= new MultipartRequest(req,
				uploadPath,
				1024*1024*100,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		//응답 content type을 지정
		resp.setContentType("application/json; charset=UTF-8");
		
		//업로드한 파일 이름 얻기
		String fileName = 
				mr.getFilesystemName("uploadImage");
		
		
		String type = mr.getParameter("type");
		
		switch(type) {
		case "P" : 
			ResizeImageUtil.resize(uploadPath+fileName,profilePath+fileName,140);
			break;
		case "B" : 
			break;
		}//switch end
		
		//응답
		PrintWriter out = resp.getWriter();
		out.print("{\"imageName\":\""+fileName+"\"}");
		
	}//doPost() end

}

